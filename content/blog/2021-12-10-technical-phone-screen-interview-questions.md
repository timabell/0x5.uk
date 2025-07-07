---
title: Technical phone screen interview questions
layout: post
---

I was tasked with giving an initial assessment of technical competence / fit in a 30 minute phone call.

This tech screen is based on [Steve Yegge’s "The Five Essential Phone-Screen Questions"](https://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions)
My lightweight version goes something like this:

## 1) Coding

Ask them to describe the code for a console app that prints the ten-times table in a grid. This is intended to get them to describe a nested for loop, or maybe some fancier construct. It doesn’t matter if they nail it, you can tell if they understand how to code from how they talk about it. Bonus for whether they can understand a verbal description (possibly imperfectly described), and throw together a solution in their head.

This isn’t a substitute for an in-person pairing session, but it gives a quick indication whether they have a clue how to code.

It's supposed to be something like this, which is remarkably hard to explain on the phone from my side (no points deducted for my inability to be clear!):

```
1	2	3	4	5	6	7	8	9	10
2	4	6	8	10	12	14	16	18	20
3	6	9	12	15	18	21	24	27	30
4	8	12	16	20	24	28	32	36	40
5	10	15	20	25	30	35	40	45	50
6	12	18	24	30	36	42	48	54	60
7	14	21	28	35	42	49	56	63	70
8	16	24	32	40	48	56	64	72	80
9	18	27	36	45	54	63	72	81	90
10	20	30	40	50	60	70	80	90	100

```

([gist](https://gist.github.com/timabell/6aaf930fa97854584192faa9ca81e290))

## 2) OO design (and other structures)

Ask them to describe how they can arrange their code, giving a hint that I’m after object oriented things. I’m looking for a confident off-hand description of inheritance, interfaces etc.

If they don’t fluff that, ask if they know non-OO approaches (composition, modules, mixins etc) that are used in languages other than C# to see how broad and deep their knowledge is.

## 3) Scripting & Regex

Context: It’s not uncommon for microsoft devs to never look outside the microsoft sandbox. This can result in someone spending week(s) writing a program to solve a problem that can be done with one linux command. Times are changing and Microsoft loves linux, but these narrow thinkers are best avoided. This question is almost pointless for ruby devs who live in unix land.

Question: you have a server with thousands of plain-text log files scattered across hundreds of folders and you need to find all the lines with a particular user-id in them to solve a production problem.

Good answer: `grep` (this means they know of unix tools, maybe probe how wide that is)
Bad answer: I’d start a new project in visual studio and use FileInfo classes…

Follow up question: what if you needed to find an identifier that matched a pattern but wasn’t always the same? (i.e. do they know about regex)

Great answer: I’d use `egrep` with a regex (or similar tools); goes on to explain a bunch of great tools I hadn’t heard of before

If they have other smart ways (e.g. they know about log aggregation tools like Kibana), guide them back to a limited toolset (“it’s a legacy system, you haven’t got any of that...”)

## 4) Data Structures

Do they know the difference between dictionaries and lists, particularly when it comes to speed of lookup.

Related: Do they know about [algorithmic complexity](https://www.bigocheatsheet.com/) - this sorts the self-taughts from the computer-science degree crowd, but if you don’t know this stuff it’ll bite you sooner or later.

See if they are aware of the available structures.
See how clearly they can explain why you’d choose one over the other for a particular piece of code.
It doesn’t matter if they can recall the specifics, it just matters that they’d think to go and look up the specifics when they needed to decide.

## 5) Bits and bytes

Do they know why you don’t store money in floating point variables?

Great: use decimal instead because floating point cannot accurately represent decimal fractions and will give you rounding errors that upset the accountants and customers
Okay: always use decimals, but don’t really know why
Bad: I’d use a float for money

---

So that’s it for Steve’s list.

I also like to ask them how they feel about the following:

## 6) Testing

Are they militant about TDD? What do they think about BDD? Are they more pragmatic?

How do they think about why you write tests.

This isn’t likely to be make or break, but might indicate better or worse fit with a team and is good to know.

## 7) Agile

What kind of agile structures have they worked in. What did they think about it.

I’m looking for enthusiasm for the way the best agile teams operate, it doesn’t matter too much if it’s SCRUM or something else. Do they seem like they’d be adaptable? Would they push for better?

Have they worked on GDS style teams? (For gov work)

## Assessment

During the debrief I usually discuss at least some of the following areas, focussing on what seems to be the make or break points:

* skill / knowledge level: architect & team lead > senior engineer > narrow senior engineer > competent > hand-holding needed > complete liability
* communication style, ability to discuss piece of theoretical code
* attitude towards tech (e.g. do they demand testing or are they more “pragmatic”)
* attitude towards and organisational structures and approaches (i.e. scrum or GDS team structures)
* how they would likely fit in with the intended team

Some example outcomes of the technical assessment might be:

* Strong - knew everything, broad knowledge, could clearly do the job
* Qualified positive - can probably build something within some boundaries, but you’d want a strong tech lead in charge to keep things on track
* Weak - lacking knowledge of important areas of tech, failed to explain a good solution to a simple nested loop problem

## Bias and scoring

To minimize risk of bias sneaking in and giving me a "favourite" based on how similar they are to me rather than how well they did I like to do a written report scoring each area above.

