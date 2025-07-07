---
title: Exceptions vs Wrapper Return Types
layout: post
---

## The possibilities

Here are two ways you can deal with something going wrong in your code in C#:

### Exceptions 

```C#
public int GetAnswer()
{
	if (someDependency.HasWhatWeNeed() is false)
	{
		throw new Exception("someDependency didn't supply what we needed");
	}
	return someDependency.Something() * 42;
}
```

### Returning failure
```C#
public Result<int> GetAnswer()
{
	if (someDependency.HasWhatWeNeed() is false)
	{
		return Result("someDependency didn't supply what we needed");
	}
	return Result(someDependency.Something() * 42);
}

public class Result<T>
{
	public readonly T Value;
	public readonly string Error;
	public Result(T value) { Value = value; }
	public Result(string error) { Error = error; }
	//...
}
```

(This is just a stub example of Result to illustrate what I'm talking about. A real Result type would need more a bit more thought than this. You could potentially use [OneOf](https://github.com/mcintyre321/OneOf) for your error return types.)


## Context

For most of C#'s life as a language exceptions have been a pretty normal way of getting things done.

For a web system, it's a common pattern to throw any time things aren't in place to proceed for any reason, and then have a broad catch in middleware that turns it into a sensible 500 exception and logs the exception to somewhere for troubleshooting.

Meanwhile other languages and paradigms have been learning from the real-world challenges of this approach and have been downplaying the role of exceptions for normal coding. In golang multiple-returns are used, with panic reserved for truly irrecoverable problems (e.g. out of disk space). In Rust normal error handling is done with [Options and Result types](https://dev.to/cthutu/rust-3-options-results-and-errors-part-1-4d52), and again has a less commonly used panic capability for catastrophic situations.

## Pros and Cons

Specifically within C# here's the reasons that would push you to chose one or the other approach:

### Exceptions

### In favour of exceptions

1. Minimal code required
2. Includes stack trace by default

### Against exceptions

1. More expensive than normal control of flow.
2. It is not possible to tell from looking at the GetAnswer() function signature whether the programmer expected this to fail under any circumstances, or whether it's something that can be relied on.

## Error Return types

### In favour of Error return types

1. Clear indication to reader that the author knew that this function could fail under known circumstances.
2. In the long run systems that rely heavily on exceptions eventually become a losing battle of endless exceptions in logs that never truly get dealt with and you can't tell the catastrophic urgent ones apart from the run-of-the-mill bearable problems. (I'm thinking support of production web systems here)
3. Forces a more thoughtful approach to failure modes of the system.
4. Marginal performance gain - only relevant for hot-path areas, trivial compared to optimising database/network/io areas.
5. Expression of intent: by throwing an exception the programmer is indicating "I never expected this to happen!!", by using an error return the programmer is saying "I know this can happen, but I can't carry on and the caller needs to deal with it."

### Against Error return types

1. More boilerplate code (because C# doesn't support this natively like Rust does)
2. Need to explain pattern to C# programmers who are used to relying on Exceptions

## How to choose

### Web systems & microservices

An illustrative example is a microservice having to handle being misconfigured:

* if all is well the system will be configured correctly
* misconfiguration can cause a system to fail
* the code can be expected occasionally have to deal with receiving bad config

Systems consist of many concentric circles, a library is used by a single web service, which is part of a microservices architected platform etc etc.

If a single web service throws an exception, it should indicate:

* that there is a programming error such as an unhandled enum value in a switch statement, or
* complete system failure in the microservice (e.g. out of memory/disk)

The case where the system is misconfigured should be handled without using an exception, but instead use error-return types to indicate that it is unable to perform its duties due the bad configuration it has been fed, rather than something unexpected going wrong.

### A rule of thumb

From my experience the heuristic to use is:

Restrict exceptions to all-gone-to-shit tear-the-stack-down-and-bail type failures.

Use return type errors to pass problematic conditions to callers to handle for anything your particular piece of code could reasonably be expected to have to deal with (bad inputs etc).

## A wealth of expressive options

Another way to think about this choice is that if you  only ever use Exceptions, or conversely if you only ever use return types to indicate failure you are missing out on a richer way of expressing your intent in code.

By using only exceptions your medium for expression is limited to:

1. Fail -> throw Exception
2. Success

By adding return type failures you have a third way to express yourself, allowing a richer communication with fellow programmers:

1. Catastrophic unexpected fail -> throw Exception
2. Fail that could be reasonably expected -> return error type
3. Success

Why would we opt out of any one of theses dogmatically as an absolute rule? The all have their place, even if we can argue and bike-shed endlessly about where to draw the lines.

There is value in consistency within a particular project with its own set of good tradeoff choices to be made. Do discuss the tradeoffs here with your team, and come to a consensus as to how you want to use these alternatives consistently withing your own project(s).

## Summary

1. Throw exceptions for thinks that should never happen if the code is correct and the host computer is functioning properly (unhandled enum in switch statement, out of memory)
2. Return error types for all failure modes that could be reasonably expected (missing config, dependent microservices down etc).

## Are you sure?

Not entirely, this is my best attempt at figuring out this issue having listened to others. There's still a bit of me that things that maybe exceptions are actually fine, are less code, and where we need to deal with specific conditions we can throw and catch custom exceptions seamlessly bypassing layers of code. I think that's probably my resistance to change and learning kicking in, and I trust that golang and Rust really are learning from the failures of Java and C# in this arena both in terms of performance and in terms of writing reliable and supportable systems.
