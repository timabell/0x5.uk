---
title: "The Hidden Cost of Overusing AI Coding Tools: Tech Debt in Sheep’s Clothing"
layout: post
---

My personal experience of coding with AI has not yet lived up to the promises and hype I am seeing online. While the initial contact with LLM code generation was certainly impressive, and I would not forego access to these tools, I find the longer term and larger scale results are thus far disappointing when compared to some of the breathless reports from many online voices, especially the vendors of AI wares.

What follows is a report on the currently published evidence highlighting the shortcomings and downsides of the promised AI coding revolution. GPT has helped my with the research (irony acknowledged), and produces a more journalistically pleasing style than I would do alone, but I have checked out all the referenced sources and quotes to make sure it's not made anything up, and the assertions made herein are backed up by my own direct experience with the available tooling. You may consider this report biased, it is not intended to present both sides, it is intended to provide a single summary of the published information on the *shortcomings* of the current AI tools, and I hope you will find it does a good job of that. Contributions and corrections welcome as always on this most contentious and fast moving of topics.

It is not currently clear to me how much AI coding will improve, though many seem certain that it will, so I can only comment on the state of AI coding right now (June 2025), and I will be more than happy to hear of experiences, tools and approaches that are genuinely improving on the state of the art. I would very much enjoy being able to move towards using AI to build products that solve real problems that would have been out of reach with hand coding, and have made [serious attempts to generate real projects with AI](https://github.com/timabell/FakeCosmosDb), so don't think I am some kind of luddite here, innovations are often painful and disruptive, but in the end leave humanity better off.

## The Productivity Mirage vs. Real-World Reliability

Generative AI coding assistants (Copilot, ChatGPT, etc.) burst onto the scene with promises of rapid development and higher productivity. Yet many of these gains are a mirage. A recent study measuring real developer output found _“no significant gains”_ from using an AI assistant – in fact, [code produced with GitHub Copilot contained **41% more bugs** than code written without it (cio.com/uplevel)](https://www.cio.com/article/3540579/devs-gaining-little-if-anything-from-ai-coding-assistants.html#:~:text=Many%20developers%20say%20AI%20coding,from%20coding%20and%20collaboration%20data). Developers may feel they’re moving faster, but hidden errors accumulate, leading to **downtime** and **outages** when that code hits production.

> "code produced with GitHub Copilot contained **41% more bugs** than code written without it"

[Google’s own 2024 DevOps research noted a _7.2% drop in delivery stability_ at organizations with high AI adoption (devclass.com/DORA)](https://devclass.com/2025/02/20/ai-is-eroding-code-quality-states-new-in-depth-report/#:~:text=an%20estimated%20reduction%20in%20delivery%20stability%20by%207.2%20percent). In plain terms, shipping more code _faster_ means little if that code breaks more often. As one tech CEO put it, [_“It becomes increasingly more challenging to understand and debug the AI-generated code, and troubleshooting becomes so resource-intensive that it is easier to rewrite the code from scratch than fix it.”_ (cio.com)](https://www.cio.com/article/3540579/devs-gaining-little-if-anything-from-ai-coding-assistants.html#:~:text=%E2%80%9C-,It%20becomes%20increasingly%20more%20challenging%20to%20understand%20and%20debug%20the%20AI%2Dgenerated%20code%2C%20and%20troubleshooting%20becomes%20so%20resource%2Dintensive%20that%20it%20is%20easier%20to%20rewrite%20the%20code%20from%20scratch%20than%20fix%20it,-.%E2%80%9D) In other words, today’s AI helpers often create **reliability** nightmares that devour any time they initially saved.

> "research noted a _7.2% drop in delivery stability_ at organizations with high AI adoption"

## Eroding Code Quality and Maintainability

GitClear’s analysis of 211 million lines of code shows that in the AI era [copy-pasted and new code is growing fast while refactoring plummets (devclass.com/GitClear)](https://devclass.com/2025/02/20/ai-is-eroding-code-quality-states-new-in-depth-report/#:~:text=The%20researchers%20found%20that%20the,quality%20without%20changing%20its%20function). More duplicated code and less refactoring for reuse equals more **technical debt**.

Empirical evidence is piling up that AI-generated code is **harder to maintain**. GitClear’s in-depth analysis found that AI coding tools are [_“eroding code quality by increasing duplicated and copy/pasted code and decreasing refactoring.”_ (devclass.com/GitClear)](https://devclass.com/2025/02/20/ai-is-eroding-code-quality-states-new-in-depth-report/#:~:text=eroding%20code%20quality%20by%20increasing%20duplicated%20and%20copy/pasted%20code%20and%20decreasing%20refactoring). In 2024, [the number of code blocks with 5 or more duplicated lines jumped **8 times** higher than before (devclass.com/GitClear)](https://devclass.com/2025/02/20/ai-is-eroding-code-quality-states-new-in-depth-report/#:~:text=the%20number%20of%20code%20blocks%20with%205%20or%20more%20duplicated%20lines%20increased%20by%208%20times%20during%202024), a massive explosion of copy-paste coding.

> "the number of code blocks with 5 or more duplicated lines jumped **8 times** higher"

Duplicate code might work at first, but it’s a ticking time bomb – bloating codebases and **increasing defect risk** whenever a change in one place isn’t carried over everywhere. Alarmingly, 2024 was the **first year on record** where engineers removed/rewrote (“moved”) _far fewer_ lines of code than they copy-pasted; [refactoring activity dropped ~40% (based on moved lines) (devclass.com/GitClear)](https://devclass.com/2025/02/20/ai-is-eroding-code-quality-states-new-in-depth-report/#:~:text=The%20researchers%20also%20noted%20a,the%20number%20of%20moved%20lines). This matters because experienced human developers constantly refactor – they consolidate logic into reusable modules and improve clarity. That’s how we keep systems clean and adaptable. AI, by contrast, tends to paste new blocks wholesale without understanding the bigger design. The result is **spaghetti code** that might function today but becomes a nightmare tomorrow. As GitClear observes, the ability to **“consolidate previous work into reusable modules”** is an essential advantage human programmers have over AI – and we’re seeing significantly less of it in AI-influenced codebases.

> "AI, by contrast, tends to paste new blocks wholesale without understanding the bigger design.
>
> The result is spaghetti code that might function today but becomes a nightmare tomorrow."

In short, forcing programmers to over-rely on LLMs is **injecting new tech debt** into projects at unprecedented scale – an invisible debt that will come due with heavy interest in the form of difficult changes and costly bugs down the line. The programmers may be the ones who have to clean up the mess, but it's the businesses, executives and their customers who will bear the **real costs** of failures, security flaws and loss of agility.

## Bugs, Outages and the Risk of Downtime

It’s not just code aesthetics at stake – it’s uptime and business continuity. What good is cranking out features faster if your service becomes flaky or falls over in production? Unfortunately, organizations pushing LLM-generated code are reporting **more fires to fight**. In one survey of 500 software engineering leaders & practitioners, [**59%** said that when using AI coding tools, they encounter problems in **at least half** of their code deployments (itpro.com/Harness)](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=Harness%20found%2059,when%20using%20AI%20coding%20tools).

Each failed deployment could mean

- an outage,
- a rollback,
- or sometimes hours of emergency troubleshooting.

> "**59%** said that when using AI coding tools, they encounter problems in **at least half** of their code deployments"

Even more worrying, **92%** of respondents noted that while AI tools do increase the volume of code shipped to production, they also [**increase the “blast radius” of bad deployments** (itpro.com/Harness)](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=they%20noted%20they%20also%20increased%20the%20%E2%80%98blast%20radius%E2%80%99%20of%20a%20bad%20deployment.). In other words, when AI-assisted code blows up, it tends to create a _bigger mess_ – affecting more modules and users – than traditionally written code. More surface area for failures means higher chances of severe downtime or cascading outages.

The reliability red flags don’t stop there. [Over **half** of engineering leaders have observed a rise in security vulnerabilities and **incidents** after adopting AI-generated code (itpro.com/Harness)](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=Just%20over%20half%20%2852,an%20increase%20in%20performance%20problems). [Performance problems are cropping up as well (itpro.com/Harness)](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=Just%20over%20half%20%2852,an%20increase%20in%20performance%20problems). These are exactly the sort of issues that lead to unplanned downtime and frantic late-night calls.

> "Over **half** of engineering leaders have observed a rise in security vulnerabilities and **incidents**"

Remember, downtime isn’t just an IT headache – it’s a **financial nightmare**. Recent research shows [unplanned IT outages now **cost** businesses on average about **$14,000 per minute**, rising to **$23,000 per minute** for large enterprises (bigpanda.io)](https://www.bigpanda.io/blog/it-outage-costs-2024/#:~:text=Costs%20are%20rising.%20Unplanned%20downtime%20now%20averages%20:~:text=For%20years%2C%20the%20IT%20industry,to%20%2423%2C750%20for%20large%20enterprises4%2C056%20per%20minute%2C%20rising%20to%20$23%2C750%20for%20large%20enterprises). Imagine a critical system going down for an hour due to a subtle bug in AI-written code – that could be a seven-figure loss, not even counting reputational damage.

> "unplanned IT outages now **cost** businesses on average about **$14,000 per minute**"

It’s telling that Google’s DevOps report measured a [_decrease_ in overall software **stability** (devclass.com/GitClear)](https://devclass.com/2025/02/20/ai-is-eroding-code-quality-states-new-in-depth-report/#:~:text=the%20DORA%20report%20also%20identified,more%20prone%20to%20creating%20instability.%E2%80%9D) even as individual code snippets maybe got a bit cleaner.

Faster code delivery means nothing if it comes hand-in-hand with more frequent **outages**. Reliability is king in production, we even fund entire highly skilled and highly paid Site Reliability Engineering (SRE) teams to ensure reliability, and right now these AI coding tools are undermining it.

## Slower Progress and Mounting Costs

Paradoxically, the push to “speed up” development with LLMs can end up **slowing you down** in the long run. Teams quickly discover that AI-generated code isn’t a free lunch – you pay for it in **verification and fixes**. A majority of developers report that using AI assistants has _increased_ the overhead of code reviews, testing, and debugging. In the same survey, [**67%** of developers said they now spend **more time debugging** AI-generated code (itpro.com/Harness)](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=67%25%20developers%20said%20they%20spend%20more%20time%20debugging%20AI%2Dgenerated%20code) (chasing down the AI’s mistakes), and [**68%** spend more time **fixing security flaws** introduced by AI suggestions (itpro.com/Harness)](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=68%25%20spent%20more%20time%20resolving%20security%20vulnerabilities%20after%20adopting%20AI%20tools). This extra toil directly eats into time that could have built new features or improved customer experience. In fact, engineers note that this [_“increased verification overhead”_](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=The%20report%20argued%20that%20while%20AI%20accelerates%20code%20production%20it%20ultimately%20creates%20%E2%80%9Cnew%20demands%20around%20code%20review%2C%20security%20validation%2C%20and%20quality%20assurance%20%5BQA%5D.%E2%80%9D) is [offsetting a **considerable amount of the productivity gains**](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=this%20%E2%80%9Cincreased%20verification%20overhead%E2%80%9D%20offsets%20a%20%E2%80%9Cconsiderable%20amount%20of%20the%20productivity%20gains%E2%80%9D) AI was supposed to bring. More code is getting written, yes – but **more code = more to read, review, test, QA, troubleshoot and rework**. As developers we've known for a very long time that [Every Line of Code You Write Is a Liability](https://medium.com/@harshithgowdakt/every-line-of-code-you-write-is-a-liability-400d623a54c9) and that [The Best Code is No Code At All](https://blog.codinghorror.com/the-best-code-is-no-code-at-all/), so is it really a surprise that producing higher volumes of code with an unthinking LLM is turning out to have downsides?

> engineers note that this “increased verification overhead” is offsetting a considerable amount of the productivity gains AI was supposed to bring

Even worse than the massive costs of time being spent by diligent developers fixing the AI generated security flaws before shipping is the developers who ship make themselves look like 100x engineers, blasting through tickets and story points twice as fast as their peers by not "wasting" any time at all even *looking* for security flaws and maintainability problems in the AI-generated code, thus leaving the organisation wide open to risk of cyberattacks. There is huge pressure on development teams right now to be ever more "productive" in the eyes of people who do not understand the difference between good code and bad code, so the incentives to just "vibe code" and ship whatever the AI produces is almost irresistible, especially when the "slowest" engineers are often unceremoniously fired in this highly competitive and budget constrained environment. Ironically the worst engineers are likely to move the fastest with AI as they blindly trust its output without knowing any better, massively increasing the risks to the organisation and the stability, flexibility and maintainability of the delivered systems.

Looking at pull requests and release cycles: one study found [**no improvement in merge times or throughput** for developers using Copilot (cio.com/Uplevel)](https://www.cio.com/article/3540579/devs-gaining-little-if-anything-from-ai-coding-assistants.html#:~:text=The%20study%20measured%20pull%20request%20(PR)%20cycle%20time%2C%20or%20the%20time%20to%20merge%20code%20into%20a%20repository%2C%20and%20PR%20throughput%2C%20the%20number%20of%20pull%20requests%20merged.%20It%20found%20no%20significant%20improvements%20for%20developers%20using%20Copilot.). Any code churn savings were nullified by the need to double-check AI output or deal with new defects. As one report aptly stated, _AI accelerates code production but_ [_ultimately creates “new demands around code review, security validation, and \[QA\].”_ (itpro.com/Harness)](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=ultimately%20creates%20%E2%80%9Cnew%20demands%20around%20code%20review%2C%20security%20validation%2C%20and%20quality%20assurance%20%5BQA%5D.%E2%80%9D). All that translates to **inability to ship new features** at the pace leadership expects, because developers are tied up in a perpetual game of AI code whack-a-mole. Instead of focusing on new business initiatives, your team is stuck **fixing** and re-architecting what the AI churned out. In practical terms, that’s lost opportunity.

> one study found no improvement in merge times or throughput for developers using Copilot

This overhead has real financial cost. Consider debugging and rework: if highly-paid engineers are burning hours combing through AI-written code for errors or going back to find out which bit of the AI generated code broke production or resulted in a security breach the dollars add up fast. **78%** of developers say they spend at least 30% of their time on manual tasks (like writing compliance policies, conducting quality assurance testing, and error remediation) – [equating to about **$32,000 of salary per developer per year** wasted (itpro.com/Harness)](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code#:~:text=Using%20the%20average%20developer%20salary%20of%20:~:text=Using%20the%20average%20developer%20salary,of%20wasted%20investment%20per%20developer07%2C599%2C%20Harness%20found%20that%20if%20devs%20are%20spending%2030%25%20of%20their%20time%20on%20manual%20tasks%2C%20this%20would%20equate%20to%20$32%2C280%20of%20wasted%20investment%20per%20developer.) on work not directly contributing to product output. Scaled to a team of 25 devs, that’s roughly **$800,000** in lost productivity annually – including the hidden **cost-of-fix** for subpar code. Now imagine a chunk of that burden is increasingly becoming AI’s “bad output tax.” It’s like taking on a bunch of junior developers who can churn out code quickly but require senior engineers to babysit and clean up after them. The **cost to fix** issues later (in debugging, outages, patches, compliance work, etc.) _far exceeds_ the cost to do it right upfront. No wonder some teams report that [adopting AI coding tools actually _slowed_ their feature delivery due to the remediation workload (turintech.ai)](https://www.turintech.ai/blog/the-hidden-cost-of-ai-generated-code-what-research-and-industry-trends-are-revealing#:~:text=The%20paper%20highlights%20that%20increased%20AI%2Dgenerated%20code%20does%20not%20equate%20to%20faster%20software%20delivery.).

Perhaps the most damning feedback comes from the trenches: [_“It is easier to rewrite the code from scratch than fix it”_ (cio.com)](https://www.cio.com/article/3540579/devs-gaining-little-if-anything-from-ai-coding-assistants.html#:~:text=becomes%20so%20resource%2Dintensive-,that%20it%20is%20easier%20to%20rewrite%20the%20code%20from%20scratch%20than%20fix%20it,-%2C%E2%80%9D%20he%20says.) when it’s generated by current AI tools. Think about that. Throwaway code, maintainability so poor that starting over is preferable. That is the **very definition of [technical debt](/2020/07/09/approaches-to-refactoring-and-technical-debt/)**. Every time your developers have to scrap an AI-generated module and re-implement it properly, you’ve doubled the work and lost precious time. This is the “new tech debt in sheep’s clothing” – it sneaks in under the guise of rapid development, but later you pay through the nose to correct, refactor, or replace it.

## Hype vs. Reality: Don’t Buy Fool’s Gold

It’s easy to be swept up in the hype. In today’s “AI revolution,” many technical folks are eagerly justifying these tools – some genuinely optimistic, others perhaps seeing **fool’s gold** in the latest trend. We’ve all heard enthusiastic voices touting how AI will write flawless code and free us from grunt work. But as an engineering leader, you must cut through that noise. The facts on the ground are clear: current LLM-based coding tools are **not** on par with an experienced human engineer when it comes to producing clean, robust, supportable code. They might get there someday, but **today they’re not even close**. As one industry expert observed, we risk [_“trading deep understanding for quick fixes”_ (itpro.com/Goel)](https://www.itpro.com/software/development/junior-developer-ai-tools-coding-skills#:~:text=%E2%80%9C-,We%E2%80%99re%20trading%20deep%20understanding%20for%20quick%20fixes,-%2C%20and%20while%20it) by over-relying on AI, especially with less-experienced devs. That trade-off can **backfire** spectacularly when complex systems start misbehaving. It's hard to fix a complex system when you never understood how it worked in the first place.

> The facts on the ground are clear: current LLM-based coding tools are not on par with an experienced human engineer when it comes to producing clean, robust, supportable code.

None of this is to say AI has no place in software development – it can be a handy helper for boilerplate suggestions or exploration. The key is **not to overuse or force it on programmers** as a substitute for proper engineering practice. Wise CTOs and architects will treat AI outputs as junior developer code: useful, but to be thoroughly reviewed, tested, and often heavily refactored.

Blind faith in the current generation of LLMs is misplaced. They don’t understand your business domain, architecture, or quality standards – so treat the hype with healthy skepticism. The cost of getting it wrong isn’t just a petty code style issue; it’s **lost revenue from outages**, **ballooning maintenance costs**, and **slower time-to-market** for new initiatives while your team struggles under a mountain of AI-induced rework. In short, rushing unwarranted AI-generated code into your core systems can put your company on a fast track to [the kind of **technical debt** that cripples agility](https://charmconsulting.co.uk/2020/11/27/leaders-guide-to-technical-debt/).

> Blind faith in the current generation of LLMs is misplaced  
> ...  
> a fast track to the kind of technical debt that cripples agility.

## Conclusion: Mitigate Now, or Pay (More) Later

As someone with over 20 years in software engineering, I’ve seen this pattern before. Whether it was systems built by ultra-low-cost outsourcers or by undertrained teams, the result is the same: **poor-quality code leads to pain**. LLM-generated code, when overused, is _not that different_. It promises the world, but if you’re not extremely careful, you end up with a fragile, convoluted system that **bleeds money and time** to fix. The wise move for any technology executive today is to approach AI coding tools with **eyes open**. Establish strict guidelines, monitor code quality metrics, invest in additional testing and AI code validation if you do use them – and above all, don’t let the excitement over AI overshadow fundamental engineering principles. If a shortcut seems too good to be true, it probably is.

Finally, be prepared: if you discover down the road that your codebase has become an unmaintainable AI-generated house of cards, don’t panic. **I can help.** I’ve spent years untangling disastrous, brittle systems and turning them into solid, scalable platforms. The sooner you address the issue, the less **downtime** and cost you’ll suffer.

Technology trends come and go, but solid software engineering practices are timeless. When the hype dust settles and the **consequences** of over-relying on today’s LLMs rear their head, make sure you have seasoned experts on hand to set things right. _You don’t have to wait for an outage to take action – let’s connect and ensure your software foundation stays strong._ Your future self (and your customers and CFO) will thank you.

## Sources, references & further reading

This article is based on recent research and industry reports on AI-generated code quality and business impact. Full list of sources below.

The case is getting stronger that the hype is not bourne out by the actual results being observed in industry when studied rigorously beyond individual anecdote, the wow-factor of first encounters with an LLM, marketing-hype and studies commissioned by the AI vendors.

### In depth reports & research

> "The adoption of AI codegen tools thus far has actually resulted in a significant increase in the developer workload–while AI accelerates initial code production, it creates new demands around code review, security validation, and quality assurance. This increased verification overhead arguably offsets a considerable amount of the productivity gains."
>
> ~ ["The State of Software Delivery Report 2025: Beyond CodeGen: The Role of AI in the SDLC" - harness.io](https://www.harness.io/state-of-software-delivery#:~:text=The%20adoption%20of%20AI%20codegen,%E2%80%8D)

---

> "our research revealed a critical finding: AI adoption may negatively impact software delivery performance. As AI adoption increased, it was accompanied by an estimated  decrease in delivery throughput by 1.5%, and an estimated reduction in delivery stability by 7.2%. Our data suggest that improving the development process does not automatically improve software delivery"
>
> ~ [Google DORA 2024 report](https://cloud.google.com/blog/products/devops-sre/announcing-the-2024-dora-report#:~:text=our%20research%20revealed%20a%20critical,not%20automatically%20improve%20software%20delivery)

---

> "Developers with Copilot access saw a significantly higher bug rate while their issue throughput remained consistent"
>
> ~ ["Gen AI for Coding" Research Report - Uplevel Data Labs"](https://resources.uplevelteam.com/gen-ai-for-coding#:~:text=Developers%20with%20Copilot%20access%20saw%20a%20significantly%20higher%20bug%20rate%20while%20their%20issue%20throughput%20remained%20consistent.)

---

> "We observe a spike in the prevalence of duplicate code blocks, along with increases in short-term churn code, and the continued decline of moved lines (code reuse)."
>
> ~ ["AI Copilot Code Quality: 2025 Data Suggests 4x Growth in Code Clones" - GitClear](https://www.gitclear.com/ai_assistant_code_quality_2025_research#:~:text=We%20observe%20a%20spike%20in%20the%20prevalence%20of%20duplicate%20code%20blocks%2C%20along%20with%20increases%20in%20short%2Dterm%20churn%20code%2C%20and%20the%20continued%20decline%20of%20moved%20lines%20(code%20reuse).)

---

> "I decided to investigate more systematically how well such AI startups were doing. I found that many were proving not nearly as valuable to society as all the hype would suggest."
>
> ~ ["AI and Economic Productivity: Expect Evolution, Not Revolution" - IEEE Spectrum, 2019](https://spectrum.ieee.org/ai-and-economic-productivity-expect-evolution-not-revolution#:~:text=I%20decided%20to%20investigate%20more%20systematically%20how%20well%20such%20AI%20startups%20were%20doing.%20I%20found%20that%20many%20were%20proving%20not%20nearly%20as%20valuable%20to%20society%20as%20all%20the%20hype%20would%20suggest.) by [Dr. Jeffrey Funk](https://www.linkedin.com/in/dr-jeffrey-funk-a979435/)

### Published articles

> "It becomes increasingly more challenging to understand and debug the AI-generated code, and troubleshooting becomes so resource-intensive that it is easier to rewrite the code from scratch than fix it." - Ivan Gekht, CEO, Gehtsoft
>
> ~ ["Devs gaining little (if anything) from AI coding assistants" - CIO.com"](https://www.cio.com/article/3540579/devs-gaining-little-if-anything-from-ai-coding-assistants.html#:~:text=%E2%80%9CIt%20becomes%20increasingly%20more%20challenging,%E2%80%94Ivan%20Gekht%2C%20CEO%2C%20Gehtsoft)

---

> "It is easy to say, as Google does, that organizations should establish guidelines for use of AI to address concerns; but tools which encourage bad practice will inevitably increase bad practice until they are improved."
>
> ~ ["AI is eroding code quality states new in-depth report - devclass.com"](https://devclass.com/2025/02/20/ai-is-eroding-code-quality-states-new-in-depth-report/#:~:text=It%20is%20easy%20to%20say%2C%20as%20Google%20does%2C%20that%20organizations%20should%20establish%20guidelines%20for%20use%20of%20AI%20to%20address%20concerns;%20but%20tools%20which%20encourage%20bad%20practice%20will%20inevitably%20increase%20bad%20practice%20until%20they%20are%20improved.)

---

> "Costs are rising. Unplanned downtime now averages $14,056 per minute, rising to $23,750 for large enterprises."
>
> ~ ["The rising costs of downtime - BigPanda"](https://www.bigpanda.io/blog/it-outage-costs-2024/)

---

> "AI-generated code is increasing the burden on development teams, rather than reducing it.  This isn’t just an isolated finding. Across the industry, teams are realizing that while AI can accelerate code production, it often introduces new inefficiencies in validation, security, and maintainability."
>
> ~ ["The Hidden Cost of AI-Generated Code: What Research and Industry Trends Are Revealing - TurinTech AI"](https://www.turintech.ai/blog/the-hidden-cost-of-ai-generated-code-what-research-and-industry-trends-are-revealing)

---

> "Sure, the code works, but ask *why* it works that way instead of another way? Crickets. Ask about edge cases? Blank stares."
>
> ~ [New Junior Developers Can’t Actually Code - N’s Blog](https://nmn.gl/blog/ai-and-learning#:~:text=Sure%2C%20the%20code%20works%2C%20but%20ask%20why%20it%20works%20that%20way%20instead%20of%20another%20way?%20Crickets.%20Ask%20about%20edge%20cases?%20Blank%20stares.)

---

> "Every line of code has the potential to contain bugs or errors, leading to unexpected behaviour, system crashes, or incorrect results.  
> ...  
> Code can inadvertently create security holes that attackers might exploit to gain unauthorized access or disrupt services."
> ~ [Every Line of Code You Write Is a Liability ~ Harshith Gowda](https://medium.com/@harshithgowdakt/every-line-of-code-you-write-is-a-liability-400d623a54c9#:~:text=Every%20line%20of%20code%20has%20the%20potential%20to%20contain%20bugs%20or%20errors%2C%20leading%20to%20unexpected%20behaviour%2C%20system%20crashes%2C%20or%20incorrect%20results.)

---

> "the best code is no code at all. Every new line of code you willingly bring into the world is code that has to be debugged, code that has to be read and understood, code that has to be supported. Every time you write new code, you should do so reluctantly, under duress, because you completely exhausted all your other options. Code is only our enemy because there are so many of us programmers writing so damn much of it. If you can’t get away with no code, the next best thing is to start with brevity."
>
> [The Best Code is No Code At All ~ Jeff Atwood](https://blog.codinghorror.com/the-best-code-is-no-code-at-all/#:~:text=the%20best%20code%20is%20no,is%20to%20start%20with%20brevity.)

---

> “A mess is not a technical debt. A mess is just a mess.” ~ Uncle Bob
>
> [Approaches to refactoring, technical debt and legacy code](/2020/07/09/approaches-to-refactoring-and-technical-debt/)

---

> "We need to rewrite x/y, or maybe even the entire system"
>
> [Leaders guide to technical debt - aka "why can't we ship anything!?"](https://charmconsulting.co.uk/2020/11/27/leaders-guide-to-technical-debt/)

### Secondary articles

These are journalistic pieces based on other primary sources listed in this article:

- ["‘We’re trading deep understanding for quick fixes’: Junior software developers lack coding skills because of an overreliance on AI tools – and it could spell trouble for the future of development - itpro.com"](https://www.itpro.com/software/development/junior-developer-ai-tools-coding-skills) - based on N's blog (above)
- ["AI coding tools aren’t the solution to the unfolding 'developer crisis'"- itpro.com"](https://www.itpro.com/software/development/ai-coding-tools-arent-the-solution-to-the-unfolding-developer-crisis-teams-think-they-can-boost-productivity-and-delivery-times-but-end-up-bogged-down-by-manual-remediation-and-unsafe-code) - Based on the Harness report (above)
