---
layout: post
title: Getting rails 4 up and running with rbenv on Ubuntu 13.10
date: '2013-12-04T23:16:00.003Z'
author: Tim Abell
tags:
modified_time: '2013-12-05T10:09:30.811Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-6247915904489237488
blogger_orig_url: https://timwise.blogspot.com/2013/12/getting-rails-4-up-and-running-with.html
---

_Brain dump warning!_

This is a follow up to
[Installing ruby 2 + Rails 4 on Ubuntu 12.04 LTS](/2013/05/13/installing-ruby-2-rails-4-on-ubuntu/)
and is just a list of steps needed to get a clean install of Ubuntu up to speed
with an existing site.

*   Install rbenv to manage ruby versions
*   [https://github.com/sj26/rbenv-install](https://github.com/sj26/rbenv-install)
*   `git clone https://github.com/sstephenson/rbenv.git ~/.rbenv`
*   Install ruby-build to manage installation of ruby versions into rbenv
*   [https://github.com/sstephenson/ruby-build](https://github.com/sstephenson/ruby-build)
*   `git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build`
*   For convenience install dotmatrix - this will set up the rbenv environment correctly, amongst other things
*   clone [https://github.com/timabell/dotmatrix](https://github.com/timabell/dotmatrix)
*   run bin/install
*   restart any running terminal(s) to get rbenv
*   get a project (includes a .ruby-version file for rbenv, and a Gemfile for bundle)
*   `git clone git@github.com:timabell/symbol-library.git`
*   `sudo apt-get install libssl-dev libreadline-dev`
*   readline is needed for rails console, and has to be installed before ruby. If you've already installed ruby then just re-run rbenv install and it will overwrite the existing build with a version with readline support. ref: [http://vvv.tobiassjosten.net/ruby/readline-in-ruby-with-rbenv/](http://vvv.tobiassjosten.net/ruby/readline-in-ruby-with-rbenv/)
*   `rbenv install x.x.x-xxxx`
*   autocompletes, yay!
*   .. or better still reads from .ruby-version I think so you can just run `rbenv install` if you are in the project folder
*   `gem install bundler`  
*   from the right directory so done for right ruby version
    *   rbenv rehash
*   `bundle`  
*   will install all the gems for the project
*   ~~don't `sudo apt-get install rbenv`~~ ~ doesn't provide sufficiently up to date ruby
*   ~~don't `gem install rails --version 4.0.2 --no-ri --no-rdoc`~~ ~ don't need this when you have a gem file with rails in it, bundle will do it for you
*   `sudo apt-get install nodejs`  
*   for javascript runtime (rails server throwing an error without this)
*   `bundle exec rails server`
*   `bundle exec rails console`
*   needs readline (see above)

Other stuff I like in my install

*   dotmatrix bin/vimbundles
    *   includes vim-rails and friends
    *   full list [https://github.com/timabell/dotmatrix/blob/master/bin/vimbundles.sh#L45](https://github.com/timabell/dotmatrix/blob/master/bin/vimbundles.sh#L45)
*   console colours from bin/solarize.sh in dotmatrix/bin
*   tmux

This is mostly for my own reference but maybe it'll help someone else out.
