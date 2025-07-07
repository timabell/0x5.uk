---
title: "Running xUnit Test Setup Only Once Across Multiple Test Classes"
layout: post
---

⚠️ There is a problem with the approach below. Yet again I've been fooled/confused by the xUnit documentation, and this doesn't actually  do quite what I expected it to do when I tested it out for real. Once again I learn the lesson that I shouldn't rush things out the door because I'm running out of time in the moment, even though something doesn't seem right. I thought the incorrect behaviour was some minor bug in my example code, but it seem that collection fixtures just don't do what I (and the GPT it seems) thought they did.

I'll come back and rewrite this to be more accurate when I've finished researching the various behaviours and approaches within the example repo I'm working on - <https://github.com/timabell/CollectionFixtureXUnitExample>

In the meantime, know that an extension published by a different author does indeed give us the "setup once for all tests/classes" that we're looking for here: <https://www.nuget.org/packages/Xunit.Extensions.AssemblyFixture/> / <https://github.com/JDCain/Xunit.Extensions.AssemblyFixture>

Original post from here - still explains collection fixture usage, but they do not actually get re-used across multiple classes, only within a single class. Also watch out for thread safety as the fixtures instances seem to be used in parallel test runs so must be thread safe.

-----

I don't know about you, but I found the official [xUnit documentation on collection fixtures](https://xunit.net/docs/shared-context#collection-fixture) endlessly confusing when I actually just want to get my test setup to run the right number of times.

The one that particularly trips me up is preventing a setup method from being run twice when running multiple test classes all at once.

xUnit is probably the best test framework out of MSTest (yuk), NUnit and xUnit, but suffers from slightly arcane terminology and okay but sometimes confusing documentation.

This post captures all the pertinent pieces of the puzzle in one place along with some human explanation of the concepts involved.

The example code can be found at <https://github.com/timabell/CollectionFixtureXUnitExample>

## Step 1: Create a Fixture Class

First, create a class that contains the setup code that should only run once.

```csharp
/// <summary>
/// Setup / teardown code that the tests need to work.
/// </summary>
public class SharedFixture : IDisposable
{
    public SharedFixture()
    {
        Console.WriteLine($"Running {nameof(SharedFixture)} constructor -  Setup code that runs once across all test classes.");
    }

    public void Dispose()
    {
        Console.WriteLine($"Running {nameof(SharedFixture)} dispose -  Cleanup code that runs once after all tests are done");
    }
}
```

## Step 2: Create a Collection Definition

You need to define a test collection that allows you to connect the fixture to the test classes.

```csharp
/// <summary>
/// This exists to prevent xUnit running the SharedFixture setup more than once
/// concurrently when multiple test classes are executed at once,
/// and as a middle point in connecting the fixture to the test classes.
/// </summary>
[CollectionDefinition(nameof(SharedFixtureCollection))]
public class SharedFixtureCollection : ICollectionFixture<SharedFixture> { }

```

## Step 3: Decorate your test classes

1. Add the `[Collection]` attribute to each test class to tie them to the shared collection.
2. Implement the `IClassFixture<TFixture>` interface in each test class that needs to use the shared fixture.
3. Optionally add a constructor to accept the fixture if you need access to it during your tests.

By adding the `[Collection]` attribute, you associate the test classes with the shared collection, ensuring that the setup code in SharedFixture runs only once for all the classes in the collection.

By (optionally) adding the fixture as a constructor parameter xUnit will inject fixture object gives access to the fixture object.


```csharp
[Collection(nameof(SharedFixtureCollection))]
public class TestClass1 : IClassFixture<SharedFixture>
{
    SharedFixture _fixture;

    public TestClass1(SharedFixture fixture)
    {
        _fixture = fixture; // this is how you get access to the fixture from the tests
    }

    [Fact]
    public void Test2()
    {
        Console.Out.WriteLine($"- Running {nameof(TestClass1)}.{nameof(TestClass1.Test2)}");
        // _fixture.DoSomething();
        Assert.True(true);
    }

    [Fact]
    public void Test1()
    {
        Console.Out.WriteLine($"- Running {nameof(TestClass1)}.{nameof(TestClass1.Test1)}");
        Assert.True(true);
    }
}

[Collection(nameof(SharedFixtureCollection))]
public class TestClass2 : IClassFixture<SharedFixture>
{
    [Fact]
    public void Test3()
    {
        Console.Out.WriteLine($"- Running {nameof(TestClass2)}.{nameof(TestClass2.Test3)}");
        Assert.True(true);
    }
}

```

