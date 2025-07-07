---
layout: post
title: Setting up a static website/blog with jekyll
categories: [howto,backstage]
---

A couple of people asked me for more info on my new blog setup here's a rough
outline of what's involved in setup and posting. There are *many* ways of doing
this, this is just the way that suited me best for now.

What you need to follow along:

* A domain from [GoDaddy](https://uk.godaddy.com/)
* An account on [GitHub](https://github.com/)


# Things I like about this setup

* Built-in backups,
* offline editing,
* no shonkey web gui,
* no charge for hosting with custom domain and https,
* simple dev friendly templating,
* a nice simple code-friendly mobile-friendly design,
* full control.
* [public revision
  history](https://github.com/timabell/timwise.co.uk/commits/master) of blog
  posts with no extra effort (no more "updated: blah" in blog posts)

# Why jeykll fits that

A blog post like this one is just a text file in a special format called
markdown. These can then be trivially source-controlled with git, which serves
as version control and distributed backup in one neat package. I use git for
work so although it's not the easiest tool to use that's not a problem for me.
Theoretically if you don't know git you could probably just do all your editing
in the github web interface these days.

Here's the *entire* folder structure of this blog as it stands right now. You
can see there's really not a lot too it.

```
tim@fox:~/repo/timwise.co.uk(master)
$ tree
.
├── 404.md
├── about.md
├── categories.md
├── CNAME
├── _config.yml
├── _drafts
│   └── 2019-06-24-setting-up-a-jekyll-blog.md
├── favicon.ico
├── fonts
│   ├── aramisi.ttf
│   ├── EBGaramond-Regular.ttf
│   └── FuturaPTLight.otf
├── images
│   ├── 404.jpg
│   ├── reverie-demo.png
│   ├── reverie.png
│   └── reverie-text.png
├── _includes
│   ├── analytics.html
│   ├── disqus.html
│   ├── meta.html
│   └── svg-icons.html
├── index.html
├── _layouts
│   ├── default.html
│   ├── page.html
│   └── post.html
├── LICENSE
├── _posts
│   └── 2019-06-21-yet-another-new-blog.md
├── _sass
│   ├── _darcula.scss
│   ├── _highlights.scss
│   ├── _reset.scss
│   ├── _svg-icons.scss
│   └── _variables.scss
└── style.scss

7 directories, 30 files
```

The posts are just text files using the markdown format with a `.md` file extension instead of `.txt` and a short header for information like page title and tags. Here's the top of this one:

```
---
layout: post
title: Setting up a static website/blog with jekyll
categories: [howto,backstage]
---

A couple of people asked me for more info on my new blog setup here's a rough
outline of what's involved in setup and posting. There are *many* ways of doing
this, this is just the way that suited me best for now.

```

# How I set it up

I actually am reconfiguring from another setup, and used some advanced
sillyness, but I'll simplify that here down to roughly the steps you'd need to
go from cold as I'm sure that's more interesting to you.

1. Buy a domain from GoDaddy
1. Create a GitHub account
1. [Find a jekyll
   theme](https://duckduckgo.com/?q=jekyll+themes&t=lm&ia=we://duckduckgo.com/?q=jekyll+themes&t=lm&ia=web)
   on become a base for your new site (the themes vary on how ready they are
   for you to just crack on). Here's [the reverie
   theme](https://github.com/amitmerchant1990/reverie) that I used with minimal
   customisation.
1. Go into the settings for your repo, ![enabling github pages by choosing a
   branch](/images/blog/jekyll-setup/github-repo-settings-tab.png)
1. turn on github pages, ![github settings
   tab](/images/blog/jekyll-setup/github-pages-setup.png)
1. configure your domain name, ![github settings
   tab](/images/blog/jekyll-setup/github-custom-domain.png)
1. enable https ![github settings
   tab](/images/blog/jekyll-setup/github-https.png)
1. Go to GoDaddy and [set up the DNS to point to the github
   servers](https://help.github.com/en/articles/using-a-custom-domain-with-github-pages)

# Blogging with Jekyll

1. Create new text file in the `_posts` folder, name it
   `yyyy-mm-dd-your-post-title.md`,
1. steal the header block from above and customise it for your post,
1. write stuff
1. use markdown for layout,
1. add images by saving them to an images folder and also adding them to your
   git repo, use `![alt text](/images/something.png)` to show the image in your `.md` file,
1. check everything in & `git push` to github,
1. your changes are live within seconds of pushing.

If you aren't up to the full `git` setup, you can edit your blog directly in github's web interface.

1. Creating a new post
   ![creating a post](/images/blog/jekyll-setup/editing-new-file.png)
1. Editing a post
   ![editing a post](/images/blog/jekyll-setup/editing-edit.png)
1. Editing the text of a post
   ![editing the text of a post](/images/blog/jekyll-setup/editing-editing.png)

# Advanced ninja coder blogging

Part of the reason I chose this particular setup is that plain markdown blogging with github pages allows me to use my existing coder tools to blog things really fast, reducing the barrier to me actually sharing useful insights and thoughts with you all.

You can see the advanced editing flow in action here:

<https://www.youtube.com/watch?v=w3gMZTKcGKc>

<iframe width="560" height="315" src="https://www.youtube.com/embed/w3gMZTKcGKc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

Here's the tools I use, as shown in the above video:

- [zsh](https://en.wikipedia.org/wiki/Z_shell) - allows changing directory without `cd`
- [symlinks](https://www.howtogeek.com/287014/how-to-create-and-use-symbolic-links-aka-symlinks-on-linux/) to link blog folder into `~/blog`
- [shell script `new`](https://github.com/timabell/timwise.co.uk/blob/1024d49afab27b08ef060ac2d245a37a9d8b3837/new)
- [template md file](https://github.com/timabell/timwise.co.uk/blob/1024d49afab27b08ef060ac2d245a37a9d8b3837/_drafts/template.md?plain=1)
- [jekyll](http://jekyllrb.com/)
- [github pages](https://pages.github.com/)
- [github actions](https://github.com/timabell/timwise.co.uk/actions) - automatically deploys pages (automatically set up when you enable github pages)
- [markdown](https://commonmark.org/help/) - this is important, it allows efficiently writing richly formatted blog posts with nothing but an (advanced) text editor such as vim or vscode
- [vim](https://www.vim.org/) the original text editor (see also [neovim](https://neovim.io/) that I haven't got around to using yet)
- [fzf the fuzzy finder](https://github.com/junegunn/fzf) - so I can type `**[tab]` and find any blog post easily
- [vscode](https://code.visualstudio.com/) with the [vscode vim emulator extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) - ctrl-p to open any post quickly
- [git](https://git-scm.com/) - provides history, and a very quick way to ship changes to the host (github) all on the command line
- I have many [command line aliases in my dotmatrix](https://github.com/timabell/dotmatrix/blob/main/.aliases) and [aliases in my gitconfig](https://github.com/timabell/dotmatrix/blob/main/.gitconfig) - these make working on the commandline (cli) muuuch faster.
- Ruby locally (advanced coder things)
- [asdf-vm](https://asdf-vm.com/) to ensure I always have the right ruby version available on any machine, or can easily install it
- [tmux](https://www.howtogeek.com/671422/how-to-use-tmux-on-linux-and-why-its-better-than-screen/) to allow me to have the server running in the background while I use the editor

⚠️ Note: ignore the `_site` folder when choosing the file to edit, that's the generated cache and will be overwritten.

# Summary

Wordpress was overcomplicated for my needs, and slower to use/read, this new setup should mean I can tap away on the train and send new thoughts your way more regularly.

# Extras

* Bonus points for MailChimp's [rss to email](https://mailchimp.com/features/rss-to-email/) which means it'll automatically hit your inbox. (I haven't manageed to make it work yet though.)
* Here's all the jekyll gems github pages allows you to add <https://github.com/github/pages-gem/blob/master/lib/github-pages/plugins.rb#L5>
