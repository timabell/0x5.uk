---
title: Single class per file
layout: post
---

Reasons you should prefer a single `class` / `interface` / `record` / `enum` / `struct` per file in C# projects.

## Congitive load

Multiple types per file increases the cognitive overhead of remembering where everything lives.

When working on a project, having to remember where each thing is hidden and how things are organised is extra mental load that can be eliminated by following the simple rule of "every class gets a file" regardless of how trivial or short they may be.

## Reduced dependence on IDE support

IDEs that can jump to a definition are not the only tool we use to inspect and navigate code.

By hiding multiple types in a file where the name doesn't match you make it harder to operate in a codebase without a full IDE.

You might be an IDE-only developer but not everyone operates that way, and you might be missing out on some other excellent tools out there.

## Git merge conflict avoidance

You are more likely to run in to merge conflicts if you put types all together in one file as multiple developers work on a project. Especially when things get moved / renamed / refactored.

## Simple refactoring

Putting multiple things in a file breaks refactoring tool flows (resharper) which assume they can rename files to match types.

## Can be applied consistently

Having multiple types per file requires you to make constant judgement calls about what goes together in one file and what is separate. Different developers will inevitably make different judgement calls.

This problem can be entirely eliminated by sticking to class-per-file.

It is impossible to come up with a concrete rule for exactly what goes together in a file and what is separate, whereas the rule of one-class-per-file is trivial to apply consistently.

## Avoid need for additional naming

If you have one class in a file you can name the file the same as the class. If you have two types in a file what do you name the file?

If you have two types in a file you now have to come up with a *third* name that covers both things, or use the name of only one of the things, which is then misleading / surprising. By having a class per file you eliminate this entirely.

## But wait, what about tiny little records

A project I was on recently made heavy use of the newer [`record`](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/record) type, which is cool because they're (usually) immutable. In that project there was a coding style of lumping all related records together in one file, and I must confess that I'm happy to make the exception for tiny one-line record types that only exist as child types to a parent record, and they can go in the parent's file. As soon as they are shared between two parents at that point they have to go in their own file otherwise the structure makes no sense any more.

For example if `Pet` is only referenced through Person then I'm cool with `Tattoo` living in `Person.cs`:

```c#
public record Person(string FirstName, string LastName, Hair Hair, List<Tattoo>);
public record Hair(string Colour, int LengthCm);
public record Tattoo(string Description, bool HasColour);
```

Without accepting this nuance the result is thousands of tiny files, which ends up being harder to navigate. Use your judgement wisely.

## I hear C and Rust like huge files

I have seen in Rust at least that there's a cultural preference for "one big file" that defines a whole thing. This is interesting, but not something I'd be keen to import into C# projects which have a much stronger thing-per-file heritage and where I've seen both and far prefer the class per file style.
