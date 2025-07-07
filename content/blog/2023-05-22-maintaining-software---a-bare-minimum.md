---
title: Maintaining software - a bare minimum
layout: post
---

All the press goes to new features, but there's a lot that has to happen just to stand still in software development.

None of the following results in "shiny new feature that everyone is excited about". It's the ongoing work that anyone who's not in day-to-day software development might not appreciate, sometimes questioning where the time is going.

Here's a catalog of things that eat engineering time, but that are eventually unavoidable if you don't want to grind to a halt under a mountain of [tech debt](/2020/07/09/approaches-to-refactoring-and-technical-debt/):

## Non-feature work

### 1) Bugs

Customers (or your monitoring) notice something that's not working:

- Investigate and ship a fix,
- or worse, spend time investigating only to discover it can't / won't be changed or fixed.

### 2) Minor dependency upgrades

e.g. upgrading [xUnit](https://www.nuget.org/packages/xunit) from `v2.4.0` to `v2.4.2`

These are usually trivial if your tests are good and the authors respect [Semantic Versioning](https://semver.org/). They still need to be done regularly to keep the impact small.

### 3) Major dependency upgrades

e.g. [upgrading MediatR from v9.x to v10.0.0](https://github.com/jbogard/MediatR/wiki/Migration-Guide-9.x-to-10.0)

> "This release includes the following breaking changes in the API ..."  
> ~ MediatR release notes

### 4) Platform upgrades

e.g.

- [Upgrading Rails from 5.2 to 6.0](https://www.fastruby.io/blog/rails/upgrades/upgrade-rails-from-5-2-to-6-0.html)
- [Migrating apps from Azure Functions version 3.x to version 4.x](https://learn.microsoft.com/en-us/azure/azure-functions/migrate-version-3-version-4?tabs=net6-in-proc%2Cazure-cli%2Clinux&pivots=programming-language-csharp)

There is often significant changes, including removal and changing (sometimes called "breaking" or "breaking changes") things that your code relies on.

You might be tempted to put these off. Don't. The longer you leave it, the worse your problem becomes, eventually becoming insurmountable.

### 5) Fundamental shifts

Sometimes there's an enormous shift in technology, e.g.

- On-premise compute to cloud compute.
- Desktop to mobile.
- Server-rendered web to API + Single Page Applications (SPAs).
- More recently, the shift from servers to serverless.
- Data storage (SQL vs NoSql, vs Graph databases).
- New hosting and technology platforms.

If you don't keep up to date then you find it increasingly hard to operate what you have (no engineers want to work with the old tech, the online world no longer supports you with information and tooling, etc). And your customers expectations start to demand things that your outdated approaches are just unable to support.

Have a plan for regularly considering these and taking action. You might spin up new teams to try them out, or give people "Friday time" to explore new things. The only thing you mustn't do is "nothing".

## Why is keeping on top of upgrades important?

Why not just ignore the upgrades till you need them?

Two reasons:

- Security fixes
- The longer you let it pile up, the harder it gets (exponentially so).

## Keeping changes small

If you allow upgrades to pile up for a month or so, you'll have one big patch that upgrades many things. If something breaks (even with good test coverage) it can be a lengthy process to figure out which upgrade broke it and what to do about it.

If you do this regularly (weekly at least), then you'll only be upgrading a few minor versions at a time, and it will be immediately obvious where to start looking if something breaks (i.e. roll back, then upgrade the 5 dependencies one at a time, and look at the changelog of the one that breaks it.)

## Test coverage

Upgrades are a key reason that good test coverage (and the functionality level) are very important. Without these you will have a significant manual testing effort for every upgrade. Relying on manual testing results in avoiding upgrades for longer, and breakages making it to production unnoticed.

## Monitoring

Good exception monitoring and telemetry in production will improve your ability to catch any oddities that slip through your test coverage.
