---
title: Upgrading indirect NuGet dependencies
layout: post
---

## Update - transitive pinning

It seems microsoft have produced a solution to this problem, along with the long awaited solution-level package management. Read all about it here: <https://devblogs.microsoft.com/nuget/introducing-central-package-management/#transitive-pinning>

If you want to convert to central package management this tool works a charm: <https://github.com/Webreaper/CentralisedPackageConverter> ([via reddit](https://www.reddit.com/r/dotnet/comments/vnayh9/converting_a_large_project_to_central_package/))

---

## About

The state of the art for dependency management in dotnet land. Having used ruby bundler and npm this makes me cry.

I really hope I'm massively wrong about the following information. Please do tell me if I'm wrong and NuGet dependency management is not actually as bad as this!

## Paket, a NuGet alternative

If you have the option then look into replacing nuget with [paket](https://fsprojects.github.io/Paket/) for your projects as I gather this has the below problems solved.

## Indirect dependencies

Say you depend on [Microsoft.AspNetCore.Http v2.2.2](https://www.nuget.org/packages/Microsoft.AspNetCore.Http/2.2.2) (which is the latest available at time of writing), which in turn depends on [Microsoft.AspNetCore.Http.Abstractions >= v2.2.0](https://www.nuget.org/packages/Microsoft.AspNetCore.Http.Abstractions/2.2.0)  (also currently the latest) which in turn depends on [System.Text.Encodings.Web >= 4.5.0]()

And then you discover, say, just for a fun example, that [System.Text.Encodings.Web v4.5.0 has the Remote Code Execution (RCE) Vulnerability CVE-2021-26701](https://github.com/dotnet/announcements/issues/178).

Thankfully Microsoft have released a patch release with a fix for the CVE: [System.Text.Encodings.Web v4.5.1](https://www.nuget.org/packages/System.Text.Encodings.Web/4.5.1)

So obviously you'll just upgrade your packages, run CI, make a cup of tea and ship to prod, right? Wrong.

But it says `>= 4.5.0`, so shurley it'd just upgrade it?...

Apparently not. It seems that for whatever reason nuget actually prefers the *lowest* compatible patch release. Go figure. So it won't upgrade.

### Checking the source of truth

Because I'm starting to doubt my sanity at this point, let's dive in to the source code for the middle package to make sure we're not just being ignorant about how it actually works.

`Microsoft.AspNetCore.Http.Abstractions` has abstracted out the version info for its dependencies to another file, you can see the defined version of the [...Encodings.Web dependency as at v2.2.0 here](https://github.com/aspnet/HttpAbstractions/blob/release/2.2/build/dependencies.props#L24)

```
<SystemTextEncodingsWebPackageVersion>4.5.0</SystemTextEncodingsWebPackageVersion>
```

which is then [referenced in the `.csproj` here](https://github.com/aspnet/HttpAbstractions/blob/release/2.2/src/Microsoft.AspNetCore.Http.Abstractions/Microsoft.AspNetCore.Http.Abstractions.csproj#L23)

```
<PackageReference Include="System.Text.Encodings.Web" Version="$(SystemTextEncodingsWebPackageVersion)" />
```

On the face of it you'd think that this meant it was pinned to an exact version, but microsoft in their infinite desire to pander to the lowest common denominator (i.e. idiots and n00bs) decided that `1.0` should actually mean `1.*`.

| Notation | Applied rule | Description                |
|----------|--------------|----------------------------|
| 1.0      | x ≥ 1.0      | Minimum version, inclusive |
| ...      |              |                            |

Source: [NuGet version range definitions](https://docs.microsoft.com/en-us/nuget/concepts/package-versioning#version-ranges)

It doesn't even define whether it will upgrade major, minor, or just patch releases. Horror-show.

## lock files

Lock files don't actually help much here, but are a good idea, so if you want to use them here's what I've learned about `packages.lock.json` files in Microsoft-land.

NuGet is veeeeeeeeeeery late to the lockfile game. A lockfile is just a second file that lists the dependency tree that was actually calculated for a given set of top level dependencies. Useful for repeatable builds and lets you see what's being resolved, but doesn't actually help fix the problem here as the point of lockfiles isn't to manually futz with them, it's just to do repeatable builds. And futzing with them would confuse everyone, and is made a little harder with the inclusion of checksums.

It is possible to [manually enable lockfiles](https://devblogs.microsoft.com/nuget/enable-repeatable-package-restores-using-a-lock-file/) by adding the following to a csproj file:

```xml
<PropertyGroup>
    <RestorePackagesWithLockFile>true</RestorePackagesWithLockFile>
</PropertyGroup>
```

I very much enjoyed [this multi-comment rant at the NuGet team](https://github.com/NuGet/Home/issues/5602#issuecomment-450269920) for basically being behind the times and always making poor decisions.

There is a slightly harder problem that microsoft have so far failed to sort out of [managing packages across a whole solution](https://github.com/NuGet/Home/wiki/Centrally-managing-NuGet-package-versions) (i.e. multiple projects). Though I can't help thinking that it's mostly hard because of the mess they've allowed to build up so far. (For example encouraging people to create multiple solutions with a mix of project files included, and the horror that is the one-giant-tree TFS system.)

## Forcing the upgrade

So it seems the only way to force the upgrade of the vulnerable "transient" dependency (i.e. one not directly specified in your `.csproj` file) is to add it as an explicit dependency directly to the `.csproj` `PackageReference` entries. This is lame, and likely to cause confusion later. Make sure your commit message is clear as to why you've added this seemingly nonsense dependency.

```xml
<ItemGroup>
	<PackageReference Include="System.Text.Encodings.Web " Version="4.5.1"/>
</ItemGroup>
```

## Getting notified of dependency updates

If you run any production code you can run an analysis tool like [Snyk.io](https://snyk.io/) or [dependabot](https://github.com/dependabot) to check for such CVEs popping up in your dependency graph.

You'll probably want to install a local version of whatever you use to avoid the CI loop for every change you make, [snyk has a visual studio extension](https://marketplace.visualstudio.com/items?itemName=snyk-security.snyk-vulnerability-scanner).
