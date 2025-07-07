+++
path = "/2023/04/18/always-add-argument-names/"
title = "Always Add Argument (Parameter) Names"
+++

An argument (lol) for the use of explicit argument names in C# function calls even when they seem redundant.

1. You can assert correctness when reviewing the call site in a dumb text display (e.g. a patch in a github pull request)
2. Parameter-order refactoring won't introduce subtle bugs and breaking changes.

This is particularly important when you have multiple arguments of the same type.

It's also a good idea when the call doesn't immediately make it obvious what the meaning of the parameter is. E.g. `Foo(3)` vs `Foo(sizeInMeters: 3)`.

## No argument names (bad)

Starting point:

```c#
void Main()
{
	Foo("Home", "Blah"); // don't do this
}

void Foo(string importantThing, string otherThing)
{
	switch (importantThing)
	{
		case "Home":
			DoSomething();
			break;
		default:
			DoSomethingElse();
			break;
	}
	Log(otherThing);
}
```

If `Foo()` is defined in a different file it's hard to eyeball `Main()` and tell if the arguments line up properly.

If I now re-order the arguments of `Foo()` can you easily spot that the call site in `Main()` is now incorrect?

```c#
void Main()
{
	Foo("Home", "Blah"); // Now broken!! But can you tell?
}

void Foo(string otherThing, string importantThing) // <-- parameters flipped
{
	switch (importantThing)
	{
		case "Home":
			DoSomething();
			break;
		default:
			DoSomethingElse();
			break;
	}
	Log(otherThing);
}
```

## With argument names (good)

Starting point:

```c#
void Main()
{
	Foo(importantThing: "Home", otherThing: "Blah");
}

void Foo(string importantThing, string otherThing)
{
	switch (importantThing)
	{
		case "Home":
			DoSomething();
			break;
		default:
			DoSomethingElse();
			break;
	}
	Log(otherThing);
}
```

You can now easily see that `"Home"` is going to `"importantThing"`, even in a plain-text view of the file.

If I now re-order the arguments of `Foo()` again, it *doesn't* break because the compiler knows which string to connect to which parameter. Win.

```c#
void Main()
{
	Foo(importantThing: "Home", otherThing: "Blah"); // still valid!

}

void Foo(string otherThing, string importantThing) // <-- refactored
{
	switch (importantThing)
	{
		case "Home":
			DoSomething();
			break;
		default:
			DoSomethingElse();
			break;
	}
	Log(otherThing);
}
```

## Making Wrong Code Look Wrong

This piece of code-style opinion falls under "[Making Wrong Code Look Wrong](https://www.joelonsoftware.com/2005/05/11/making-wrong-code-look-wrong/)" as Joel Spolsky teaches.

## Using types

Having many parameters of the same types can be a code smell that it's time to move to stronger typing.

There's two ways you can do this:

1. Create a wrapper type for all the data you need and only have one parameter of that type.
2. Create meaningful types that wrap primitive types and pass those instead so that the compiler will check the right type of thing is going in as the right argument.


E.g. this:

```c#
void Foo(string importantThing, string otherThing)
```

becomes

```c#
void Foo(SomeThings things)
```

or

```c#
void Foo(ImportantThing importantThing, OtherThing otherThing)
```

Thus making the arguments impossible to mix up through being out of order.

## Primitive Obsession

It's also worth noting that lack of such custom types is an example of the coding smell / anti-pattern "primitive obsession", which is where there is insufficient use of the ability to create and use a richer type system than that supplied by the language.

Learn more about primitive obsession in these article:

- <https://blog.ploeh.dk/2011/05/25/DesignSmellPrimitiveObsession/>
- <http://grabbagoft.blogspot.com/2007/12/dealing-with-primitive-obsession.html>
- <https://www.freecodecamp.org/news/what-is-primitive-obsession/>
- <https://hackernoon.com/what-is-primitive-obsession-and-how-can-we-fix-it-wh2f33ki>

## Further reading

- <https://stackoverflow.com/questions/20601009/when-are-named-arguments-useful>
- <https://www.howtocodeit.com/articles/ultimate-guide-rust-newtypes> - this is in Rust but a good example of creating type wrappers to avoid primitive obsession and eliminate many parameter ordering issues
