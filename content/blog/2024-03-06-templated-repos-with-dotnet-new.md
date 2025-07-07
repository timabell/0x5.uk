---
title: "Templated repos with dotnet new"
layout: post
reddit: https://www.reddit.com/r/dotnet/comments/1baplh2/templated_repos_with_dotnet_new/
---

I've been digging in to making `dotnet new` templates and it turns out to be a remarkably capable bit of tooling.

It's particularly useful when you want to build a load of similar microservices with their own git repos.

It can:

- Rename files.
- Rename strings (variables, class names etc).
- Preserve case style of renamed strings (through "derived" replacements).
- Create named command line arguments for your template string replacements, e.g. `donet new mytemplate --myswitch MyReplacementValue`.
- Exclude entire blocks of code and files based on switches that user can provide.
- Be installed an tested from a local folder with `dotnet new install <path>`.
- Be built into a nuget package and published on private or public feeds.

Importantly, there's nothing in the way that it works that stops you from making your template code build/test/run.

And because it's a CLI tool, if you want to an update an existing generated repo with a new version of a template you can just run it again with `--force`, and use git to pick through what changes you want to take into the generated repo.

This really takes a lot of the toil out of the copy-paste-modify you would have to do otherwise.

Learn more:

- <https://learn.microsoft.com/en-us/dotnet/core/tools/custom-templates>
- <https://devblogs.microsoft.com/dotnet/how-to-create-your-own-templates-for-dotnet-new/>

See also:

- <https://copier.readthedocs.io/>
