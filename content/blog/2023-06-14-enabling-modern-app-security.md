---
title: Enabling modern app security
layout: post
---

A broad-view of improving security in any organisation.

## An inspirational panel discussion

Yesterday I went to a panel discussion hosted by [eSynergy](https://esynergy.co.uk/), ["Innovation at its safest: Excellence in Software Engineering through Integrated Security Best Practices"](https://esynergy.co.uk/event/security-excellence-in-engineering/)

![photo of panel discussion](/images/blog/esynergy-security-event-IMG_20230613_175534.jpg)

The whole event was live-streamed, [watch the panel discussion recording here](https://www.youtube.com/watch?v=FH5kyUwRZ5Q)

For me who lives in developer-land, it was a useful broadening of perspectives around app security. What follows are some bits that I took away from the discussions, which I think provide a useful starting point for anyone tasked with running any modern software systems in this increasingly hostile security environment.

### Who's who at the event

The speakers at the event were as follows:

1.  Intro from [Ulrike Eder (eSynergy)](https://www.linkedin.com/in/ulrikeeder/) [00:03:47]
2. "Beyond OWASP Top 10" from [Grant Ongers](https://www.linkedin.com/in/rewtd/) from OWASP and [secure delivery](https://securedelivery.io/) [@rewtd@defcon.social](https://defcon.social/@rewtd) / [@rewtd](https://twitter.com/rewtd) [00:06:37]
3. Grant was then joined for the panel discussion by: [00:19:40]
	- [Salman Iqbal](https://www.linkedin.com/in/salman-iqbal-a6a5b026), Principal Consultant, DevOps and ML Security at esynergy (hosting the panel)
	- [Teresa Wu](https://www.linkedin.com/in/yayiwu/) VP Engineer at J.P. Morgan
	- [Ben Burdsall](https://www.linkedin.com/in/ben-burdsall-6ba2bb), Chief Technology Officer at dunnhumby, non-exec at eSynergy
	- [Tom Harris](https://www.linkedin.com/in/tomtechharris/) Chief Technology Officer at ClearBank, BuildCircle, ex-JustEat

## Takeaways

There's a bewildering array of things you can / should / must do for the security of your systems, users and company.

Within this article you'll find some starting points for your onwards security journey

### Levels

There are two reasons for thinking of security in layers or levels:

1. Your business needs, risks, regulatory environment and finances
2. Your security maturity

Some businesses are more at risk such as banks and thus need (and can afford) a more significant investment in security measures (such as multi-layered cloud infrastructure defenses), whereas some have less budget and less risk and so can operate at the simpler levels of security.

If you are currently very poor on security then there's little point sprinkling some advanced things on top, it's important to properly address each layer of security capability on the way up.

Regardless of your business needs, perfect security is always an unattainable ideal, but a worthy target nonetheless. The Unicorn project calls this kind of never-quite-attainable perfection an "Ideal". [The Unicorn Project and the Five Ideals: Interview with Gene Kim](https://www.infoq.com/articles/unicorn-project/)

### Who's job is security anyway?

- The directors are "accountable".
- The developers, product etc. are "responsible".

While developers can and should write "secure code" (SQL Injection vulnerabilities is still on the top 10 list), it's important that everyone plays their part.

Notably the product function ("product owners"), as they are the decision makers for balancing the competing demands placed on delivery/development teams, including how much to invest in security defenses. (Much nodding in the audience at this one!)

#### Developers

Tools help but the developers need to understand what is required.

At ClearBank there is:

- "Lunch and learn" sessions from AppSec team.
- Training with "[HackSplaining](https://www.hacksplaining.com/)".

### How ClearBank leveled-up app dev security

1. Added security training
2. Required pull-request approval from someone with security training
3. This created a temporary bottleneck, which encouraged everyone to do the security training
4. Incubated an AppSec team to "reduce the cognitive load of security in collaboration with CISO and CTO (Tom)
   1. Enthusiastic internal devs
   2. Additional external resource
5. Collaboration at the top then filters down to all the teams

### Justifying security investment

The board of directors now face **criminal** penalties (i.e. jail time) if they don't properly approach security. It used to be just financial penalties but that wasn't enough as they could just be absorbed as a "cost of doing business".

If you need the C-suite or board to take security sufficiently seriously you can remind them of the legal penalties and costs!

- Do security right because it's the right thing to do and you care about your customer and their data.
- There's the "daily mail test" - how would we feel if there was a breach and it hit the papers?
- Put a cost on breaches, e.g. probability of breach multiplied by cost of breach.
- Use the "house fire" analogy. No-one thinks that insuring your house against fire is a bad investment. The same is true for investing in security before you have a incident or breach.

### Lead from the top

Leaders should do the training too, no-one is too important and it sets the tone and culture, encouraging everyone down to the devs to do the training too.

### Shift left

> Shift Left: "take a task that's traditionally done at a later stage of the process and perform that task at earlier stages"  
> ~ <https://devopedia.org/shift-left>

Move security left. Nuff said. Dev+Security not Dev versus Security.

Check security and licenses at build time. Gives assurance of security for customers.

### The Top 10 is not enough

The [OWASP Top 10](https://owasp.org/Top10/) is a good tool for awareness and generating conversations, but addressing these is only the lowest "level" of security.

A much broader view of security is provided by the [OWASP Application Security Verification Standard](https://owasp.org/www-project-application-security-verification-standard/) (ASVS). It is also broken down into levels to allow you to start at the bottom and work up as your security capabilities mature, and decide what level your business needs to attain based on the relevant risks and regulations. Banks for example would go all the way to level 3.

There are also per-environment lists. E.g. [OWASP Mobile Application Security](https://mas.owasp.org/) for mobile app development.

### Pen tests

Don't just tick off "pen test", ask your pen test providers how they work.

- Do they just cover the OWASP Top 10?
- Do they just cover the SAMM Top 20?
- Do they go deeper than the Top-n?
- Do they look at ASVS?
- What tools do they use?
- Do the tools report against the ASVS? (If not talk to the tool provider!)

### Threat modelling

Use threat modelling, assess and then defend against that.

### Red/blue teams

Can be effective, but also very expensive. Do the basics first (e.g. sql-injection training!)

### Tools & resources to level-up security

- Training and assessments from [Secure Delivery](https://securedelivery.io/). They provide security training and assessments for everyone in the business, not just developers.
- [OWASP Software Assurance Maturity Model](https://owaspsamm.org/) (SAMM) A "measurable way for all types of organizations to analyze and improve their software security posture"
- [Slim Toolkit](https://github.com/slimtoolkit/slim) - had a massive impact in reducing vulnerabilities at dunnhumby.
- [HackSplaining](https://www.hacksplaining.com/) Security training, "Learn to Hack". In use at ClearBank.
- [Snyk](https://snyk.io/) (pronounced "sneak") - security integrated with CI pipelines
- Bug Bounties - good bang for buck, often find privilege escalation at the app level, even for as little as £3k per found vulnerability.
- [OWASP Cornucopia physical card game](https://owasp.org/www-project-cornucopia/) (also available online - [cornucopia online](https://cornucopia.dotnetlab.eu/), [cornucopia game source code](https://github.com/OWASP/cornucopia))
- [OWASP London Chapter Meetups](https://www.meetup.com/OWASP-London/)

### AI, LLMs & ChatGPT

There are new threats and risks with the new AI tools:

- Developers incorrectly using information provided by the LLMs
- ChatGPT allows attackers to accelerate, particularly social engineering. E.g. asking ChatGPT for an org chart instead of having to trawl for data manually, then using that in social engineering attacks. This might make it quicker for an attacker to use someone's manager's name to lend authority.
- Developers etc accidentally exfiltrating sensitive data such as private keys and passwords by providing it as inputs to an LLM such as ChatGPT that then integrates the data into its model in a way that allows extraction by a malicious third-party.

Currently use of ChatGPT is blocked at some big companies.

The change to the security landscape is a bit like asking "how did the creation of the internet change theft".

OWASP has used LLM technology to help make it easier for clients to decide which of the 150 tools they have are most appropriate.
