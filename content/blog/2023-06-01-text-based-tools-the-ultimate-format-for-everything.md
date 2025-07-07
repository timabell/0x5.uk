+++
title = "Text-based tools - the ultimate format for everything"
+++

Having lived in the world of technology for two to three decades now, I've come to a fundamental truth: text formats are **the ultimate** format.

> "text formats are **the ultimate** format"  
>  
> ~ Me, just now

It's funny really because for everything we've invented, of every level of complexity, usability, shinyness etc, when it comes down to it, texts is still king, just like it was in 1980 when I was still learning to talk.

## Properties of text formats

Things that make text inevitably superior to all other more complicated formats:

- Simple - **nothing** to go wrong.
- Use any text editor you like - vim, [vscode+vim](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one), [intellij+vim](https://plugins.jetbrains.com/plugin/164-ideavim) are my gotos, but there are soooo many.
- Sync, backup and restore are trivial - try as they might, nothing beats a folder-tree of text files.
- They are ultimately portable - no change in technology (windows to linux, desktop to cloud, laptop to mobile) requires you to change anything, text is text, just copy them across and carry on, the ultimate defense against the ever-present pernicious vendor-lockin.
- Conflict resolution is always possible - edited two out of sync copies? No problem, there's a plethora of tools ([kdiff3](https://kdiff3.sourceforge.net/) is my favourite), or you can just do it manually if you wish.
- Version control supported - text files are trivially versionable in tools like git, everything understands it and can show diffs etc.
- Simple conventions like markdown, yaml, toml, and even slightly more complicated things like json don't fundamentally break any of the above.
- With some lightweight processing and structure (noteably markdown), the same basic format can be automatically converted to a plethora of rich and beautiful forms, and with so many tools understanding formats like markdown you are spoilt for choice.
- Supports emoji - this one is more modern, but its usefulness is not to be underestimated, and thanks to utf-8 and unicode the plain-old-text-file can have rich emotions and symbols too.
- You can use all sorts of interesting tools to process text files, many from the linux cli stack such as `sed`, `grep` (or `ag`), plus full-on shell scripting to automate repetitive tasks [such as making a new blog post](https://github.com/timabell/timwise.co.uk/blob/eff17d609f862a14275c4fa0bd8319d13d59574e/new).

## Amazing things you can do with text files

The below are all things I personally swear by and use daily. I wish more things were like this.

Markdown is by far my favourite text format, and it's incredibly versatile. In my crusade to basically convert everything to plain text / markdown files having been repeatedly burnt by fancy binary formats (`.doc` anyone?). GraphViz ("dot" format) is also a notably powerful text-based system.

### Blogging

As per this blog, see ["Setting up a static website/blog with jekyll"](/2019/06/24/setting-up-a-jekyll-blog/) from 2019. No regrets there. Writing this in vim in a terminal.

### Slide decks

#### Reveal.js

[reveal.js]() can parse markdown files with a sprinkling of html & css allowed inline (very handy) and turn them into stunning modern presentations with slick animations and multi-step reveals, amazing.

I was trying to create some slides in google-slides thinking that would be the quick way, ran into some bizarre formatting limitation and went hunting for alternatives. I haven't looked back, at least for things I don't need real-time collaboration on.

You can see what I managed to do with [reveal.js for the Rust Workshop](https://rustworkshop.github.io/slide-decks/) - here's one of the [source slide markdown files](https://github.com/rustworkshop/slide-decks/blob/7eb002bfc1431025b47de97fd20e163456b5d7e5/decks/rust-workshop-master/slides.md?plain=1)

#### Marp

For a simpler setup for markdown slides I'm now (Jun 2025) using [Marp](https://marp.app/)

You can see my current setup at <https://github.com/timabell/marp-decks> which auto-published to github pages at <https://deck.0x5.uk/>

### Note taking

Markdown, VSCode with some markdown plugins, maybe even a [markdown-wiki](https://marketplace.visualstudio.com/items?itemName=kortina.vscode-markdown-notes) tool. [Markor](https://f-droid.org/packages/net.gsantner.markor/) on android. [Syncthing](https://syncthing.net/) to keep them in sync across devices. Works for me, and any conflicts due to editing files out of sync is easier to deal with than [tomboy](https://wiki.gnome.org/Apps/Tomboy)'s nasty XML format (yes I know XML is text but it's still naaaasty).

And for something much fancier, [Logseq](https://logseq.com/) is a FOSS note-taking app that stores all your notes as markdown and layers on a sqlite index, a great UI, and a ton of plugins.

### Creating pdf files

Thanks to [pandoc](https://pandoc.org/) (other tools are available), you can trivially convert your markdown files to pdf files for sharing with people who insist on that as a format.

```bash
pandoc --from=gfm --to=pdf -t html5 "input.md" -o "output.pdf"
```

### Killer CV

Thanks to [json resume](https://jsonresume.org/) you can create a CV in json (or yml), capturing the pure data, and then run it through a series of theme and formatting engines shared by the community to make something really fab in multiple formats.

### Coding

This entry is only half tongue-in-cheek. I think it's worth pointing out that programmers have, after flirting with *many* other approaches, settled on plain old ASCII as being the one-true-format for explaining to a computer (and other programmers) what the computer is supposed to be doing. Pay attention to what programmers have learnt, there is much depth here on managing vast amounts of precise information in text form. Especially if you are not a programmer or not used to text tools there is much to learn from this world. You might think programmers are odd creatures that thrive on unnecessary complexity; nothing could be further from the truth, they (we) are *obsessive* about solving problems once and for all and being ruthlessly efficient in all things. The fact that programmer practices are seen as odd by the general public is more a sign of just how far programmers have optimised their lives away from the unthinking defaults of the masses than it is of any peculiarity of whim or culture.

### Graphs & flowcharts

There are many formats for rendering diagrams from plain text description

#### GraphViz / dot

The GraphViz dot format is amazing, it takes a bit of getting used to, but once you've got it then you can rearrange your flow chart with vim in a few keypresses and have the whole thing rearranged in milliseconds. Amazing.

There's even some neat web based real-time renderers:

- <https://dreampuf.github.io/GraphvizOnline/>
- <https://sketchviz.com/>

#### Mermaid

For UML, graphviz and many other formats there is [mermaid.js](https://mermaid.js.org/), and amazingly you can embed the mermaid formats in markdown and [github pages will render your mermaid diagrams](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-diagrams). Win.

#### PlantUML

[PlantUML](https://plantuml.com/) is a format and renderer for many types of diagrams, including UML obviously.

[Chris Bimpson posted "Automating Architecture Diagrams"](https://christopher-bimson.github.io/2025/05/automating-architecture-diagrams/) which provides a great example of using this in practice, though there are many ways to use this tooling.

### Documenting things in markdown

- It's pretty common in developer land to write docs for things in a markdown `README.md` file (for example the [gitopolis readme](https://github.com/rustworkshop/gitopolis/blob/main/README.md))
- Architectural Decision Records (ADRs) are a great format for documenting the reasons for decision, and that works great with the [Markdown-ADR template "MADR"](https://adr.github.io/madr/)

## The yucky bits

The almost-rans:

- Email's mbox format is kinda text, but due to the way it's set up is *horrible* for sync
- vcf for contacts, what happened there then?!
- ical for calendars, what a disaster, so close but yet never works, shame
- XML - nice try, turned out to be horrible in hindsight, but not before we'd written almost all software to use it (`.docx` anyone?)

The text world is a bit short on collaborative real-time editing - google-docs is still king on that one, though it would be perfectly possible for equivalent tools to be created for the above text formats and tools. Watch this space.

Crappy half-arsed implementations of markdown, looking at you Jira/Confluence/Slack (not really a problem of text, more something where we're almost there with and then crappy WYSIWIG implementations wreck it).

# Links

- ["always bet on text" by graydon2](https://graydon2.dreamwidth.org/193447.html)
