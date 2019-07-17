\--- layout: post title: Getting rails 4 up and running with rbenv on Ubuntu 13.10 date: '2013-12-04T23:16:00.003Z' author: Tim Abell tags: modified\_time: '2013-12-05T10:09:30.811Z' blogger\_id: tag:blogger.com,1999:blog-5082828566240519947.post-6247915904489237488 blogger\_orig\_url: https://timwise.blogspot.com/2013/12/getting-rails-4-up-and-running-with.html --- _Brain dump warning!_  
  
This is a follow up to [http://timwise.blogspot.co.uk/2013/05/installing-ruby-2-rails-4-on-ubuntu.html](http://timwise.blogspot.co.uk/2013/05/installing-ruby-2-rails-4-on-ubuntu.html) and is just a list of steps needed to get a clean install of Ubuntu up to speed with an existing site.  

*   Install rbenv to manage ruby versions

*   [https://github.com/sj26/rbenv-install](https://github.com/sj26/rbenv-install)
*   _git clone https://github.com/sstephenson/rbenv.git ~/.rbenv_

*   Install ruby-build to manage installation of ruby versions into rbenv

*   [https://github.com/sstephenson/ruby-build](https://github.com/sstephenson/ruby-build)
*   _git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build_

*   For convenience install dotmatrix - this will set up the rbenv environment correctly, amongst other things

*   clone [https://github.com/timabell/dotmatrix](https://github.com/timabell/dotmatrix)
*   run bin/install
*   restart any running terminal(s) to get rbenv

*   get a project (includes a .ruby-version file for rbenv, and a Gemfile for bundle)

*   _git clone git@github.com:timabell/symbol-library.git_

*   _sudo apt-get install libssl-dev libreadline-dev_

*   readline is needed for rails console, and has to be installed before ruby. If you've already installed ruby then just re-run rbenv install and it will overwrite the existing build with a version with readline support. ref: [http://vvv.tobiassjosten.net/ruby/readline-in-ruby-with-rbenv/](http://vvv.tobiassjosten.net/ruby/readline-in-ruby-with-rbenv/)

*   _rbenv install x.x.x-xxxx_

*   autocompletes, yay!
*   .. or better still reads from .ruby-version I think so you can just run \`rbenv install\` if you are in the project folder

*   _gem install bundler_  
    *   from the right directory so done for right ruby version
    *   rbenv rehash
*   _bundle_  
    *   will install all the gems for the project
*   don't sudo apt-get install rbenv ~ doesn't provide sufficiently up to date ruby
*   gem install rails --version 4.0.2 --no-ri --no-rdoc ~ don't need this when you have a gem file with rails in it, bundle will do it for you
*   _sudo apt-get install nodejs_  
    *   for javascript runtime (rails server throwing an error without this)
*   _bundle exec rails server_
*   _bundle exec rails console_

*   needs readline (see above)

Other stuff I like in my install  

*   dotmatrix bin/vimbundles  
    *   includes vim-rails and friends
    *   full list [https://github.com/timabell/dotmatrix/blob/master/bin/vimbundles.sh#L45](https://github.com/timabell/dotmatrix/blob/master/bin/vimbundles.sh#L45)
*   console colours from bin/solarize.sh in dotmatrix/bin
*   tmux

This is mostly for my own reference but maybe it'll help someone else out.