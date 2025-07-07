---
layout: post
title: Java checked and runtime exceptions and how to transition
date: '2013-04-02T21:25:00.000Z'
author: Tim Abell
tags:
modified_time: '2013-04-02T21:37:03.810Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-2601004754756824237
blogger_orig_url: https://timwise.blogspot.com/2013/04/java-checked-and-runtime-exceptions-and.html
---

As primarily a C# programmer I've never been sold on checked exceptions, mostly seeing them as an unnecessary nuisance forcing programmers to introduce reams of boilerplate `throws` / `try-catch` blocks into their consuming code to propagate these exceptions up the stack.

Whilst coding on [https://github.com/timabell/FreeTTS](https://github.com/timabell/FreeTTS) I was forced to deal with this personal demon.

I've read that checked exceptions are a way of making exceptions be part of the declared API for some class or library, and that it forces client programmers to handle error conditions that the API programmer knows are likely to occur (e.g. the library relies on the filesystem internally so declares it throws a `IOException` when calling a relevant method.

I have some sympathy with this idea and can see how it can allow for more robust code when done well. My experience has generally been that it is not handled well and the reaction is to add a lot of meaningless code or to throw away the exception and hide the problem, causing difficulties troubleshooting later.

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/8278346178"><img
src="https://live.staticflickr.com/8337/8278346178_3bcf551666.jpg" alt="Photo of fungus on a tree"></a>
</div>

When I've been in control of the API I've been tempted to always throw runtime exceptions and avoid the problem entirely, however this time whilst working on someone else's class I came across a call to an external library that threw an `IOException` which I couldn't change. This made me think a bit harder about the problem. I initially thought my options were to immediately catch and rethrow as a runtime exception or to add `throws IOException` / `throws Exception` to every piece of the call chain.

I tried the latter approach of propagating the `throws` up through many layers, which although messy did work; right up until I hit a call within a `toString()` method, which is defined by `Object` and doesn't allow you to change the API of the method (by adding a checked exception).
Incidentally I think that having `toString()` rely on code that could throw a file system exception like this did is a dodgy design, but that wasn't my code and would have been a large rewrite.

So after a bit of grumbling to myself I looked more closely at the fault line between the checked exception being thrown and the rest of the codebase.
The existing code was just ignoring the error with `catch {}` (shudder) and returning `null`, making it hard to troubleshoot a failing JUnit test.

I think the answer to the conundrum is that for each method in the chain you have to decide if callers of the method could usefully handle the error condition, or whether they could add any useful information to the stack trace to assist troubleshooting. Here's roughly the approach I've taken which I think should be illustrative:

Method that throws

    String getSomething(string filename) throws IOException
    {
        // do some file IO
        return someData;
    }

Next method up. Doesn't compile as checked exception not handled, what to do?

    String loadFoo()
    {
        String foo = getSomething("this.txt");
        return foo;
    }

In this case I don't think `getSomething` should be the last point in the chain as it doesn't know _why_ it was performing the operation it was. `loadFoo` however knows both the resource being accessed and what the intent was, so can report an exception message that should point someone troubleshooting immediately to the source of the problem and inform them what the program was trying to achieve. Having `loadFoo()` declare that it `throws IOException` doesn't make sense as the caller shouldn't need to know how `loadFoo` gets its data, it's just the kind of noise that programmers dislike Java for. So the answer in my opinion is because `loadFoo()` is best placed to give all the useful information needed to fix the problem, it should catch the checked exception, wrap it in a runtime exception, add a useful message and rethrow it. This saves callers from needing to handle exceptions that they can't usefully deal with, whilst still providing good troubleshooting information. And yet there's still a use for the checked exceptions as `getSomething()` was able to declare that it knew an `IOException` was possible but that it wasn't in a position to give enough useful information.

So the final code I ended up with looked something like this:

    String getSomething(string filename) throws IOException
    {
        // do some file IO
        return someData;
    }
    
    String loadFoo()
    {
        String filename = "this.txt";
        try
        {
            String foo = getSomething(filename);
            return foo;
        } catch (IOException ex) {
            throw new RuntimeException("Failed to read foo from '" + fileName + "'", ex);
        }
    }

## Inversion of control (IoC)

A colleague of mine mentioned IoC as a problem for checked exceptions. This is an interesting point and does complicate things.

## References

*   [http://stackoverflow.com/questions/613954/the-case-against-checked-exceptions](http://stackoverflow.com/questions/613954/the-case-against-checked-exceptions)
*   [http://stackoverflow.com/questions/27578/when-to-choose-checked-and-unchecked-exceptions](http://stackoverflow.com/questions/27578/when-to-choose-checked-and-unchecked-exceptions)
*   [http://stackoverflow.com/questions/1656376/why-are-runtime-exceptions-unchecked-in-java](http://stackoverflow.com/questions/1656376/why-are-runtime-exceptions-unchecked-in-java)
*   [http://stackoverflow.com/questions/4639432/checked-vs-unchecked-exception?rq=1](http://stackoverflow.com/questions/4639432/checked-vs-unchecked-exception?rq=1)
*   [http://stackoverflow.com/questions/3613422/exception-handling-in-java?rq=1](http://stackoverflow.com/questions/3613422/exception-handling-in-java?rq=1)
*   [http://docs.oracle.com/javase/tutorial/essential/exceptions/runtime.html](http://docs.oracle.com/javase/tutorial/essential/exceptions/runtime.html)
