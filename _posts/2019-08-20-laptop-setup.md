---
title: Laptop setup notes
description: Clean install to functioning workhorse
layout: post
---

This is mostly for my benefit YMMV. Used for XPS13 and XPS15. Last run with Linux Mint Cinnamon 20.2 LTS.

Things to go from blank machine to fully functioning work laptop.

## OS install

* [Download mint cinnamon x64 torrent](https://linuxmint.com/download.php)
* Burn to USB stick
* [Configure Dell XPS 13 to use AHCI mode](https://askubuntu.com/questions/696413/ubuntu-installer-cant-find-any-disk-on-dell-xps-13-9350/696414#696414)
* Boot to stick with `F12`
* Install mint
	* Full disk encryption (LUKS), default whole disk partitioning
* Run updates and reboot `sudo apt update && sudo apt upgrade`

## Hibernate / hybrid sleep (unfinished)

Not working at moment, needs more research.

* Enable hibernate?
	* Bigger swap?

### Half-arsed research into hibernate

* <https://superuser.com/questions/1539378/what-size-swap-partition-will-allow-a-mint-19-3-installation-with-64g-ram-to-hib?noredirect=1&lq=1>
* <https://superuser.com/questions/1434301/enabling-hibernate-on-linux-mint-19-1?noredirect=1&lq=1>
* <https://help.ubuntu.com/community/SwapFaq>
* <https://unix.stackexchange.com/questions/568093/enable-hibernation-in-power-management>
* <https://dewaka.com/blog/2021/04/08/linux-mint-hibernate/>
* <https://www.fosslinux.com/45454/enable-hibernate-mode-linux-mint.htm>
* <https://askubuntu.com/questions/12383/how-to-go-automatically-from-suspend-into-hibernate>
* <https://www.reddit.com/r/linuxmint/comments/93ta9u/enable_hibernation_in_linux_mint_19_tara/>

## Packaged software install

* Bootstrap my dotmatrix package list [my bootstrap file](https://github.com/timabell/dotmatrix/blob/master/software/bootstrap.sh) like this (don't laugh/cringe):

```
curl https://raw.githubusercontent.com/timabell/dotmatrix/master/software/bootstrap.sh | sh
```

This installs my [usual package list](https://github.com/timabell/dotmatrix/blob/master/bin/packages.txt)

## Hardware

* Disable nvidia GPU in favour of intel card

```
sudo prime-select intel
```

## zsh

* Switch to z-shell `chsh -s /usr/bin/zsh`

Ref: <https://askubuntu.com/questions/131823/how-to-make-zsh-the-default-shell/131838#131838>

## inotify

* inotify increase for:
  * RubyMine
  * Guard - <https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers>
  * Syncthing - <https://docs.syncthing.net/users/faq.html#inotify-limits>

```
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

## File sync with syncthing

* Run syncthing-gtk from system menu (auto-installs syncthing binary)
	* [Configure syncthing](http://localhost:8080/) not to route over internet
		(no relay, no public discovery, no NAT traversal)
* [Configure firewall-config](https://firewalld.org/documentation/utilities/firewall-config.html)
	to allow syncthing
	* Add manual service syncthing
	* Allow tcp 22000 and 21027 udp
	* Make home network use home zone
	* Add syncthing to home zone
	* Runtime to permanent

![firewall config screenshot](/assets/firewall-config-syncthing.png)

* Remove old install machine name from syncthing network
* Tell new and old devices about each other in syncthing
* watch `~/Documents` etc. magically sync (amazing)

## All the things from dotmatrix

```
cd repo/dotmatrix/
bin/symlinks.sh
bin/install
software/delta.sh
# etc
```

## Desktop/system config

* Setup touchpad
	* Set mouse and trackpad speed/acceleration to max
	* Enable horizontal touchpad scroll

![Screenshot of mint touchpad settings with customisations](/assets/mouse-and-touchpad.png)

* Setup terminal colours and turn off transparency

![Screenshot mint terminal colours set to solarized](/assets/terminal-colours.png)

* Turn off all the system sounds and turn the volume down to 0%.
* Customize time in task bar to `| %H:%M:%S %p | %e %b %Y |`.
* Lock screen with `Win+L` - start > keyboard > system > lock screen (Windows user habits).
* Turn on automatic updates in update manager preferences, and automatic obsolete kernal removal.
* Configure nemo file manager to always use list view.
* Add workspace switcher applet to taskbar.

## Firefox

* Sign-in to sync

* Remove firefox tabs (because I use [Tree Style Tabs](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/))
  * `cd ~/.mozilla/firefox/<profile_id_folder>/`
  * `mkdir chrome`
  * `echo '#TabsToolbar { visibility: collapse !important; }' >> chrome/userChrome.css`
  * about:config > `toolkit.legacyUserProfileCustomizations.stylesheets` > `true`
  * restart firefox

Reference: <https://superuser.com/questions/1268732/how-to-hide-tab-bar-tabstrip-in-firefox-57-quantum#1268734>

## Non-apt program installations

* Use Applets config to download and add [Pomodoro timer](https://cinnamon-spices.linuxmint.com/applets/view/131) in task bar.
* Install [jetbrains toolbox](https://www.jetbrains.com/toolbox/app/)
* Software manager:
	* [Slack with flatpak](https://flathub.org/apps/details/com.slack.Slack)
		* sign in
		* (Slack promote the snap version but that's not installed by default)
	* Telegram desktop (flatpak) - connect phone
	* Signal (flatpak) - connect phone
	* Zoom (flatpak) - sign in

## SSH

* Generate ssh key `ssh-keygen`
* [Add public key to github](https://github.com/settings/keys)

## Postgres

[Use a docker image](https://hackernoon.com/dont-install-postgres-docker-pull-postgres-bee20e200198)

## XPS firmware updates

```
fwupdmgr get-devices
fwupdmgr get-updates
fwupdmgr update
```

refs:

* <https://fwupd.org/lvfs/docs/users>

## Shutter

* Change default save location to `~/Documents/screenshots/shutter`

## Thunderbird

* Restore recent backup (from data sync)

## asdf

* [install asdf version manager](https://asdf-vm.com/#/core-manage-asdf-vm?id=install-asdf-vm) for all the things (ruby, node, golang etc.)

## NodeJs setup

	asdf plugin-add nodejs
	bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
	asdf install nodejs 8.16.1
	node -v

Keyring because nodejs packages are signed and validated
<https://github.com/asdf-vm/asdf-nodejs#install>

## Ruby

	asdf plugin add ruby
	cd some-project
	asdf install
	gem install bundler

## See also

* <https://github.com/thoughtbot/laptop>
