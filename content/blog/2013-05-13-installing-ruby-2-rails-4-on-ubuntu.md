---
layout: post
title: Installing ruby 2 + Rails 4 on Ubuntu 12.04 LTS
date: '2013-05-13T10:29:00.000Z'
author: Tim Abell
tags:
- ruby
modified_time: '2014-10-16T17:36:56.124Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-8035590818501389253
blogger_orig_url: https://timwise.blogspot.com/2013/05/installing-ruby-2-rails-4-on-ubuntu.html
---

Installing [Ruby](http://www.ruby-lang.org/) 2 + [Rails](http://rubyonrails.org/) 4 on [Ubuntu](http://www.ubuntu.com/) 12.04 LTS

_Update Dec 2013:_ You may also wish to read [benkwok's blog post on installing ruby and rails](http://benkwok.wordpress.com/2013/08/15/install-rails-on-ubuntu-12-04-lts-with-rbenv/). I've also [posted my notes from installing for an existing project](/2013/12/04/getting-rails-4-up-and-running-with/) which doesn't entirely replace this post but reflects my more recent learnings.

There's a few of these blog posts around, but here's mine for my own benefit (I'm sure this won't be the last time I do it!).

If you have a packaged ruby / rails / rvm / rbenv etc installed, get rid of them all, eg:

    $ ruby --versionruby 1.8.7 (2011-06-30 patchlevel 352) [x86_64-linux]$ sudo apt-get remove ruby

Don't use [rvm](https://rvm.io/); and make sure it's been literally purged from your system. It's a pain to remove as it gets into all sorts of places and even _apt-get purge_ doesn't undo changes to the profile etc. If you want to know more about the reason for not using it then read the [rbenv "why" page](https://github.com/sstephenson/rbenv/wiki/Why-rbenv%3F), it's persuasive stuff.

My recommendation from experience so far is to use [rbenv](http://rbenv.org/) to install the latest and greatest RoR (Ruby on Rails). Don't bother with the ubuntu packaged version of rbenv (from apt etc) as you'll be off the beaten track and will have to figure out the ruby-build plugin installation yourself. The local user install is painless and works well. The instructions say to make sure rvm is removed first as it's incompatible.

*   Sidenote, [http://rbenv.org/](http://rbenv.org/) is just a one-click link to [https://github.com/sstephenson/rbenv](https://github.com/sstephenson/rbenv)
*   Direct link to [rbenv readme](https://github.com/sstephenson/rbenv#readme) (for your convenience)

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/8734272311"><img src="https://live.staticflickr.com/7308/8734272311_f49ccb1e42_k.jpg" alt="Minster Church, Boscastle"></a>
</div>

# rbenv installation

Install rbenv into your home directory:

    $ git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

Set up the environment as per the (ubuntu specific) [rbenv installation instructions](https://github.com/sstephenson/rbenv#installation):

    $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile$ echo 'eval "$(rbenv init -)"' >> ~/.profile

Unless you've done anything before, there is no ~/.profile file before hand, so the contents will then be:

    $ cat ~/.profileexport PATH="$HOME/.rbenv/bin:$PATH"eval "$(rbenv init -)"

Restart the login shell:

    $ exec $SHELL -l

Check rbenv is now available:

    $ rbenvrbenv 0.4.0-45-g060f141Usage: rbenv <command> [<args>]...

Set up the [ruby-build](https://github.com/sstephenson/ruby-build#readme) plugin (as linked in the [rbenv readme](https://github.com/sstephenson/rbenv#readme))

    $ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

Install the necessary ssl library:

    $ sudo apt-get install libssl-dev

If you don't install the openssl development libraries you get this:

    BUILD FAILED...The Ruby openssl extension was not compiled. Missing the OpenSSL lib?

<div class="flickr-pic">
<a href="https://www.flickr.com/photos/tim_abell/8734303977"><img
src="https://live.staticflickr.com/7310/8734303977_566f96b159_k.jpg" alt="Looking out of a cave on the beach"></a>
</div>

# Ruby installation

Install the latest ruby (version name obtained from [release info on ruby blog](http://www.ruby-lang.org/en/news/2013/02/24/ruby-2-0-0-p0-is-released/)), takes 5-10 mins

    $ rbenv install 2.0.0-p0

Now select the installed ruby as the default for your user (ref: [https://github.com/sstephenson/rbenv#choosing-the-ruby-version](https://github.com/sstephenson/rbenv#choosing-the-ruby-version))

    $ rbenv global 2.0.0-p0 tim@atom:~$ ruby --versionruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-linux]

# Rails installation

Now as per the [Rails 4 RC1 announcement](http://weblog.rubyonrails.org/2013/5/1/Rails-4-0-release-candidate-1/) install the release candidate of Rails 4 (this was the latest at time of writing). Takes 5-10 mins.

    $ gem install rails --version 4.0.0.rc1 --no-ri --no-rdoc

Tell rbenv to create the new shims and see the installed rails:

    $ rbenv rehash$ rails --versionRails 4.0.0.rc1

* * *

All done! That wasn't so hard, it was all the blind alleys that took the time.

Now use [bundler](http://gembundler.com/) as recommended in the rbenv readme to set up an app etc.

Thanks for listening :-)

# Footnote

It pains me somewhat to have to use installations outside of the Ubuntu package manager, however it seems there are some grumblings about the packaged versions of the above software. Add into this that I wish to use the latest RoR on an LTS release of Ubuntu which seeing as the Rails community don't seem to provide debs / repos etc leaves a packaged version out of the question for now. I've learned previously the hard way the destructive effect of randomly installing everything you find outside the package management system of a distro so have tread carefully when creating the above information.


# See also

* [http://benkwok.wordpress.com/2013/08/15/install-rails-on-ubuntu-12-04-lts-with-rbenv/](http://benkwok.wordpress.com/2013/08/15/install-rails-on-ubuntu-12-04-lts-with-rbenv/)
* <https://github.com/asdf-vm/asdf> / <https://asdf-vm.com/> - a version manager for node/ruby/python/etc...
* <https://rvm.io/> - Ruby Version Manager
* Docker - properly isolate all your things - <https://en.wikipedia.org/wiki/Docker_%28software%29>
