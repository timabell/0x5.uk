---
path: /2026/08/19/polly-nuget-adds-eula/
title: "📰 News: Polly NuGet Adds OSMF EULA"
---

The [Polly NuGet library](https://www.nuget.org/packages/Polly)  for handling transient faults and improving resilience has [announced that it will be enforcing](https://thepollyproject.org/2026/07/14/polly-osmf-announcement.html) the [Open Source Maintenance Fee (OSMF)](https://opensourcemaintenancefee.org/) as an End User License Agreement (EULA) applying to the *binary* downloads. This will result in a license fee being charged for businesses using the library as a direct dependency.

They have stated that there will not be a change to the license for the source code for the library at this time.

The [OSMF was created by Rob Mensching and announced in Feb 2025](https://robmensching.com/blog/posts/2025/02/26/introducing-the-open-source-maintenance-fee/), he also applied it to his Wix library.

This is my first encounter with the OSMF, which is a novel approach to open source maintenance sustainability. Apparently it has been [in use by the Wix project](https://docs.firegiant.com/wix/osmf/) for some time, but it's the announcement of Polly moving to OSMF that [caught my attention on reddit](https://www.reddit.com/r/dotnet/comments/1vrffy2/polly_introduces_the_open_source_maintenance_fee/).

## Source licenses vs. binary EULA

The use of an EULA on **binaries** is something very different to what we have seen previously with [several open source NuGet libraries making license changes for the **source code**](https://0x5.uk/2025/05/08/open-source-dotnet-library-choices/#the-open-source-maintenance-fee-osmf-eula) resulting in varying levels of backlash from the community. The OSMF explicitly applies only to the pre-built binaries, rather than the original source code, and the source code can retain its existing license, meaning that there is no additional restriction being place on building binaries yourself, copying or forking the source code.

> "This Agreement applies only to the Binary Release"  
> ~ [OSMF EULA v1.1](https://opensourcemaintenancefee.org/maintainers/eulas/#:~:text=This%20Agreement%20applies%20only%20to%20the%20Binary%20Release)

So "violation" of the EULA (the bit the corporations seem to care about) is only triggered by using the official project's binaries. That is kind of similar in spirit to how Stallman originally talked about "Charging for the CD-ROM" - the software is still "libre" if it's GPL, but there is a fee for the convenience of having the working software packaged up and delivered in some kind of usable form. Personally I've always thought this was one of the weaker areas of the way Stallman described how FOSS should work practically, but it is very interesting to see a modern version of the same concept in the wild.

## The debate

Judging by the [reddit thread for the announcement](https://www.reddit.com/r/dotnet/comments/1vrffy2/polly_introduces_the_open_source_maintenance_fee/) which contains the somewhat predictable responses from people who span the spectrum from the pragmatic "corporations should fund the OSS they depend on" to the the more idealistic FOSS / Libre minded people, plus understandable anger from people who think that changing the terms on something that many have contributed to and many rely on is breaking a variety of unwritten social norms and contracts.

>  "We were overjoyed when MS picked up Polly, ... because it felt as though we were truly building an ecosystem.
>
> Adding a license - and make no mistake it is a license, whatever terms the OSMF tries to conceal that with - feels like a stab in the back.
>
> We will create a fork, Fences, and invite everyone to use that in preference. We will welcome any maintainers who want to move."
>
> ~ [@IanHammondCooper replying to the reddit announcement](https://www.reddit.com/r/dotnet/comments/1vrffy2/comment/p4e8e9v/)

I can sympathize with all sides of this particular debate, there are valid points on all sides around the ethical and practical questions of freedom, restrictions, funding, effort when it comes to the production of open source software. With each license choice there are winners and losers, changes in tradeoffs, and understandably heated debate when the project owners change the terms.

## What will happen to Polly now?

It is not clear to me what the consequences of applying the OSMF to Polly specifically will end up being. It could be that most will flee to a fork to avoid the cost, mental overhead, risk & bureaucracy needed to "comply". It could be that companies just accept this as normal, pay up and the maintainers get the financial support they are seeking. Perhaps some of both. It will be interesting to see how it plays out in the longer term.

## A shady practice

Having watched a few projects in the dotnet NuGet space change the terms on their projects I have come to the conclusion that even if it is legal, there is something deeply unethical about significantly changing the terms of use for a nuget project **under the same package identifier**.

There are [rules in consumer law in the UK against "unfair practices"](https://www.gov.uk/government/publications/unfair-commercial-practices-cma207/unfair-commercial-practices), which seek to curtail the temptation of businesses to just confuse customers into legal agreements or deals that they just wouldn't accept if they actually knew what was going on, and this is generally a good thing. I suspect this largely doesn't apply to business-to-business which I expect most nuget package agreements would fall under, but nonetheless it shows that as a society we don't always accept that "technically in violation even though it was hard for you to understand that" is morally acceptable and thus we encode it in law.

As a dotnet dev of over 20 years I am *painfully* familiar with day to day use of the nuget ecosystem, and the practicalities of choosing, installing and updating nuget packages as dependencies of client, employer, personal and open source projects. The tooling around nuget is far from consistent or perfect. There are a variety of CLI tools, vscode, Rider, and the venerable Visual Studio, dependabot on github, all giving different methods and user interfaces for managing your project's nuget dependencies.

When you add a dependency (assuming you didn't just vibe-code it in there), you perhaps did some due diligence to make sure you are installing a legit (i.e. not pwned), well supported and compatibly licensed dependency. So maybe you would catch an incompatible license or unwanted OSMF EULA before deciding to commit to the inclusion. It is certainly not great to add a dependency you know nothing about.

But when it comes to updates, it is not uncommon to be under pressure from the security department of an enterprise to bring up to date the dependencies of a borderline unmaintained internal project that you didn't write and know little about. You can't ignore updates or you risk compromise due to known vulnerabilities (CVEs), but you probably aren't going to re-read the readme of every dependency to see if something new has snuck in. You run that CLI tool or merge that dependabot PR to get the job done, if you are lucky the build still passes and the project still works, and think nothing more of it. Unluckily for you and your client/employer a random nuget lib that was MIT license in `v3.4.1` is now bristling with new legalese demands for cash in `v4.0.2`; now you are in trouble with the legal and finance department instead of the security department. Fun.

There is currently no reliable way for a maintainer of a NuGet package to let their users know that they really do need to stop before updating and decide whether to accept the new terms. There have been attempts by some libraries to bring attention by [breaking the build (see the `node-ipc` drama in 2022)](https://www.csoonline.com/article/572327/developer-sabotages-own-npm-module-prompting-open-source-supply-chain-security-questions.html), this was exceptionally unpopular and disruptive.

So if the maintainers have no way to do the right thing of reliably asking if you want to accept the new altered and more onerous terms, and they no longer want to keep publishing new versions under the old terms, then logically they should not publish any more versions of that package. And if they do want to continue their efforts under new terms that bring an expectation of payment, then it would be entirely ethical to **create a new package name with the new terms enforced from day one**, and ask users to explicitly opt in by switching to the new package identifier, e.g. `PollyCommercial.Core` or something. Of course it's easy to see why none of the maintainers have gone this route - they would go from however many thousand users to zero, entirely defeating their attempt to fund ongoing efforts. So with that landscape the maintainers seem to bend the moral rules to suit themselves, and turn a blind eye to **the ethical problems with a change in terms of an existing package feed** and just do it anyway.

I don't expect my observation will change anything, but I think it's worth calling out and naming that this *is* a shady and somewhat unethical practice, and it seems to be fairly popular at the moment for better or worse.

## Automated compliance checks

As far as I can tell, there has been a good amount of effort poured in to automated compliance checks to ensure that you are not accidentally adding an incompatibly licensed dependency to a project, for example adding an A-GPL licenced library to your client code and accidentally forcing them to open source their entire commercial product (oops!).

There are more tools now to generate a "Software Bill of Materials" (SBOM), and further tools to aggregate those, and assess them for any possibly license violations.

The problem with this new use of an EULA on the binary is that the source code license actually didn't change, so there is no way for these tools to even notice this latest style of violation & liability.

## GPL compatibility

I'm not aware of anyone considering combining the OSMF and GPL, but I think it's an interesting exploration as it hints at the culture clash of the more extreme ends of the philosphy of software and money, and looking at the fault lines where they meet tells us something about the licensing landscape and the balance of practicality, ethics and legality. It certainly surprised me on first contact that something like the OSMF could be at all compatible. Especially with the newer and stronger copyleft licenses such as the A-GPL v3 that are designed to resist things such as Tivoisation and exploiting FOSS in commercial SaaS without honouring the spirit of the terms.

It would appear on first glance (I am still not a lawyer and have no interest in becoming one...) that on the face of it the OSMF appears to add "more restrictions", which would appear to be in conflict with the GPL terms preventing "applying further restrictions". However on closer inspection, they are apparently not actually in conflict and you can apply the OSMF to the binaries of a GPL library (still not a lawyer), because the GPL applies to the source code and the ability of the end user to access, modify and share the source code and builds, which the OSMF carefully dances around by not restricting those rights and instead narrowly requiring payment only for use of that particular distribution of binaries.

There is one mention of an EULA in the GPL FAQ:

> "... require me in their umbrella EULAs or as part of their downloading process ..."
> https://www.gnu.org/licenses/gpl-faq.en.html#ExportWarranties:~:text=require%20me%20in%20their%20umbrella%20EULAs%20or%20as%20part%20of%20their%20downloading%20process

though it is not really referring to the same sort of thing as the OSMF; but nonetheless it is interesting that that particular EULA clause is not considered a violation of GPL.

I can only guess what Stallman would say on the OSMF as a concept. Personally I cannot find a logical reason that the OSMF conflicts with the rights set out in the GPL, but yet there is still something in me that feels a loss, a restriction being imposed. Perhaps that feeling of loss is not a loss of what the GPL protects, but a loss of an idealised world where software flows as freely as ideas, and there is no friction between thought and creation... but that like so much idealism is to ignore the realities of maintenance of popular open source libraries about which so much has been written... there really is trouble in paradise after all.

## A fork

Ian Cooper, a maintainer of the Brighter/Darker projects which use Polly [came out strongly against the move to OSMF](https://www.reddit.com/r/dotnet/comments/1vrffy2/comment/p4e8e9v/) and has begun a fork of Polly to continue the untainted distribution of the current Polly package: [github.com: BrighterCommand/Fences](https://github.com/BrighterCommand/Fences)

The fork was announced and discussed here: [Forking Polly · App-vNext/Polly Github Discussion](https://github.com/App-vNext/Polly/discussions/3202).

## So is this good or bad?

I am going to sit on the fence for this one for the time being.

I can see both sides, I can see some pros and some cons, but right now I think we need to see a lot more of this in the wild before we can really judge the net effect of something like this becoming widespread within an ecosystem such as dotnet & nuget on the broader ecosystem dynamics.

As a developer I have a knee-jerk reaction against anything that adds friction to the things I want to create for myself and my clients. But if this improves the quality and maintenance of important libraries in nuget and beyond then maybe it will have turned out to be a net force for good. There doesn't seem to be anything in the OSMF currently that prevents a fork, which really is the escape hatch in the GPL for a library vendor doing anti-user things.
