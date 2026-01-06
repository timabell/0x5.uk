---
path: /2025/11/11/running-dotnet-microservices-in-aspire-without-a-project-reference/
title: "Running dotnet microservices in Aspire without a project reference"
---

Aspire from Microsoft is pretty tantalizing for local development, however all the instructions for how to add a dotnet web app to your new dotnet aspire AppHost tell you to add a direct reference to the .csproj file that you want to run. But after a lot of hunting, head-scratching and trial and error I've found a less entangled way.

I was convinced it must be possible to run a dotnet project with Aspire without this pesky project reference; after all Aspire has support for running nodejs web apps, and any other ecosystem you choose to add to it. If that's the case, why do we have to have this .csproj reference?

## Project references

The standard way of adding dotnet projects (including web apps, apis, blazor etc) is to [add a project reference](https://devblogs.microsoft.com/dotnet/adding-dotnet-aspire-to-your-existing-dotnet-apps/#add-project-references) in the AppHost project to the dotnet project that you want to manage & run in aspire. This makes a lot of sense for a system that was built with Aspire from the start, and that lives in a monorepo.

You _can_ add a relative path project reference that goes outside of the repo that your Aspire AppHost lives in (after all, csproj files have no knowledge of where the git repo root is):

```xml
 <ProjectReference Include="..\..\..\some-webapi\src\Some.API\Some.API.csproj" />
```

This however causes a bunch of problems, especially if you are trying to bolt Aspire on to an existing system that was built without it in many git repositories.

- The dotnet SDKs have to be aligned or the build fails - so if you have two microservices on different SDK versions then you're in for a hard time (at least if you are using [asdf-vm](https://asdf-vm.com/) to manage dotnet versions (highly recommended), which only has one sdk per dotnet install version).
- The microservice projects have no idea they are being included in the Aspire host, so have no reason to not break your Aspire project, resulting in endless maintenance problems and unreliability (for example the .csproj you are referencing could just be moved to another folder, or deleted entirely).
- ALL your services are pulled together into one single mega-build of everything, which means if you have conflicts or dependency version mismatches you are out of luck unless you then go and make a load of changes to the microservices.

Fundamentally it also increases the entanglement of what are supposed to be independent microservices. All in all it just smelt wrong to me. I gave it a good go and got about 5 services in before I couldn't build the Aspire project any more due to version clashes.

So what to do? I did some searching for approaches to multi-repo setup, assuming that as soon as you were across repo boundaries people would stop recommending project references, but no, that still seems to be the recommended approach in spite of the above issues. So then I went back a level… if you can run nodejs etc, surely you can run anything with a binary…

Well it turned out that nodejs/npm has some special wrappers in Aspire so that wasn't much help, but after a bit more digging for how you might just run any binary, and finding an intersting diversion on the ability to [add arbitrary custom commands](https://juliocasal.com/blog/how-to-add-custom-commands-to-the-net-aspire-dashboard) to a service (useful!) I discovered you can indeed shell out to call any executable.

## Dotnet executable reference

The inspiration that hit me after a while that I haven't seen anyone else mention (let me know if I just failed to find it!) is that for local dev setup with Aspire we can just run `dotnet run` in the folder of the web app you want to run (or you could use the `--project` argument, not sure it makes much difference).

Eventually I found the fluent builder method for Aspire that I was looking for: [`.AddExecutable()`](https://learn.microsoft.com/en-us/dotnet/aspire/app-host/executable-resources)

And so, with all that waffle and backstory out the way, here's the actually very small bit of code you came here for. This was enough to get an arbitary web app from a sibling git-repo folder up and running in the Aspire dashboard on a local dev machine.

```csharp
var builder = DistributedApplication.CreateBuilder(args);

builder
    .AddExecutable(name: "some-webapi",
        command: "dotnet",
        workingDirectory: Path.GetFullPath(
            // get back to parent repo folder out of aspire-repo/src/AspireAppHost/bin/Debug/net8.0/
            Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "..", "..", "..",
                "some-webapi")),
        args: "run")
    .WithUrl("http://localhost:8080/")
    .WithExplicitStart();

builder.Build().Run();
```

### Experience report

Because in this setup Aspire has no knowledge of the web app, it can't magically figure out the url/port for the web app that it has started, so you have to add the `.WithUrl()` so that you get a link to click on in the dashboard when you've started the app.

Aspire captures the stdout/err so you can immediately see the console logs for each web app in the dashboard, which is dead handy and beats flipping between a load of terminals or IDEs to find the logs. It even interleaves the logs from multiple services with a colourful prefix in the main log screen.

Without some extra work, Aspire has no insight into whether the service it has run is ready, so it shows the url and "Running" even though the app is still starting up. I suspect this might be solvable with some use of the "health" capabilities.

Because we are running `dotnet run` rather than the pre-built binary, if the code has changed the web app will be rebuilt automatically (resulting in a slower start, but this is for local development so that's presumably what you'd want anyway). The full build output shows in the app's Aspire console logs which is useful seeing what went wrong. Using the csproj reference approach I found the build errors of referenced projects much harder to figure out, especially as it wasn't immediately clear which of the microservices had actually failed to build. This approach neatly segregates the builds once again.

It does not solve the problem of connecting the services to each other. I believe that if you go all-in with Aspire it will do the service-discovery / dns for you (don't quote me), but it's a big ask to rework all your services when no-one in your org has seen any value from Aspire thus far. Microservices systems built without Aspire will of course alreay have some solution in place for connecting services to each other and deciding what to run locally and what to run in the cloud for local development, so you can continue to lean on that with this approach and lose nothing.

All in all I'm very happy with this, it allows me to bolt an Aspire dashboard, startup and logging to whatever pile of services I happen to be dealing with for a given client, no matter the state of them. This gives me an improved local development experience and reducing the burden of cognitive load of managing all the local services, freeing up limited mental resources for the actual work at hand.

## References & further reading

- [devblogs.microsoft.com: Adding .NET Aspire to your existing .NET apps - .NET Blog](https://devblogs.microsoft.com/dotnet/adding-dotnet-aspire-to-your-existing-dotnet-apps/)
- [What is .NET Aspire? Why do you NEED it in every .NET app? How to get started in minutes! - YouTube](https://www.youtube.com/watch?v=fN3ufsIF7vs)
- [Migrating From Docker Compose to .NET Aspire (my experience) - YouTube](https://www.youtube.com/watch?v=-73fAqw8ckU)
- multi-repo
	- [Enhance Your Development with Multi-Repo Support in Dotnet Aspire - DEV Community](https://dev.to/dutchskull/poly-repo-support-for-dotnet-aspire-14d5)
		- [Dutchskull/Aspire.PolyRepo: This library for DotNet Aspire enables poly repo support and the addition of Git repositories to your Aspire projects. It simplifies multi-repository management and streamlines dependency handling, making it easier to work with multiple repositories in a Aspire project.](https://github.com/Dutchskull/Aspire.PolyRepo)
	- [Add Multi repo support · dotnet/aspire · Discussion #1137](https://github.com/dotnet/aspire/discussions/1137)
		- tye is archived with no explanation [dotnet/tye: Tye is a tool that makes developing, testing, and deploying microservices and distributed applications easier. Project Tye includes a local orchestrator to make developing microservices easier and the ability to deploy microservices to Kubernetes with minimal configuration.](https://github.com/dotnet/tye)
	- [Is it possible to use .NET Aspire across multiple .NET solutions? - Stack Overflow](https://stackoverflow.com/questions/77757079/is-it-possible-to-use-net-aspire-across-multiple-net-solutions/78033654#78033654)
	- [Multi-Repository Setup with .NET Aspire: Best Practices for Enterprise Constraints · dotnet/aspire · Discussion #10276](https://github.com/dotnet/aspire/discussions/10276)
- [Aspire Roadmap (2025 → 2026) · dotnet/aspire · Discussion #10644](https://github.com/dotnet/aspire/discussions/10644#discussion-8626583)
- [nikiforovall.blog: 10 Lessons I Learned from Using Aspire in Production](https://nikiforovall.blog/dotnet/aspire/2024/09/30/aspire-lessons-learned.html)
- [learn.microsoft.com: Orchestrate Node.js apps in Aspire - Aspire | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/aspire/get-started/build-aspire-apps-with-nodejs)
- add custom commands to services, e.g. clear-cache for redis
	- [learn.microsoft.com: Custom resource commands - Aspire | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/aspire/fundamentals/custom-resource-commands)
	- [juliocasal.com: How to Add Custom Commands to the .NET Aspire Dashboard](https://juliocasal.com/blog/how-to-add-custom-commands-to-the-net-aspire-dashboard)
- running projects without adding project references
	- [www.c-sharpcorner.com: Host external executables in .NET Aspire](https://www.c-sharpcorner.com/article/host-external-executables-in-net-aspire/)
	- [learn.microsoft.com: Host external executables in Aspire - Aspire | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/aspire/app-host/executable-resources)
- [Must-have resources for new .NET Aspire developers ~ Anthony Simmon](https://anthonysimmon.com/must-have-resources-for-new-dotnet-aspire-developers/)
- [Exploring the Microsoft Developer Control Plane at the heart of the new .NET Aspire ~ Anthony Simmon](https://anthonysimmon.com/exploring-microsoft-developer-control-plane-core-dotnet-aspire-dotnet-8/)