[According to Code Bob you can remove the inheritance of IClassFixture](https://medium.com/@codebob75/unit-testing-in-c-with-xunit-complete-guide-18ee2b919b05#:~:text=you%20can%20actually%20remove%20the%20following). At this point I'm pretty much too superstitious about all this to even try it. I might come back to this later.

## Pieces of the puzzle

### Per-class setup/teardown

For a single test class, xUnit just uses the normal constructor of the test class / fixture for setup, and by implementing `IDisposable` you can also implement a teardown, even for something expensive like clearing down or deleting a database or files.

If you don't need to co-ordinate this across test classes you can just use this without all the stuff in this post.

Note that xUnit does not re-use the test class object, and will generate a new object for every test in the class resulting in the constructor being run for every test ran that once for all the tests in a class. (This is the opposite of NUnit, which initialized the test class once and uses it for each test in the class, which is faster but risks contaminated state).

### Async setup/teardown

If your setup/teardown needs to use async method calls then you can implement `IAsyncLifetime` on your fixture to run the async tasks during setup/teardown.

See <https://stackoverflow.com/questions/25519155/await-tasks-in-test-setup-code-in-xunit-net>

### Collection "Fixtures"

The fixture would contain any code you need to create the correct state before the tests execute and cleanup afterwards.

### Test Collections

Confusingly these serve two completely unrelated purposes, and come in the form of both an attribute with a string collection name, and a class you can inherit from.

The `Collection` attribute can be used to:

- Provide a common setup class
- Prevent multiple test classes running in parallel

#### Test Collections - parallelism

By default tests within a class run in series, and test classes are run in parallel. By adding a named collection all tests in that collection will run in series.

E.g.

```csharp
[Collection("NonParallelCollection")] // prevent parallel run with TestClass2
public class TestClass1 { ... }

[Collection("NonParallelCollection")] // prevent parallel run with TestClass1
public class TestClass2 { ... }

[Collection("OtherCollection")] // will still run in parallel with 1 & 2
public class TestClass3 { ... }
```

For this use of collections  you do *not* need a collection class, just all the string names to match up.

For stronger naming make sure to use `nameof` or a `const string` to show that the strings are not just coincidentally the same and allow future developers to use "find references" to see what is using it.

Note that the other way to change it is with the `CollectionBehavior` assembly attribute: `[assembly: CollectionBehavior(...)]`

See <https://xunit.net/docs/running-tests-in-parallel#parallelism-in-test-frameworks>

#### Test Collections - a link to setup code

You can create a "fixture" class with setup/teardown code in it, but without further code xUnit will not know that your tests need it run.

To tell xUnit to actually run the setup/teardown, and this is one of the more mind-bending bits of xUnit, you have to pass your fixture class name as a generic parameter to the collection fixture interface when your "collection" class inherits from `ICollectionFixture`.

I.e.

```csharp
class SomeArbitraryCollection : ICollectionFixture<YourSetupFixture>
```

And then finally to actually connect the fixture to the test class being run,

1. Add a `CollectionDefinition` attribute to your collection class with an arbitrary string argument to give it a unique collection name
2. Annotated the test class(es) with a `Collection` attribute, **where the argument is the name"".

I.e.

```csharp
[CollectionDefinition("These Names Must Match")]
class SomeArbitraryCollection : ICollectionFixture<YourSetupFixture> {}

[Collection("These Names Must Match")]
public class TestClass3 { ... }
```

In my view this is a weakness of the xUnit API design. It's very hard to follow, and can fail at runtime if your constructor fixture doesn't match the generic type of the collection.

## Footnote - Assembly Parallelization

It's also worth knowing that the xunit test runner can *also* run multiple test assemblies in parallel, which could cause problems with trying to make sure your setup only runs once per test run.

`xunit.runner.json` configuration file to enable assembly parallelization:

```json
{
    "parallelizeAssembly": true
}
```

- <https://stackoverflow.com/questions/53955469/dotnet-test-how-to-run-xunit-tests-projects-in-parallel/53957938#53957938>
- <https://xunit.net/docs/running-tests-in-parallel#parallelism-in-runners>

## References

- <https://xunit.net/docs/shared-context>
- <https://stackoverflow.com/questions/13829737/run-code-once-before-and-after-all-tests-in-xunit-net/33778396#33778396>
- <https://github.com/xunit/samples.xunit/tree/main/v2>
- <https://medium.com/@codebob75/unit-testing-in-c-with-xunit-complete-guide-18ee2b919b05>
- <https://hamidmosalla.com/2020/01/26/xunit-part-4-parallelism-and-custom-test-collections/>
- <https://tsuyoshiushio.medium.com/controlling-the-serial-and-parallel-test-on-xunit-6174326da196>
- <https://github.com/xunit/xunit/issues/2099>
- <https://www.jimmybogard.com/integration-testing-with-xunit/>
