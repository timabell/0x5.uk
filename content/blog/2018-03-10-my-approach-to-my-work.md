---
layout: post
title: My approach to my work
categories: [contracting,self]
---

I've realised that something that sets me apart from other developers with similar buzzwords on their CV is the way I think about things and the principles I think are important. But I've never put them on my CV or tried to express them in writing before. I'm not perfect and may fall short sometimes but these are the perfection I strive for.

## Tell the Truth, Even if it's Hard

I don't believe in selling good news only and robbing people I work with of the negative information that could be critical to making good decisions. E.g is this project going as well as expected?

*   No. - opportunity to take corrective action by those with the authority to make sweeping changes
*   Yes (a lie) - temporary happiness followed by reality catching up and being in an even worse situation

Great episode on the matter: The Startup Chat with Steli and Hiten: 288: Startup Lies <https://thestartupchat.com/ep288/>

## Strong Opinions, Weakly Held

Which means I have strong opinions about what the right thing to do is based on my experience and the information available at the time, but that if I am presented with new information then I am open minded to changing my opinion. I first heard about this while on contract with GDS, an organisation with an amazing culture for doing the right thing and getting things done. Here's a small example: I spent many many years preferring the C# style of skipping curly-braces for one-line `if` blocks, based on the understanding that the less boiler-plate there is the easier it is to read the code. And then a fellow dev argued that it was better to always include them for the sake of reliability. I was initially unconvinced, but I always appreciate hearing a contrarian view and I proceeded to research extensively the pros and cons. Given the constant problems with indentation (spaces/tabs) in many projects that can make an if block look like something it isn't if you aren't paying close attention, and the automatic merge present in many source control systems, I was persuaded to change my view and [will now argue just as strongly for the new stance](/2018/08/28/always-add-braces/). For an excellent example of a serious security problem that might have been avoided by always having braces, read the "[explanation of Apple's goto fail SSL bug](https://nakedsecurity.sophos.com/2014/02/24/anatomy-of-a-goto-fail-apples-ssl-bug-explained-plus-an-unofficial-patch/)", a coding error which has the hallmarks of an unfortunate choice made by a merge algorithm.

## Communicate to be understood

I've had feedback that my communication with stakeholders is good, and that I can explain complex technical issues clear to less technical people. I think it's important that those around a project such as senior stakeholders, users, related support people and collaborating suppliers all have the best understanding of the state of a project and any issues. Without clear information in a language they are comfortable with then they are left unable to help the project succeed. I think it's important not to dumb things down as that results in losing important details, but instead take the time to help people understand the details they need to and why they might be important. As the technical experts it's up to us to make sure that others have the knowledge they need to do their jobs the best they can.

## Help others

I've also had feedback that one of my strengths is mentoring and sharing knowledge with other team members, technical and non-technical. It's certainly true that I do love helping others improve their own skills and knowledge where I can, and sharing what I've learnt over the years (ahem, decades). This is partly just because I love what we can do with technology and want everyone to gain the maximum benefit from it.

## Continuous Personal Improvement

I read the [7 habits of highly effective people](http://amzn.to/2FBTBJc) by Covey many years ago, and it is truly life changing because it changes your thinking from fatalistic "this is how I am" to "I can become a better person", and gives you some great mental tools for doing so. I have practised this consciously ever since. I particularly liked the quote I heard recently "_What would you tell your younger self? Nothing, they wouldn't be able to understand what I know now, I'm a different person_" (or words to that effect).

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/40044785284/"><img
src="https://live.staticflickr.com/4786/40044785284_22f105fa2d.jpg" alt="IMG_20171229_114959"></a>
</div>

## Follow Programming Best Practice

Our industry has learnt a lot over the last 50-odd years about what's effective. A lot of best practice has been captured in books, internet articles, and importantly libraries and frameworks. Strive to stand on the shoulders of the giants.

## Elegance, Practicality, and Definitely No Dogmatism

It's easy to get drawn in to the latest hip thing and apply it to everything you do no matter how inappropriate. Every situation should be assessed for the trade-offs that will be appropriate. One of the challenges of defining best practice in programming is the variety of problems it is used to solve. Should we use the same rules to produce a life-support system with no ability to push updates out as we should for a startup SaaS with no users yet? Clearly not, yet you'd wonder given some of the views presented; usually of the form "_This worked on my project so you MUST now use it in ALL YOUR CODE!!!_" (This is the way Test Driven Development was introduced to me, and eventually I realised this is probably because it came largely from the dynamic language Ruby that lacks all the compile time checks I'm used to in C#, and as such complex systems have more failure modes as the codebase changes over time, resulting in a greater value of extensive unit testing.)

## Emergent Architecture

Planning is good, don't get me wrong. But don't restrict your options until you need to. The idea of emergent architecture is do the simplest thing that will work (following the You Aren't Going to Need It principle, aka YAGNI), and then as it becomes apparent you have a need for a particular abstraction or pattern that's when you apply it, through the magic of refactoring. I've seen too many projects that have been made many times more expensive than necessary because at an early point in the project a developer who had previously been burned by a lack of some structure or other made damn sure it was in their next project, regardless of whether it was actually necessary for the problem at hand. Another classic is learning of a pattern and applying it without it actually being needed. A common example of this I've seen is adding a "repository" layer to a codebase on top of entity framework, not realizing that [entity framework already implements the repository pattern](https://softwareengineering.stackexchange.com/a/220126/48240) (along with the unit-of-work pattern). I spent years learning about the various approaches to the architecture of software projects. Initially I thought I need to apply all of this best-practice to every project, but was troubled by how long that would take and found myself guiltily doing just enough to get the job done.

## Technical Debt and Refactoring

Refactor problematic things as they cause you problems. Simple. I really can't say it better than this: [https://ronjeffries.com/xprog/articles/refactoring-not-on-the-backlog/](https://ronjeffries.com/xprog/articles/refactoring-not-on-the-backlog/)

## The Agile Thing

I learned about eXtreme Programming (XP), scrum & kanban (I've actually worked in a real factory that used kanban). I've worked in many teams at various levels of competence on the whole "agile" thing and to me it seems to be down to good people making the best use of the available ideas for the problems at hand. Got no process at all, or something horribly like a waterfall? Add some elements of scrum and get better. Nailed scrum and feeling constrained? Do some more reading up, decide where to go next. I don't pretend to be an expert in "agile", but I love working in effective teams making use of the best methods available, and I love helping teams improve where I can. I'm not particularly interested in climbing the management-track ladder, I'm happy to work as a member of great teams. You can't do it all, and I don't want to get too far from my coding skills.

## Resources

These are things I've read that have guided my thinking towards where it is today (along with my personal experiences).

### Books

*   [Mythical Man Month](http://amzn.to/2IoECzU) - a timeless classic

### Refactoring and technical debt

*   <https://ronjeffries.com/xprog/articles/refactoring-not-on-the-backlog/>
*   <http://laughingmeme.org/2016/01/10/towards-an-understanding-of-technical-debt/>

### Compassion

*   <https://jml.io/pages/your-code-sucks-and-i-hate-you.html>

### Technical details

*   <http://endoflineblog.com/gitflow-considered-harmful/>

### New thinking

Things that I've recently come across that I wish to share / promote

*   <https://simpleprogrammer.com/agile-is-dead-code-review/>

* * *

## Get In Touch

If you need someone who you can rely on to bring more than just a list of keywords to your project then get in touch: [tim@timwise.co.uk](mailto:tim@timwise.co.uk)
