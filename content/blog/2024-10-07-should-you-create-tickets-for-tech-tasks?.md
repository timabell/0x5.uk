---
title: "Should you create tickets for tech tasks?"
layout: post
---

In the manner of choosing the colour to paint the bikeshed, the decision of whether to create a ticket for every single tiny commit, no matter whether it's a giant feature or the tiniest whitespace cleanup in the readme file continues to consume countless hours. This question is not really that important when it comes to delivering software, yet it still comes up from time to time and there is a right and wrong answer, which should be modified only with consideration for the current situation.

## In short

- Correct: create tickets only for features and larger technical work. Allow engineers to commit smaller improvements ad-hoc.
- Incorrect: create an atmosphere of stifling bureaucracy where all attempts to keep the work area tidy will require sign-off from the CFO and approval from the product owner who has never written a line of code (some have, but that's a rare wonder).

## Who cares?

If anyone wonders why engineers get *so* bent out of shape about this seemingly harmless request, imagine if someone asked you to fill out a form and submit it for every single piece of your work that you currently don't have to. Want to pick up the phone?… create a ticket. Want to send an email?… - create a ticket. Can you imagine that this might make you a) miserable, b) less productive, and c) give up trying to do more than the bare minimum.

By requesting tickets for everything you are introducing friction directly into the path of a programmer's most important output - the codebase.

As experienced developers we instinctively know that fast iteration and short cycle times lead to better delivery of value to users, and instinctively dislike anything that gets in the way.

That the need for "auditing" and "why it changed" are already covered by source control history (git) and "pull requests" so adding a requirement for tickets is redundant toil with little additional benefit.

## Turning to GPT for explanations

And now, given that there can be reasons for adding a ticket link to everything (for example generating change logs from git), and in the modern tradition, we turn to ChatGPT for a properly argued discussion of both sides of the argument.

The following is an edited result of my discussion with ChatGPT on the subject. Should you find yourself in the situation where someone has decided that every brush stroke during the painting of the bikeshed should require a JIRA ticket then this article will provide a handy reference to all the arguments that can be made around this oh-so-trivial subject.

I particularly like the fact you can ask GPT to write in the styles of different personas, so first we have the curt "lead dev" version that gets to the point and is devoid of superfluous wording, empathy, and any other affordances to anyone who thinks in any other way than the tech lead; and then we have the more wordy default style of GPT that explains the points a bit more fully for the benefit of those who need a bit more explanation around the subject. Both are useful depending on the audience, so take your pick.


## Tech-lead-GPT Says…


Following the usual wordy explanation I fed GPT this follow-up prompt:

> "write it in the style of a busy lead dev engineer - still too fancy and formatted. plain ascii, missing capitalisation in places, nothing more than the bare facts"

And got this straight-to-the-point explanation, lazy capitalization and all:

requiring a ticket for every tech improvement pr has upsides but will slow us down in key areas. here’s why:

pros:

- prioritization: a ticket makes sure we focus on impactful work. it forces us to ask if this improvement is really needed now or if it can wait.
- consistency: everyone follows the same process. good for cross-team work or when other stakeholders need visibility.
- accountability: tickets clarify why a change is being made, what the risks are, and who owns it.

cons:

- overhead: creating tickets for minor improvements (e.g. small refactors or cleanup) adds unnecessary steps. this slows devs down and eats up time for actual coding.
- discourages quick fixes: devs spot opportunities to fix things as they go. forcing them to stop and make a ticket breaks their flow and makes it less likely they’ll bother with small but important changes.
- ticket bloat: if every tiny improvement needs a ticket, we’ll end up with a cluttered backlog full of minor stuff, making it harder to see what's actually important.
- developer autonomy: devs should be trusted to make small improvements without red tape. too many rules can kill morale and make them feel micromanaged.

suggestion:

- use tickets for significant changes (major refactors, cross-team impact, etc.), not small things like code cleanup or minor improvements.
- use pr descriptions to document and discuss small technical changes. keeps things lightweight without losing track of what's been done.
- let devs decide when a ticket is needed vs when a quick pr will do. they'll know best.

bottom line: tickets are useful for big changes but requiring them for every single tech improvement will slow us down more than it helps. let's keep the process flexible where it makes sense.

## Default friendly GPT explains fully

This part is in GPT's default style, with some editing of what points to include. It's pretty much as it was generated, and I think does a good job of explaining the trade-offs for discussion:

Requiring a ticket for every technical improvement pull request is a policy with both advantages and drawbacks, and it’s important to weigh these carefully to ensure the team’s workflow is as efficient and effective as possible.
Pros of Requiring Tickets for Technical Improvements

- Improved Prioritization and Planning Tickets create a formal process for prioritizing work. When technical improvements require a ticket, it forces a discussion on whether the improvement is truly necessary or how urgent it is. This helps teams focus on the most impactful changes and avoid unnecessary or lower-priority adjustments, allowing better alignment with the overall project goals.

- Consistency Across Teams In larger teams or organizations, requiring tickets for all work (including technical improvements) helps ensure consistency. Everyone follows the same process, which makes it easier to manage cross-team dependencies, ensure the necessary approvals, and communicate changes to stakeholders.

- Clearer Communication and Accountability Tickets provide a clear space for discussing the reasoning behind technical improvements, including potential risks, trade-offs, or alternatives. This promotes better communication among developers, product managers, and other stakeholders, and helps ensure that everyone is on the same page. It also adds accountability, as each improvement is documented and has a clear owner.

Cons of Requiring Tickets for Technical Improvements

- Increased Administrative Overhead One of the biggest downsides is the added overhead. Many technical improvements are small, straightforward fixes or optimizations that don’t warrant the time and effort needed to create, manage, and track a ticket. Forcing developers to do this extra work can slow down progress and take time away from actual coding. Over time, this could lead to frustration or a slowdown in the pace of incremental improvements.

- Discourages Quick, Organic Improvements Developers often spot opportunities for small technical improvements while they’re working on other tasks. Having to create a ticket for each of these can disrupt their workflow, making them less likely to act on these improvements when they notice them. This can lead to missed opportunities to clean up code, reduce technical debt, or optimize performance in small but meaningful ways.

- Potential for Ticket Bloat In a fast-moving development environment, the requirement for tickets on small improvements could create a flood of minor issues in the ticketing system. This can make it harder to manage more critical work and obscure visibility into the progress of higher-priority features or bugs. The sheer volume of tickets can become difficult to sort through, adding cognitive load to project management.

- Less Developer Autonomy Developers often thrive in environments where they can take initiative to improve the codebase. Requiring tickets for every small change might reduce their sense of ownership, as it introduces a layer of bureaucracy between identifying an issue and resolving it. This could dampen their motivation to take care of small, yet important, aspects of code quality.

A Balanced Approach

Given the pros and cons, there may be a middle ground that allows the team to capture the benefits of ticketing while avoiding its downsides:

- Ticketing for Significant Changes: Tickets could be required for larger technical improvements that have broader implications, such as major refactors, changes that affect multiple teams, or improvements that touch critical parts of the system. For smaller changes, like simple code cleanup, minor refactoring, or bug fixes, developers could be allowed to open a pull request without the overhead of a ticket.

- Use Pull Requests for Tracking: The pull request itself can serve as a lightweight way to document and discuss technical improvements. Detailed PR descriptions, along with the review process, can provide enough visibility and communication for smaller improvements without the need for a formal ticket.

- Developer Discretion: Allow developers to decide whether a ticket is needed based on the scope of the improvement. They are often best positioned to know whether a change is minor enough to be handled via a simple PR or whether it requires more discussion and prioritization through a ticket.

Conclusion

Requiring tickets for every technical improvement has clear advantages in terms of prioritization, consistency, and accountability, particularly in larger teams or complex projects. However, the added overhead, potential for slowing down minor improvements, and impact on developer autonomy are significant downsides to consider. A balanced approach that applies ticketing requirements more selectively, while still ensuring visibility and discussion through PRs, could be a better fit for fostering both productivity and quality in the development process.
