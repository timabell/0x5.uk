---
title: "Why user stories should be shippable increments"
layout: post
---

Sometimes I see people create work items / jira tickets / user- stories that if they were implemented and merged in to the codebase would leave the system in a half-finished state, either broken or inconsistent.

## The problem with non-shippable tickets

This to me is instinctively a "bad thing", however as not everyone has grokked this important fundamental of team software delivery, I turned to chat gpt for an explanation of why I think this is important, and I have to say it did a stellar job of clearly explaining the things that I have absorbed over my decades of commercial software development. So here you go, here's why non-shippable tickets are a problem:

### Incomplete Features Impact User Experience

A half-finished feature can confuse users or negatively impact their experience. If the feature is exposed to users before it's fully functional, it may appear broken, resulting in dissatisfaction or mistrust in the system's reliability.

### Difficult to Test and Validate

Testing half-finished work is challenging, as it's not in a stable or coherent state. Quality Assurance (QA) teams need a fully functional piece of work to validate it against the requirements. When a ticket is only partially completed, it’s hard to determine if it meets the intended functionality or introduces bugs.

### Complicates Future Development

Leaving an unfinished task can create dependencies and conflicts with future work. If another developer later works on a related feature, they might have to deal with the incomplete state, which could introduce confusion or lead to mistakes in integrating related functionality.

### Increases Technical Debt

Incomplete features often accumulate as technical debt, which means extra work will be needed later to finish, refactor, or fix them. This can slow down future progress, as more time will need to be spent revisiting and cleaning up the half-finished work.

### Blocks Related Development

A half-finished ticket can block progress on other features that depend on it. For example, if a partially completed feature introduces bugs or changes a shared system in an untested way, it could delay the development of other tickets or cause cascading issues across the system.

### Reduces Team Efficiency

When a ticket is left in a half-finished state, developers may need to pick it up again later or pass it to another developer, leading to context-switching. This results in inefficiency, as time is wasted on re-clarifying the problem, re-understanding the code, and figuring out where the previous developer left off.

### Unclear Ownership and Accountability

If a ticket is left unfinished, ownership and accountability become unclear. Other team members may not know who is responsible for completing it or what still needs to be done, which can cause confusion and reduce productivity.

### Inconsistent System Behavior

Partial implementation can cause the system to behave inconsistently. For example, a feature that's half-completed might trigger errors, create discrepancies in data, or cause parts of the system to function incorrectly or unpredictably.

### Hinders Deployment and Releases

Half-finished tickets often disrupt deployment cycles, as incomplete features cannot be included in production. This results in unnecessary delays or the need to work around unfinished tickets, making releases more complex and error-prone.

### Wasted Effort and Resources

When a ticket is not fully completed, there's a risk that the work may be scrapped or need significant changes by the time it’s revisited. This can result in wasted development effort, resources, and time.

### Unmet Stakeholder Expectations

Leaving a ticket incomplete prevents stakeholders from seeing tangible progress, undermining confidence in the team's ability to deliver. Stakeholders expect finished, usable deliverables that they can review and assess, not half-completed tasks that require further work.

### Difficult to Manage in Agile Processes

In Agile and Scrum methodologies, the goal is to deliver shippable increments of work at the end of each sprint. Leaving a ticket half-finished breaks this cycle, making it hard to close sprints successfully and creating spillover tasks that carry into future iterations.

### In short

Avoiding half-finished tickets ensures that the system remains stable, progress is clear, and each ticket represents a functional, complete deliverable. This promotes better workflow, higher quality, and more reliable software.

## How to create small shippable batches

That's all very well you say, but I don't want to end up with giant, big-bang stories where engineering vanish for a month or six until every last thing works (if it ever does), so what to do?

Again I've turned to gpt as a starting point, and it's not done a bad job, I've done a bit more editing to this set and added some of my own thoughts:

### Use Vertical Slicing

Vertical slicing means breaking down features into small, independent pieces that cut through all layers of the stack (UI, backend, database, etc.) and provide end-to-end functionality. Each slice delivers a fully functional piece of the feature, even if it’s a smaller or simpler version of the final product.
Example: Instead of building a complete "user profile" page, deliver a ticket for "adding a profile picture" with all the components needed (UI, API, storage).

### Define Clear Acceptance Criteria

Each ticket should have clear, well-defined acceptance criteria that detail exactly what constitutes a “done” state. These criteria ensure that the ticket can be completed independently and is deliverable as a unit.

### Focus on the minimum viable product

Like the Minimal Viable Product (MVP) concept, you can apply the same thinking to individual product increments.

When designing features, focus on delivering the smallest possible version that is still valuable to users. This forces the team to identify the core functionality that is immediately useful, allowing for iterative improvement later.

Example: Instead of delivering a fully-featured analytics dashboard, start with a basic version that shows just the key metrics, and expand later.

### Implement Feature Flags

Use feature flags to allow partially completed features to be merged into the main codebase without affecting the user experience. This ensures that work can be released incrementally but hidden or disabled until it is complete.

Example: A half-built "comments section" can be developed over several tickets but hidden from users until all parts are ready.

### Break Down Complex Features

Complex features should be split into smaller sub-features that can each be delivered independently. Ensure that each sub-feature is fully functional, even if it doesn't have all the final functionality.


### Avoid Over-Engineering

Start with the simplest solution to a problem, and iterate.

Avoid adding extra complexity upfront by sticking to what’s necessary to fulfill the ticket’s requirements for delivery.

This includes "gold plating" and "future proofing" when implementing the ticket. Just do the minimum high-quality code that you *know* you need now.

### Make Use of Stubs and Mocks

To avoid leaving a ticket half-finished when other dependencies aren’t ready, use stubs or mocks for parts of the system that are still under development. This allows you to complete and deliver your ticket while waiting for those dependencies.

Example: If the backend API isn’t ready, a front-end ticket can use mock data to simulate responses, allowing the UI to be built and delivered without waiting.

This is more appropriate for very early product development rather than for modifying an established system.

### Communicate Dependencies Clearly

If a feature is dependent on other parts of the system, make sure the dependencies are identified and managed.

Sometimes it makes sense to coordinate related tickets so they’re developed together or in the right sequence.

Example: If a new API endpoint is needed for a UI feature, ensure the API ticket is prioritized so the front-end team isn't blocked, or vice versa.

### Collaborate in Cross-Functional Teams

Ensure cross-functional teams collaborate on the entire stack of a feature (UI, backend, database, etc.) within the same sprint or ticket. This ensures no part of the feature is half-done or stuck waiting for another team to finish their part.

Example: A ticket to create a new form should include front-end developers, back-end developers, and testers working together to ensure it's functional from end to end.

### Cross-functional brainstorming of story creation

There's nothing like all members of a team, including product, engineering, UX etc all sitting round a table and throwing around ideas to see if they can come up with a creative way to break down a problem into smaller but still shippable pieces.

I've repeated this exercise with many clients and the flashes of inspiration that come out of it cannot be replicated by thinking harder on one's own while starting at Jira.

## Summary

By structuring work this way, teams can maintain a balance between small, manageable batches of work and ensuring that each piece is fully deliverable and functional on its own.

This approach maximizes delivery velocity while maintaining system integrity and delivering value incrementally.
