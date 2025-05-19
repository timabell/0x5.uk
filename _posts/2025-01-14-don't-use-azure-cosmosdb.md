---
title: "Don't use Azure CosmosDB"
layout: post
---

 Don't use Azure CosmosDB for your next project.

I know it's tempting, because global-web-scale, and CV-driven development, but it's a trap that will mire you and your team in yaks, expensive azure bills, and lost productivity until the end of your time / project / contract / company.

I've been on a series of teams that have chosen to use this technology from microsoft, and I'm sure it's worth it if your project is the rare unicorn kind of hyper-scale global product that actually needs the specific unique properties it offers over a standard PaaS SQL database like sql server (shudder) or postgres (yay). (Seems unlikely though, stackoverflow still runs on mssql and that's one of the biggest sites out there).

For the projects I've been on? The cost and dev overhead are just not worth it. It was there when I arrived, and caused nothing but trouble. Don't forget to get your partition keys right at the start, because you're fscked if you get that wrong. Do your devs all know how to do it well, or is it another excuse to make a whole bunch of new mistakes by using a shiny new tech with superb marketing hype now that we're bored of SQL databases because we've got the hang of not fscking up that one.

We've just about got a decent way of working with sql databases these days. Azure has perfectly good hosted sql for a fraction of the price. SQL Server and Postgres both have PaaS offerings, and decent local installs with and without docker.

You (or your client) had better have deep pockets for the Azure bills you are committing to, the number of times I hear "oh don't worry about the cloud bill, we have the money" shortly followed by "erm, could you bring the cloud bill down, when I said don't worry I didn't mean spaff £100k/month up the wall on 42 environments running not-very-optimised code". (Don't forget it's not just production using it, you'll also need UAT, Dev, QA, and one for *every* developer and CI pipeline). I'm sure Azure would love you to incur that bill.

You have two choices for dev and test with cosmos, both of them awful: 1) rely on real cloud instances of cosmos, 2) use the new local emulator. Using the cloud to run local tests is just a nightmare, it causes all sorts of reliability and config issues, causes developers to trip over each other, pushes up costs for something that should be free. Using the emulator requires a £5000 computer to not catch fire, and is flaky as f*ck in my growing experience with it.

I wrote this while waiting for the cosmos emulator to eat all my cpus on my monster desktop while running some integration tests. If I save even one person from falling into this tar pit I'll consider this post worth the investment.

If you think that your system couldn't possibly run in the constraints of a sql server, did you know that stackoveflow still runs on sql server, [which ran 500 million sql queries *in one day*](https://nickcraver.com/blog/2016/02/17/stack-overflow-the-architecture-2016-edition/) back in 2016.

Can you tell I'll never be a Microsoft MVP, aside from my love of linux and the GPL.


## Local dev pain

For local development and tests there's the CosmosDb emulator (available in docker, yay!) which has in my experience proved to be disappointingly slow and prone to just giving up and 429'ing everything or just failing to respond, even on a super powerful machine. <https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-develop-emulator>

It also has a built in expiry, which is a pain in the backside because docker is designed to cache `:latest` instead of constantly pulling from the registry. <https://github.com/Azure/azure-cosmos-db-emulator-docker/issues/60>

### Mock it out

I've been working on an in-memory test fake for CosmosDb which you can find here, which might ease the pain (or might make it worse, good luck and let me know in the github issues!) <https://www.nuget.org/packages/FakeCosmosDb>

