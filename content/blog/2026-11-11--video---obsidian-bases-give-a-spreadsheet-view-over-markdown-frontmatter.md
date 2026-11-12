---
path: /2026/11/11/video---obsidian-bases-give-a-spreadsheet-view-over-markdown-frontmatter/
title: "📹 Video - Obsidian Bases give a spreadsheet view over markdown frontmatter"
---

I've been *very* impressed with Obsidian bases.

It's added to my "PKMS" (Personal Knowledge Management System - i.e. big pile of wiki-style notes in PARA folders in a vault (a folder) - such grand names for everything), and I'm looking to move my goodreads list into it.

This is a side-quest from the getting-things-done productivity, into more of the knowledge management, but it can also feed into the todos with properties representing states such as books waiting to be read.

I've recorded a concise demo vid (edited down from 26 mins of raw recording to 6 mins published to save your valuable time from all my thinking and mis-steps).

Take a look at it here, part of my growing "productivity" series on youtube:

[![Obsidian Bases are spreadsheets for markdown frontmatter - I had no idea! - Youtube](/assets/posts/obsidian-bases-youtube.png)](https://www.youtube.com/watch?v=hAOdEnZgHcg&list=PLWPTFoHElQsg&index=6)

It really is very simple, and you don't even have to write the `yml` as obsidian does that with a nice point-n-drool UI.

## A book note with frontmatter

```md
---
book_status: want-to-read
via: podcast
goodreads:
amazon: https://www.amazon.co.uk/How-Take-Smart-Notes-Technique/dp/3982438802
audible:
author: "[[People/Sönke Ahrens]]"
---

some notes on the book

[[Zettlekasten]] is a bit like trying to invent a [[wiki]] when all you have is pen and paper.

core concept of zettlekasten - raw atomic ideas with references, plus layers of digested thinking in ever increasing length, resulting in "writing" a long paper or article being more a case of stitching together all the raw material writing from the lower layers. useful book
```
<https://github.com/timabell/obsidian-demo-vault/blob/3126470f031f36ba44c2a75dc081ef59a20f0a7c/Books/How%20to%20take%20smart%20notes.md?plain=1>

## A book frontmatter template

to make it easy to add properties (frontmatter) to new/existing book notes:

```md
---
book_status:
via:
goodreads:
amazon:
audible:
author:
---
```
<https://github.com/timabell/obsidian-demo-vault/blob/3126470f031f36ba44c2a75dc081ef59a20f0a7c/templates/book.md?plain=1>


## And the .base file

that obsidian magically renders into a dynamic, editable, filterable spreadsheet-like view:

```.yaml
views:
  - type: table
    name: Table
    filters:
      and:
        - file.inFolder("Books")
    order:
      - book_status
      - file.name
      - author
      - via
    columnSize:
      note.author: 193
```
<https://github.com/timabell/obsidian-demo-vault/blob/3126470f031f36ba44c2a75dc081ef59a20f0a7c/book%20list.base>

## Discuss on reddit

[Discuss this video on reddit](https://www.reddit.com/r/ObsidianMD/comments/1xt52qo/more_love_for_obsidian_bases_i_made_a_little_demo/)
