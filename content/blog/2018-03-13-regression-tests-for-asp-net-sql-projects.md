---
layout: post
title: Regression Tests for ASP.NET / SQL Projects
date: 2018-03-13 15:25:46.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _wpcom_is_markdown: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _publicize_job_id: '15685724070'
  timeline_notification: '1520954747'
author:
  login: timabell
  email: tim@timwise.co.uk
  display_name: timabell
  first_name: ''
  last_name: ''
permalink: "/2018/03/13/regression-tests-for-asp-net-sql-projects/"
---
I've had the opportunity to attempt many variations of regression testing on many projects.

Many of the systems I've worked on have at least some level of workflow, meaning a user has to move through many steps as the system progresses something towards a final state.

As systems become more and more complex it becomes harder to not accidentally break an area of the system you weren't currently looking at and didn't re-test manually before shipping. Hence the search for the holy grail of the perfect regression test suite. It turns out that none of the approaches available (unit tests, UI drivers etc.) provide a single solution to the problem, and instead we have to use all these approaches in balance to give reasonable protection against regressions.

Here I lay out my current thinking on the best way to use testing to avoid regressions in a standard ASP.NET MVC + SQL Server project. I would like to introduce to you the idea of "business logic tests" which are an integration test suite starting below the UI layer, continuing through to a real database. I believe this gives an ideal balance of the trade-offs we have to make when choosing how to design out full regression test suite for a system.

## System layers

The layers of such a system are ideally something like this:

*   Database (largely just used for CRUD storage)
*   ORM - EF or similar library
*   Model - C# classes
*   Business logic layer - pure C# - (often missing in real projects, with business logic scattered across the other layers)
*   UI layer - Controller classes written in C#, views in razor .cshtml files, html, css, javascript etc.

## Recommended test layers

*   **Unit tests** - test small pieces of C# code
*   **Business logic tests** - test the business logic layer down through to a real SQL Server database.
*   **UI Smoke tests** - non-exhaustive test of a few common user journey's through, running against a real database, driven with Selenium Web Driver or similar.

There should be only a few smoke tests, there should be many business logic tests covering all business functions that need to stay working, and finally developer discretion on the amount of unit testing to apply at the lowest level.

## What do the business logic tests look like?

These could be pure code driven through something like NUnit, or they could be in business language through a BDD tool like specflow.

They depend on the business logic project but nothing above that (UI). They inject a real database connection as a dependency through whatever injection method you use.

These tests should make sense to the product owner / client.

This is the layer with the broadest coverage of all of the three styles in play. Every business use-case, workflow & variation should be covered here. This is the suite that will alert you if any business or workflow rule is no longer being applied as designed, or if an obscure step of an obscure branch of your workflow has stopped working (perhaps due to an odd interaction with a database constraint).

## Handling the database

SQL Sever has a very useful snapshot feature that means you can very rapidly roll back to a clean state after each test run. ([Snapshot setup script](https://gist.github.com/timabell/3164291#file-create-snapshot-sql))

For each business logic test run:

1.  [Reset to the production snapshot](https://gist.github.com/timabell/3164291#file-reset-to-snapshot-sql) (or production equivalent build if you can't actually grab a production backup)
2.  Run outstanding migrations for this version of the code (you are using [Octopus + ReadyRoll](https://documentation.red-gate.com/rr1/deployment/octopus-deploy) aren't you?)
3.  Run the Business logic tests.

## Why not test all the business functions through the UI?

*   UI tests are prone to reliability problems, you can end up with 98% pass rates being normal, so then you don't notice when a critical test fails.
*   UI tests are slow - this can add an extra overhead to developer productivity.
*   UI tests cause unwarranted resistance to change - once you have UI tests the UI becomes extremely hard to change, particularly for sweeping site-wide redesigns without spending a prohibitively long time fixing up the test suite. And you aren't fixing the test suite because you changed the logic, this is busywork.
*   The UI isn't sufficiently fragile to warrant this level of testing - when you are working on a page you are unlikely to break unrelated pages without realising.

I have seen first-hand a team of excellent programmers get bogged down in problems with a full regression test suite driven entirely from the UI.

## Why not test all layers separately?

In my experience a major point of fragility when a system is modified is the interaction between the code and the database. As such it's important that this fault-line is covered thoroughly by all regression tests that focus on business functions that need to remain functional.

A test suite that isolates the business logic layer from the database layer provides very little value, usually just fulfilling a "_though shalt unit test all classes_" declaration.

## How to get there

If you don't have a solid business logic layer then you will need to refactor your way to that goal. This has other benefits for reliability beyond the ability to test. Clean code with an obvious layer for all the business logic is easier to modify and keep defect-free.

## Bonus - free test data

The tests that you write to drive the business logic layer will be generating real data in a real copy of your database as it runs through the many steps in a workflow. You can use this test driver to generate useful test data for every step in a workflow, e.g. if a workflow had four steps you could do the following:

1.  Test account A - drive business logic to step 1
2.  Test account B - drive business logic to step 2
3.  Test account C - drive business logic to step 3
4.  Test account D - drive business logic to step 4

This is extremely quick to run, and now you have an account in every state of your workflow. This is useful for easily:

*   Demoing your system from any starting point with multiple test accounts.
*   Having the data in the right state to do development work on state 4 without having to manually set it up.
*   Give your manual testers all the test accounts they need in many interesting states.
*   Testing out your reporting systems and anything else that consumes data from your database.

Having realised you can do this, why would you ever do it manually again?

Because the code that generates this data is a core part of your regression test suite it will be maintained as part of normal development activities and so you'll never again have to deal with test data that no longer works with your latest version of the system.

* * *

If you want me to help you get to this ideal then drop me a line - [tim@timwise.co.uk](mailto:tim@timwise.co.uk)
