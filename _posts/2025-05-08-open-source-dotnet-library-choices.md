---
title: "NuGet libraries to avoid"
layout: post
reddit: https://www.reddit.com/r/dotnet/comments/1khwsma/nuget_libraries_to_avoid/
---

There has been a bout of "commercialization" of nuget packages in the dotnet world lately. There are now so many going that way I struggle to remember what's useable and what isn't.

I used to be able to grab the nearest nuget lib and with a quick glance at the license get coding, but now one has to tread carefully not to fall foul of license changes.

The .NET ecosystem has seen a notable shift with several NuGet libraries transitioning from open source to commercial models. This has impacted developers who now need to be more vigilant about the libraries they choose to incorporate into their projects. Below is a list of major NuGet libraries that have gone commercial, along with some alternatives.

This is definitely something to watch when using AIs/LLMs for [Vibe] coding as they will happily add libraries for which you would be in violation of their license.

Note: being commercially licensed is not necessarily a reason not to use a library. For example, you probably don't want to write an entire OpenId identity server from scratch just to avoid your company paying for Duende. This post is more about not walking unawares into something that at some point was FOSS, but has now shifted to something that might be difficult or impossible to use in the particular project you are working on. Some of these are more surprising than others depending on how long you have been around and how much you've been keeping up with the dramas of dotnet recently. The scope of this list is specifically dotnet projects that gained some traction while they were fully FOSS which later changed their license (or behaviour in the case of Moq) in ways that make them less universally usable.

## The NuGet Hall of Former Glory

### [Moq](https://github.com/moq/moq4)

Introduced the SponsorLink spyware dependency, causing uproar and mass exodus.

- [Reddit discussion](https://www.reddit.com/r/dotnet/comments/15ljdcc/does_moq_in_its_latest_version_extract_and_send/)
- [GitHub issue](https://github.com/devlooped/moq/issues/1372)
- Alternatives: 
  - [FakeItEasy](https://github.com/FakeItEasy/FakeItEasy)
  - [NSubstitute](https://github.com/nsubstitute/NSubstitute)

### [GitInfo](https://github.com/devlooped/GitInfo)

GitInfo followed a similar path to Moq, and users should be cautious of libraries from the same author (devlooped, aka @kzu) who has lost much trust after the SponsorLink debacle.

- [GitHub repository](https://github.com/devlooped/GitInfo)

> "This project uses SponsorLink to attribute sponsor status"

### [MassTransit](https://masstransit-project.com/) as of v9

MassTransit's commercialization was announced with version 9, prompting users to seek alternatives.

- [Reddit discussion](https://www.reddit.com/r/dotnet/comments/1jpyczi/masstransit_going_commercial/)
- [Official announcement](https://masstransit.io/introduction/v9-announcement)
- Alternatives:
  - [Brighter](https://github.com/BrighterCommand/Brighter)/[Darker](https://github.com/BrighterCommand/Darker)
  - [Rebus](https://github.com/rebus-org/Rebus) - MIT license, though the [original author joined the NServiceBus owners in 2013 apparently](https://udidahan.com/2013/09/11/on-mookid-joining-nservicebus-and-what-that-means-for-rebus/)
  - Raw [Service Bus SDK](https://learn.microsoft.com/en-us/dotnet/api/overview/azure/messaging.servicebus-readme?view=azure-dotnet)
  - ~~No better: [NServiceBus](https://particular.net/nservicebus) (see below)~~


### [NServiceBus](https://particular.net/nservicebus)

- strange non-FOSS dual licensing with restricted functionality. Avoid. [Apparently was once Apache licensed but changed circa 2011](https://stackoverflow.com/questions/5657809/nservicebus-license/5670707#5670707)

### [MediatR](https://github.com/jbogard/MediatR) & Automapper

Both libraries have moved towards a commercial model, as announced by their creator Jimmy Bogard.
- [Licensing update](https://www.jimmybogard.com/automapper-and-mediatr-licensing-update/)
- [Commercial announcement](https://www.jimmybogard.com/automapper-and-mediatr-going-commercial/)
- [GitHub discussion](https://github.com/jbogard/MediatR/discussions/1105)

### [FluentAssertions](https://fluentassertions.com/)

FluentAssertions also changed their licensing model, but a community fork remains available under Apache 2.
- [Community fork](https://github.com/AwesomeAssertions/AwesomeAssertions)
- Alternatives:
  - [Shouldly](https://docs.shouldly.org/)

### [Duende](https://www.nuget.org/packages/Duende.IdentityServer) OpenId server

- ["This new product will remain open source but will be offered with a dual license (RPL and commercial)"](https://leastprivilege.com/2020/10/01/the-future-of-identityserver/#:~:text=This%20new%20product%20will%20remain,source%20community%20and%20our%20contributors)
- Alternatives
  - [KeyCloak](https://www.keycloak.org/) - a Java based self-hostable open source identity server.

This one doesn't really deserve the "avoid" label these days, as it's been pretty clear for many years that this is a commercial offering, however it's included here because I think it is interesting that a move from Apache to dual licensing is part of its history.

### [ImageSharp]()

- ["The Six Labors Split License"](https://sixlabors.com/posts/license-changes/#:~:text=The%20Six%20Labors%20Split%20License,Six%20Labors%20Commercial%20Use%20License)

## A word on licenses

Several of these re-licensed projects were under the MIT license. While you can still get and use the code as it was at the point the license was changed, there is nothing in the MIT license to stop a library author accepting thousands of hours of effort in contributions and then flipping the license to something profiteering.

This should be a warning to all who care about the future benefit and use of their work to think carefully about what license to choose for their work, and the license of projects they contribute to. Notably this kind of relicense would be impossible with a GPL license without gaining consent from every single contributor as to do so would be removing rights, which is explicitly disallowed by the GPL.

This site has good explanations of choosing licenses: <https://choosealicense.com/>, plus a handy tool to pull-request a license to your github repo.

### RPL (Reciprocal Public License)

The [RPL license](https://opensource.org/license/rpl-1-5) ([RPL on Wikipedia](https://en.wikipedia.org/wiki/Reciprocal_Public_License)) is a lesser-known license that you have to watch out for. It seems to be common in dual licensing because it effectively forbids commercial use due to the derivate works clauses. If you add an RPL library to a commercial project you'll potentially be in big trouble.

It's interesting to note that [GNU considers RPL non-free](https://www.gnu.org/licenses/license-list.en.html#RPL) due to restrictions it imposes.

## Contributions welcome

If you know of any that have gone south that I've missed here, and of good alternatives by all means open a PR for this post. I'm hoping there won't be too many more that do this in the coming years.

## Further reading

- <https://www.reddit.com/r/linux/comments/veeg4i/permissive_licenses_are_counterintuitive/>
