---
title: Phone setup notes
layout: post
---

This is epic, so here's a table of contents:

* This list will be replaced by table of contents. https://kramdown.gettalong.org/converter/html.html#toc
{:toc}

---

## About

Well this makes a good counterpart to the [laptop setup post](/2019/08/20/laptop-setup/). Similar idea, it's just a place for me to keep track of all the things involved in building a new phone from scratch. This one also explains to people who look at me like I'm mad why I don't just "do what everyone else does".

## Why don't you just...?

Most people don't think their phone install deserves a blog post, or even a lot of thought beyond a visit to the Apple "genius" bar (lol) so they can push the "copy everything to my new phone button". I'm not most people. I've been running Linux since approximately [Ubuntu 5.04 Hoary Hedgehog](https://en.wikipedia.org/wiki/Ubuntu_version_history#Ubuntu_5.04_(Hoary_Hedgehog)) in 2005 (the brown one). Even while being a ".NET developer", back when [Microsoft were still trying to simultaneously ignore and destroy Linux](https://en.wikipedia.org/wiki/Halloween_documents). What strange times we live in now with dotnet being open source and cross-platform, has the leopard changed its spots?

There are many factors in this battle for the phone in your pocket.

* The GPL's fundamental truth is that there is a tension for control over your devices between the creators of software and the users of that software. iOS and Android both believe that the users can't be trusted with full control over their device because "security". I believe this balance of power is important. Too far in either direction and things start to go badly:
	* All the power in the hands of vendors at the expense of users results in exploitation, unfair pricing, anti-competitive practices, monopolies, duopolies (google+apple), cartels, and lack of innovation and quality due to lack of competition.
	* On the flip side all the power in the hands of "users" (or at least user-developers) as per the pure GPL and it becomes difficult or impossible for capitalist processes to fund innovation and engineering effort due to the inability to capture generated value.
* The apps matter, I do actually want to use a phone for useful things, and increasingly web applications are a poor cousin to their equivalent apps. (Facebook, horror that it is, oscillates between making a browser unusable and making it just about possible to read and interact, they *really* want all that juicy extra data that you can get from being an installed app).

> iOS and Android both believe that users can't be trusted with full control over their device

This time in smartphones is a moment like my first linux install around the year 2006. I hated the main operating system (Windows) that I was locked in to. All the app[lication]s that I relied on (outlook, visual studio etc) were locked to the operating system I hated. And now in 2021 all the proprietary apps on phones are locked to android / iOS (gmail, authenticator, waze, google maps, banking apps, whatsapp etc.)

I could just install OpenGApps or similar to get the google play store on top of a slightly more free android variant; then install all the proprietary apps again, or I could see just how much I can do without google services by using microG and open source alternative apps like k9mail and maps.me. I've already started this journey by trying out many free alternatives and think it's worth pushing ahead. Running a build with no google services will be a good acid-test of how far I've got even if I have to go running back to the proprietary google services.

In my switch to Linux from Windows I just tried to do as much as I could with free software such as the gimp and thunderbird, often still installed on Windows, and then bit by bit I needed to fire up Windows less and less often as I found alternative apps and ways of doing things.

Any progress I can make here will make the jump to a fully free phone OS less painful in the future, and I'm increasingly confident that day will come just like I don't think twice about running Linux Mint even for work these days.

### Nursing Homes and Neighbourhoods

I highly recommend reading this article - [Purism, The Future of Computers: The Neighborhood and The Nursing Home](https://puri.sm/posts/the-future-of-computers-the-neighborhood-and-the-nursing-home/). It wonderfully illustrates the binary choice between the apple/google duopoly and the DIY open source and privacy movement with the rather apt analogy of nursing homes (apple etc where your needs are met but you give up control of your environment) and neighbourhoods (open source where it's up to you not let the wrong people in to renovate your house).

### Why not just Apple iOS?

Yes I know the iPhone crowd can just push a button on the new phone and have it look like the old phone, but iOS is the polar opposite of what I want my technology to be: under *my* control. That means root. That means open source. That means GPL.

iOS certainly does have some unique advantages that I will be sad to miss out on but not sad enough to give up all the other things I care about.

#### iOS, the good

* A secure boot chain, remarkably hacker-proof - even with physical device access which is very impressive.
* Impressively effective device-to-device migration of user settings and data (android failed miserably at this in my experiments)

#### iOS, the dubious-to-bad

* Complete reliance on a single vendor for looking after all your precious "data". This in my view is risky no matter how good the vendor is.
	*	In 2012 this was demonstrated as [Mat Honan had *all* his data and devices wiped and locked remotely when a hacker took over his Apple account](https://www.wired.com/2012/08/apple-amazon-mat-honan-hacking/), and he had no other copy of all his precious family photos. A cautionary tale for all of us.
	* Someone I know lost everything on their iPhone when the OS upgrade process somehow managed to do the following:
		1. backup the phone to the iCloud
		2. wipe the phone and install the updated iOS (I understand this is normal procedure)
		3. back up the blank phone to iCloud *overwriting* the only backup (apparently there was only a single slot)
		4. restore the blank backup to the updated phone
		5. declare success, leaving my friend with all his data gone and a factory-installed OS
* No root (a problem for syncthing, independent backups and general user-control)
* No user-replaceable OS (aka ROM)
* No open source
* All the apps cost more!

### Why not just stock android?

"So you must be an android dude then" you say. Well no because frankly android isn't much better these days. Ever heard of [AOSP? (The Android Open Source Project)](https://source.android.com/) Well that's an ever-shrinking piece of what people call Android these days. Piece by piece [google have been replacing open-source android with proprietary rewrites](https://arstechnica.com/gadgets/2018/07/googles-iron-grip-on-android-controlling-open-source-by-any-means-necessary/). Combine that with proprietary drivers for the endless churn in hardware. If you can even install ASOP on a device good luck getting much to work. The idea of android being "the open source one" in the true spirit of the GPL is a distant and fading memory.

There is a cartel of industry players called the [Open Handset Alliance](https://en.wikipedia.org/wiki/Open_Handset_Alliance) <http://www.openhandsetalliance.com/index.html>. These industry groups can be good but I think in this case they are a barrier to innovation and openness.

> "OHA members are contractually forbidden from producing devices that are based on competing forks of Android"  
> ~ [Wikipedia on OHA](https://en.wikipedia.org/wiki/Open_Handset_Alliance)

[Ars Technica: "Google’s iron grip on Android: Controlling open source by any means necessary"](https://arstechnica.com/gadgets/2018/07/googles-iron-grip-on-android-controlling-open-source-by-any-means-necessary/)

#### Root and backups

One of the big drivers I've had for getting a non-standard phone setup is that I don't want to rely on on google to backup everything on my phone in case it dies, but because Android is by default locked in by secure boot and doesn't give the user any root access or ability to get root access that's a bit of a problem for the normal method of backing up a device.

A laptop backup is a question of backing up `/home` plus a [dotmatrix/bootstrap](https://github.com/timabell/dotmatrix) setup for regaining interesting configuration etc.

Android is a bit more complex because it has a couple of storage areas:

* an [emulated] 'sdcard' this is kinda like `/home` on a laptop and has things like downloaded files; some of the apps use this to save things to
* storage for every individual app (I learned about the existence of this by losing all my app data)

Every app on android runs under a separate userId, which allows Android to ensure that apps can't read each other's data. This is a good thing for security, but that means if you install a "backup app" it can't read any of the data you actually want backed up. And it can't get root because that's not available to you as a user or to any non-system apps.

So that means to backup independently of google, you need root, and to get root you need to unlock the whole boot chain.

I did have root on my OnePlus 5t, but an operating system update helpfully removed that for me... breaking my backups... and root access couldn't be restored without wiping the phone... including the data I didn't have backed up because it had broken my backups. Gah. Off the back of that experience I want to make sure that I'm not set up to fight some bloody vendor that doesn't believe I should have root.

Any hope of an effective root is dwindling. According to <https://www.androidpolice.com/a-new-method-for-hiding-root-in-magisk-may-soon-emerge/> the developer of Magisk Hide that prevented root being detected and thus allowed shitty apps to continue to be run has been *hired by google*. That's google following the advice of "keep friends close, keep your enemies closer" close if ever I've seen it. No better way to shut the project down than to pay off the developer with a "salary". Cough.

### Something other than iOS or Android and its derivatives?

It's all about the apps.

> An operating system is not that useful on its own.

There's a reason [Ballmer shouted "developers developers developers"](https://www.youtube.com/watch?v=KMU0tzLwhbE) (amusing as this meme has become in the abstract). An operating system is not that useful on its own. Operating systems live and die by the applications (aka apps) available on them, and the utility and value they in turn bring to their users.

iOS and Android have utterly captured the app market on phones, creating a duopoly in the phone space.

Even the mighty Nokia (with [Symbian](https://en.wikipedia.org/wiki/Symbian)), [Research In Motion (RIM) with Blackberry](https://en.wikipedia.org/wiki/BlackBerry_10)`*` and Microsoft with [Windows Phone](https://en.wikipedia.org/wiki/Windows_Phone) failed to win against them and eventually threw in the towel.

`*` Blackberry seems to have all but fallen off the radar, they started shipping android in the end basically being a android phone with a physical keyboard thus becoming part of the apple-google duopoloy..

So for me that rules out for the time being all the Linux based phones such as a [Librem 5 running PureOS](https://shop.puri.sm/shop/librem-5/). (See below).

> It's only when alternatives like Librem/PureOS gain traction that we'll see the makers of apps, websites and phones have to create and adopt open standards that allow further diversity and innovation.

The fact the Librem exists and seems to be sustainable are encouraging signs for the breaking of the google+apple duopoly on mobiles. It's only when alternatives like Librem/PureOS gain traction that we'll see the makers of apps, websites and phones have to create and adopt open standards that allow further diversity and innovation. Currently we are seeing a repeat of the "works best in Netscape / Internet Explorer" duopoly of the browser wars that was eventually broken forever by Firefox, Opera and friends forcing websites to stop using proprietary extensions and stick to open standards.

#### Dearly departed

##### Nokia / Symbian

Symbian was briefly ahead on features as an OS in my opinion. I had a Sony Ericsson [P800](https://en.wikipedia.org/wiki/Sony_Ericsson_P800) and [P910](https://en.wikipedia.org/wiki/Sony_Ericsson_P910) and in their day they were *almost* amazing phones, hampered by lacking hardware (2g at the dawn of 3g, serial port connectivity emulated over usb, and for god knows what reason Sony were still trying to beat SD cards with [memory stick](https://en.wikipedia.org/wiki/Memory_Stick)). Consumers flocked away from them in droves to the new iPhone.

##### Microsoft / Windows Phone OS

Microsoft's ["Windows Phone" was a triumph of a phone operating system](https://www.theverge.com/2017/10/10/16452162/windows-phone-history-glorious-failure), and everyone I knew that had one absolutely loved the operating system. But [Microsoft just couldn't persuade the big-name mobile-app developers](https://www.theverge.com/2015/10/23/9602350/microsoft-windows-phone-app-removal-windows-store) (i.e. companies) to invest the endless effort required to create and maintain a third version of their apps for another app store.

##### OpenMoko / Neo FreeRunner

I had high hopes for the truly open Neo running OpenMoko, but it didn't stand a hope in hell amongst the rapidly evolving tech and software at the time. I bought the [Neo FreeRunner](https://en.wikipedia.org/wiki/Openmoko#Neo_FreeRunner) and it was an exciting time, but it quickly became a relic.

##### CyanogenMod

After many years of being the goto android-variant mobile OS for non-conformists, sadly [CyanogenMod](https://en.wikipedia.org/wiki/CyanogenMod) imploded in 2016. The code lives on in LineageOS (see below).

#### Promising futures

Two currently active non-android physical phone projects, and several more ongoing Linux based (i.e. non-android) mobile-friendly operating system efforts. Although these will never cross the radar of most people just like Linux didn't for many years) these are important foundational projects.

##### Purism's Librem 5 phone hardware running PureOS (Linux)

* [Librem 5 phone](https://shop.puri.sm/shop/librem-5/)
* [PureOS](https://pureos.net/)

The [Librem 5](https://shop.puri.sm/shop/librem-5/) is worth a look if you want to take it to the next level of openness, however it comes with a compromise in specifications, a hefty price tag (inevitable due to lower production volumes) and no android / iOS apps.

You might however want to consider spending your dollars as a vote for the future you want to see.

The [Librem 5 runs Linux (PureOS), not Android](https://puri.sm/products/librem-5/pureos-mobile/). This is great but as of 2021 does mean it suffers from the "app" problem (see above).

Because of the "app" problem I'm not ready to make the jump to a Linux based smartphone that can't run android apps. I'm also not particularly keen to drop quite this much in specification for the benefit.

Personally I'm happy with the OnePlus compromise of specification plus apps versus openness for now, but I'm very glad to see Purism pushing the frontier of openness and maybe I'll join their users one day.

##### PinePhone Pro phone hardware (Linux, for now)

The [PinePhone Pro](https://www.pine64.org/pinephonepro/) is a low spec but very open Linux phone. A follow up to the original PinePhone.

"pre-orders from developers on October 15, 2021, and expect to have them delivered by December"

Phones like this are important in building momentum in the capability of non iOS/Android software even though they will never be mainstream phones themselves.

This is a Linux phone, though in theory [GloDroid](https://glodroid.github.io/) will provide a build of Android (AOSP) for it, but don't hold your breath. - [OmgUbuntu article on PinePhone+GloDroid](https://www.omgubuntu.co.uk/2020/07/glodroid-android-for-pinephone-allwinner).

##### UBPorts Ubuntu Phone (Linux)

Canonical killed the Ubuntu Phone and the [Ubuntu Touch](https://en.wikipedia.org/wiki/Ubuntu_Touch) operating system, but the software lives on in [ubports](https://ubports.com/). (Presumably that's short for UBuntu Ports)

##### Plasma (Linux KDE for phones)

[Plasma Mobile](https://plasma-mobile.org/) is a variant of the KDE Plamsa desktop specifically for mobiles.

Learn more about [Plasma on Wikipedia](https://en.wikipedia.org/wiki/Plasma_Mobile)

##### Mobian - (Debian Linux for phones)

[Mobian](https://mobian-project.org/) is encouraging to see. Debian Linux's strenth has always been its governance and stability. Debian has been a rock in the stormy seas of open source even as different people have passed through its team. This is because debian has a strong set of organisational rules that are above and beyond any individual contributor. The fact that they are working on a mobile variant is very encouraging.

##### PostmarketOS (Linux)

[PostmarketOS](https://postmarketos.org/) is an Alpine Linux (i.e. very small) variation designed to breath life into otherwise obsolete hardware. I expect this will become more useful as phone hardware stops becoming utterly obsolete due to major changes in basic expectations and environment. 

## Secure boot

There's the secure boot chain and device locking. This can be a good thing or a bad thing depending on the power dynamic between users and providers (and maybe even the state/government).

It is true that your device is less "secure" with the bootloader unlocked (as the phone likes to scream at you every time you boot it up), at least to attackers with physical access to your device, however I think that's worth the trade for full control of your device (that you paid for and "own").

[Security is not an absolute](https://www.isaca.org/resources/isaca-journal/issues/2021/volume-6/evidence-based-prioritization-of-cybersecurity-threats). You have to consider cost, inconvenience, human behaviour, the value of an attack target, the motivations of different actors (state, organised crime, hackers, opportunist thieves, trolling friends etc). For me an encrypted data partition and a passcode will do for physical security. In theory you can get full secure boot chain for custom operating systems but even on a Linux laptop this is non-trivial currently.

There's an important difference here between google/apple considering the security of their entire device eco-system in the hands of every kind of user, and the security of an individual's device customised to suit them. If google turn off secure boot for everyone then it makes it that much more likely that someone will successfully develop and spread an android virus that corrupts the boot chain. If I turn it of it's a rounding error on the probability, and a marginal difference to the "security" of my own device.

### Apple's secure boot chain

Apple don't want you to fiddle with the OS they control, so you don't get to touch it without "jailbreaking" it. Jailbreaking is done by exploiting a security flaw, and it's a cat and mouse game with Apple fixing bugs to close holes and hackers finding new ones to regain control of the devices. Not a game I want to play just to have control over my own hardware. This 100% rules out iOS for me, it's a complete dealbreaker. No matter how shiny, how bug free, how capable it is I wouldn't trade unless there was absolutely no alternative.

### Android's secure boot chain

Android also secure their boot chain by default, however whether you can unlock it and flash a different recovery/bootloader/OS/ROM depends on the phone manufacturer, individual device, and sometimes the phone network provider (aka locking/unlocking).

This means choose your device and provider carefully if you wish to unlock without wasting your time trying to jailbreaking a locked device.

### Artificial app limitations when unlocked

Android has a system that allows apps to hide or limit functionality called [SafetyNet](https://www.lineageos.org/Safetynet/). For apps like NetFlix that won't even show in the play store for unlocked phones we're into the mega-discussion that is [DRM](https://en.wikipedia.org/wiki/Digital_rights_management). In short if a content creator wants to lock their device to a locked-down platform that's fine be me but I won't be using those platforms for my main computing, instead I might have them as throw-away additional appliances like the google chromecast, or samsung TV's built in junk. What really matters here is what alternatives you have available to you. For google pay, I'm very slightly sad to miss out but my contactless debit card still works fine so I'll live.

## Hardware choices

Given the "app" problem, any devices not capable of running Android or a derivative are currently out of the running (sad times).

A non-negotiable for me is manufacturer support for replacing the bootloader and everything above that (OS, apps). This ensures the life of the device beyond the point at which the manufacturer loses interest or does something horrific/stupid. This is also a signal for who is truly in charge of the device once it's "yours" - you the user or the supplier and their developers. By locking you out of making modifications it's a clear signal that you are not to be trusted with the power over your own device.

As the useful innovation in hardware slows down (2G to 3G was a big jump, but 8-megapixels camera to 32-megapixel cameras is less foundational) it will be less often that devices will become obsolete through huge leaps in capability. It will also mean that phone hardware will inevitably become more commodity and less proprietary, giving a chance for more open standards to get a foothold (just as x86 replace proprietary CPU architectures many decades ago), while still being acceptably capable. We shouldn't be throwing out devices because the manufacturer decided not to provide security patches for their OS variant, and certainly not because the manufacturer took away a feature we like through forced updates.

### Google Nexus / Pixel (meh)

I have run a [google nexus](https://en.wikipedia.org/wiki/Google_phone) 4 previously which was flashable and rootable, but long since obsolete in hardware capabilities (and suffered a hardware failure). I never looked back at the google line after I discovered OnePlus, I can't comment on whether the current pixel phones are a good device for my constraints. I don't particularly want to further feed the beast. If you want the authentic pure google experience I guess these are probably worth a look but the pure google experience seems less and less appealing as the years roll on.

### Sony (yuck)

Someone told me that a particular Sony phone was flashable, I researched it, found instructions on flashing it, ordered one... and couldn't flash it. Discussing with Sony support it transpired that that precise model was sometimes flashable and sometimes not, and the only way to find out was to order one and look at the serial number. Fuck you Sony. They never have understood the open source movement and look like they still don't. They always treated their kit like appliances not a blend of hardware and software (or firmware) with everything that means for the long term management of the software. It's a shame because they do make nice hardware. I'd still buy a dumb Sony audio amplifier but not much else of theirs. Returned and refunded, try again...

### OnePlus (yay, no wait, boo)

This is my choice for the new [OnePlus 9 Pro](https://www.oneplus.com/uk/9-pro) I'm trying to set up, and the [OnePlus 5T](https://www.oneplus.com/uk/support/spec/oneplus-5t) I've been using for more than a couple of years now.

They don't make the grade for the pure "everything must be open including chip bytecode and chip architecture" as they use proprietary chips, but they make the right balance for me of reasonably high spec hardware for a reasonable price, android compatibility, and the ability to flash whatever ROM/OS you like (at your own risk).

I've been running a OnePlus 5t for a while now (bought outright, no network lockin or contract nonsense) and generally happy enough with it. There are some bugs and storage is starting to constrain hence the upgrade, plus the camera could be better by modern standards and I don't fancy carrying a separate camera.

I now have had the OnePlus 9 Pro sat in a drawer for two months waiting for me to figure out what-the-[FSM](https://en.wikipedia.org/wiki/Flying_Spaghetti_Monster) to run on it, hence this blog post. It's already been unlocked and I've tried flashing a couple of things but am not happy with the setup yet. I stopped looking at it while I concentrated all my efforts on making sure my business was going in the right direction (or any direction at all).

> To get root you have to wipe the phone

The OnePlus comes with OxygenOS (an android derivative) preinstalled, but not rooted and with a locked bootloader. To get root you have to wipe the phone which means it's important to do it before you start using it. It's caused me no end of pain that you can't use [titanium backup](https://www.titaniumtrack.com/titanium-backup.html) to backup all your data without root, and you can't get root without losing your files. I understand why (so you can't just unlock a phone to steal all the data) but that doesn't make it less of a pain in the arse. Bonus points for operating system updates (over the air / OTA or just normal updates) de-root the phone.

[XDA Developers detailed page on the OnePlus 9 including pro](https://www.xda-developers.com/oneplus-9/)

---

But wait, there's trouble in paradise.

The founder [Carl Pei left OnePlus in 2020](https://techcrunch.com/2020/10/16/oneplus-co-founder-carl-pei-confirms-he-has-left-the-company/) after 7 years at the company.

[OnePlus was funded by an existing phone company called Oppo](https://www.androidauthority.com/oneplus-oppo-design-894687/). (And [both OnePlus and Oppo are part of BBK](https://www.androidauthority.com/oneplus-oppo-1177898/))

It seems that [OnePlus is basically now dead in the water](https://www.androidauthority.com/oneplus-oppo-complete-opinion-3025477/) as a brand if not a company in its own right and will be sucked back into whatever the mothership has to offer, breaking everything along the way by trying to merge Oppo's colorOS with OnePlus's OxygenOS into an unholy mess.

Fuck.

---

As if that wasn't enough:

> "OnePlus is adding artificial limitations and breaking features via software updates, and there are no indications that they'll improve." ~ GCam Hub, <https://www.celsoazevedo.com/files/android/google-camera/f/post-05/>

---

It turns out that the founder of OnePlus, Carl Pei, has set up a new company called "[Nothing](https://nothing.tech/)" (enjoy googling that one), which did just make headphones (unexciting), but who have just announced a phone. So maybe this is the true successor to the likely dead OnePlus brand. <https://www.theverge.com/2022/3/23/22992424/nothing-phone-1-smartphone-carl-pei-apple-ecosystem>

## So what OS options does that leave?

So not iOS and preferably not Android either.

Unfortunately the apps mean that I'm stuck with Android and its derivatives for the time being.

It seems the best hope for salvation is the Linux based options discussed above eventually getting sufficient app coverage to make the jump more bearable, or maybe even some kind of android emulation allowing them to run android apps sufficiently well. The path from Windows to Linux for me included a mix of dual-boot, virtualization and wine (an api compatibility layer, not an emulator)

It's worth mentioning that some (most/all?) phone manufacturers make proprietary customizations to Android or even complete [forks](https://en.wikipedia.org/wiki/Fork_(software_development)) that you may or may not want. Samsung for example (for the Galaxy line of phones) replaces the "launcher" with the ["Samsung Experience"](https://en.wikipedia.org/wiki/Samsung_Experience). I'm going for more open rather than less, so I'm not interested in trading slickness for losing even more control. I just want a platform that runs the apps I care about and is as open as possible.

### Researching the options

I don't follow this stuff all the time so I had to do some googling ([duckduckgo](https://duckduckgo.com/)-ing). Here's some useful comparisons I turned up:

* [It's FOSS, Open Source Mobile OS Alternatives To Android](https://itsfoss.com/open-source-alternatives-android/) - mostly pure Linux things that don't have the android app ecosystem
* [PC Magazine, Break Away From Android: 7 Free Open-Source Mobile OSes to Try](https://uk.pcmag.com/linux/131295/break-away-from-android-7-free-open-source-mobile-oses-to-try)
* [GetDroidTips has some more ROMs I haven't looked at](https://www.getdroidtips.com/best-custom-rom-oneplus-9-pro/)

I've got more to learn/research here so I'll expand this section as and when I learn more. Think of this as a [bliki](https://www.webopedia.com/definitions/bliki/). There's a full history in git (link at end).

### Towering stacks of patches

The below are probably the most realistic alternatives to stock Android and iOS for those who want more openness but don't want to give up all the modern conveniences in the name of openness and/or privacy. They are however all customizations of Android and that brings a very real problem.

The core open "Android Open Source Project (AOSP)" is run by google for google's benefit and for their own Android ecosystem. There is significant engineering effort continually poured in to this, with major releases made on remarkably short timelines.

Any project that makes a customization to AOSP such as LineageOS and keeps track of it in their own fork is constantly at the mercy of changes to the foundation it has been based on, a foundation which really has no reason to care about them.

This creates a never ending challenge that stunts innovation outside the Android/iOS duopoly. If you build a significant customization, it will sooner or later be broken and need re-engineering because of changes in AOSP, or maybe even be impossible to resurrect. The more you innovate and customize, the more engineering fire-power is required just to stand still on the treadmill of change in the platform.

While we have good tools for managing all this complexity (git, gerrit) this is a fundamental and unavoidable problem with building on a platform that doesn't care about you.

Contrast that with the Linux ecosystem where the platforms people are building on (consisting of many many layers and teams) are much more interested in supporting downstream projects and allowing choice. Projects that run on Linux can often run with minimal modification for decades. Linux is also not built for the benefit of some particular vendor like google with their own agenda, it is instead run by a foundation with far more broad interests and pressures.

### Android derivative options

I now need to look into the below and decide what to run (maybe with some trial flashing). Once that's done it'll be on to the slog of setting up the actual device how I want it.

#### OxygenOS from OnePlus - used to be good, now dying a painful death

See the section on OnePlus hardware above. The company and OS are in trouble now the founder has left and the operating system has been merged with Oppo's colorOS (read "fucked")

* <https://www.oneplus.com/uk/oxygenos>

This is the default for the OnePlus device I have, which means it's the most likely to make the hardware perform at its best.

After a [wobble on data reporting](https://www.theverge.com/circuitbreaker/2017/10/11/16457954/oneplus-phones-collecting-sensitive-data) (which I'm not too bothered about) they seem to have largely sorted out their privacy game... apart from being full of google services just like the rest of the mainstream android devices. To play or not to play...

Here's [the original article disclosing OnePlus silently sending data home](https://www.chrisdcmoore.co.uk/post/oneplus-analytics/).

It seems the latest news is that Oxygen is falling apart. [XDA Developers: "OxygenOS 12 for the OnePlus 9 series is littered with bugs"](https://www.xda-developers.com/oneplus-9-oxygenos-12-stable-update-bugs/)

> "It was shit after merge with #Oppo and getting worst day by day. I really like #OnePlus device but #OxygenOS is dead now." ~ [@rahulawanjari, 9 Dec 2021, twitter](https://twitter.com/rahulawanjari/status/1468885793691168771?s=20)

Crap, there goes another good option. As if the mobile phone space wasn't horrific enough already.

In fact OxygenOS 12 was so bad, that they've just [OnePlus pulled the plug on the entire OxygenOS 12 upgrade!!](https://www.androidpolice.com/oneplus-is-pulling-its-oxygenos-12-update-for-the-op-9-and-9-pro/)

Bonus points for the anti-competitive practice of [actively denying access to hardware features (secondary cameras)](https://www.gizmochina.com/2021/12/13/oxygenos-12-blocks-access-to-auxiliary-cameras-on-third-party-camera-apps/). I hope the courts slap them down for this clearly anti-competitive behaviour.

---

So after discovering that shit-show-in-paradise from OnePlus I could potentially skip OxygenOS 12 and stick to the less f*cked OxygenOS 11, but that doesn't seem like much of a plan so it looks like I'll be skipping any fancy hardware capability and looking for a more open and less broken Android variant. Yet more proof that corporations can't be trusted as guardians of our software for the long term without GPL or at least MIT to stop them from hurting their users sooner or later. Did I mention my podcast is called "Software Should Be Free". Does this horror show give you a hint as to why it's called that?

#### LineageOS (yep)

[LineageOS](https://lineageos.org/) is the successor to the now defunct CyanogenMod. [See the history of LineageOS and it's relationship to CyanogenMod here on Wikipedia](https://en.wikipedia.org/wiki/LineageOS).

CyanogenMod was a bastian of freedom and innovation. I hope Lineage has managed to continue that.

There does appear to be [a build of LineageOS for the OnePlus 9 pro](https://download.lineageos.org/lemonadep) - I think this is worth trying out.

LineageOS has it's own recovery image, so no need to run TWRP as well.

[Review of LineageOS on XDA Developers](https://www.xda-developers.com/lineageos-18-1-review/)

#### Lineage for microG (maybe?)

* <https://lineage.microg.org/>
* <https://github.com/lineageos4microg>

This is a fork of lineage with microG already set up properly and a patch that lineage wouldn't allow that let's them spoof google signatures in order to trick apps into believing they are using the real google play services

> Q: "Why do we need a custom build of LineageOS to have microG? Can't I install microG on the official LineageOS?"  
>  
> A: "MicroG requires a patch called "signature spoofing", which allows the microG's apps to spoof themselves as Google Apps. LineageOS' developers refused (multiple times) to include the patch, forcing us to fork their project."  
> ~ [Lineage for microG faq](https://lineage.microg.org/#faq)

#### Replicant (not yet)

"[Replicant](https://replicant.us/) is a fully free Android distribution running on several devices"
I'm glad this freedom is here but I'm not quite ready to give up every last proprietary thing until there's a bit less of a gap.

[Supported devices](https://redmine.replicant.us/projects/replicant/wiki#Supported-devices) shows purely Samsung Galaxy devices currently.

#### /e/ (aka Eelo)

<https://e.foundation/>

> "We build desirable, open source, privacy-enabled smartphone operating systems."

This Android derivative is focussed on privacy; eliminating as much data collection (i.e. all things google) as possible. Laudable but not my main focus right now.

You can buy their reconditioned phones with their OS pre-installed or just install the OS on something else.

They provide their own alternative cloud hosting for contacts etc for reasonable prices.

Their dev build has a root option it seems which might be useful. - <https://doc.e.foundation/support-topics/root-e-os.html>

* [/e/ on wikipedia](https://en.wikipedia.org/wiki//e/_(operating_system))
* [itsfoss.com/eelo-mobile-os](https://itsfoss.com/eelo-mobile-os/)
* <https://www.pcmag.com/news/google-free-android-smartphones-are-now-available-in-the-us>

#### GrapheneOS (nope)

> "[GrapheneOS](https://grapheneos.org/) - The private and secure mobile operating system with Android app compatibility. Developed as a non-profit open source project."

[GrapheneOS only officially supports Pixel phones](https://grapheneos.org/faq#supported-devices)

#### CalyxOS (nope)

> [CalyxOX](https://calyxos.org/) - "Your Phone Should Be Private Everyone needs a phone. Not everyone wants to be spied on. Reclaim your privacy with CalyxOS."

Supports Pixel devices and one Xiaomi phone (never heard of it).

Seems to be pushing Signal and Tor so is super-privacy focussed.

## Google Apps and Services

There are two major parts to this:

1. Google play - the app store for downloading apk files to install (plus ratings, reviews, screenshots etc)
2. Google services - these provide services that many apps want to use to avoid multiple implementations such as location information, push notification etc.

There's a few ways of getting the google play store and related proprietary horrors:

* Open GApps - pulls down the proprietary apps and writes them to the image
* MindTheGapps? - pulls down the proprietary apps and writes them to the image
* microG - open source re-implementation of the services

[For Lineage 18.1 (Android 11) the Lineage wiki links to MindTheGaps](https://wiki.lineageos.org/gapps#mobile), and [XDA Developers says "Always Use the GApps Package Recommended by your ROM Developer"](https://www.xda-developers.com/gapps-package-recommended-rom-developer/)

I don't mind proprietary software as long as there's choice out there, and the apple app store + google play duopoly on apps is not choice. F-Droid is fine but doesn't have a single big name vendor's apps, so it's probably enough for google to dodge an anti-competitive lawsuit but not enough to produce any real competition.

Comparisons:

* <https://www.reddit.com/r/LineageOS/comments/8358p0/mindthegapps_vs_opengapps/>
* <https://www.reddit.com/r/degoogle/comments/olsv4c/i_am_very_confused_by_opengapps_mindthegapps/>

### Open GApps (installer)

Installer for google's proprietary services.

* GApps <https://wiki.lineageos.org/gapps>
* <https://github.com/opengapps/opengapps>
* <https://opengapps.org/>

Q: Why is this such a pain? A: Licensing...

> "Due to licensing restrictions, these apps do not come pre-installed with ROMs others than those from vendors that are part of the [Open Handset Alliance](http://www.openhandsetalliance.com/index.html) and must be installed as a sideload package by the user themselves." ~ <https://github.com/opengapps/opengapps/wiki/FAQ>

We're lucky they let us do this at all, google could take their toys away from us at any time.

For Open GApps pico looks sufficient <https://github.com/opengapps/opengapps/wiki/Package-Comparison>, Lineage recommends nano and no bigger.

### MindTheGapps (installer)

Installer for google's proprietary services.

Really haven't found much information about this.

#### About

* <https://gitlab.com/MindTheGapps/vendor_gapps> - I think this is probably the official source
	* There's no download link, as mentioned in this issue: <https://gitlab.com/MindTheGapps/vendor_gapps/-/issues/1>
	* <https://github.com/MindTheGapps/vendor_gapps> appears to be a stale copy, maybe they moved hosting to gitlab
* <https://www.getdroidtips.com/mindthegapps-8-1-0/>
* <https://forum.xda-developers.com/t/change-opengapps-for-mindthegapps-afterthought.3837816/>

#### Installation


* This wasn't a lot of help but basically said just flash it: <https://www.getdroidtips.com/mindthegapps-8-1-0/>

### microG (open source reimplementation)

<https://github.com/microg>

A free software implementation of shared services provided by the proprietary google services (such as location and push messaging used by many apps).

Doesn't work properly when flashed to lineage according to the faq so they made their own fork of Lineage "Lineage for microG" (see above)

### Aurora - play store proxy

Download apks (installation files) from the google play store without any googleness.

* <https://aurora-store.en.uptodown.com/android>
* <https://f-droid.org/packages/com.aurora.store/>

### Yalp - play store proxy

<https://yalp-store.en.uptodown.com/android>

### F-Droid app store

[F-Droid](https://f-droid.org/) is an app store for android like google play but without all the googlyness.

This a bit pointless if you install play because all the open source apps are available in both, and the closed ones are only in play. I think I'll skip this for now but I'm glad it exists... Though it is pre-installed in lineage-for-microG so I have poked around and installed a few things.

### Playmaker - play store / f-droid integration

<https://github.com/NoMore201/playmaker>

## Recovery images

### TWRP (great but not needed)

Previously I've used TWRP, and I got as far as flashing it before discovering [Lineage has it's own recovery image](https://www.xda-developers.com/lineageos-18-1-review/)
* Unlock bootloader <https://www.getdroidtips.com/oneplus-9-pro-unlock-bootloader/>
* Download TWRP for lemonadep <https://twrp.me/oneplus/oneplus9pro.html> - [3.6 twrp download for lemonadep](https://eu.dl.twrp.me/lemonadep/twrp-3.6.0_11-0-lemonadep.img.html)
* Get twrp public gpg/pgp public key to be able to verify `.asc` files <https://twrp.me/faq/pgpkeys.html>
* Flash TWRP (TeamWin Recovery Project?) <https://twrp.me/>
	* Power off the phone
	* Hold down volume-down and power buttons
	* Select english
	* select reboot to fastboot
	* connect the usb cable (usb-c to usb-c doesn't work on my dell xps, use the bigger usb 3 A to usb-c cable)
	* run `fastboot devices` on the laptop (connected over usb), you should see your phone listed
	* boot the phone from the local twrp image `fastboot boot twrp-3.6.0_11-0-lemonadep.img`, phone boots up into twrp gui
	* advanced > flash current twrp
	* there's a note about bootloops, but the options isn't there so skipping that
	* reboot > power off (says current slot: A, just for the record)
	* power on with volume-down held again, boots straight to twrp this time

### LineageOS's recovery image

Came across this here: <https://www.xda-developers.com/lineageos-18-1-review/>

Works well, flashed no problem and have used both recovery and fastboot modes with no issues. You'll see it as part of the steps below.

## Installing LineageOS on OnePlus 9 Pro (take 1)

It begins. [LineageOS](https://lineageos.org/).

The oneplus 9 pro device is codename `lemonadep`.

Useful howtos:

* [LineageOS official installation wiki page for OnePlus 9 pro lemonadep](https://wiki.lineageos.org/devices/lemonadep/install)
* [How-To Geek: How to Install LineageOS on Android](https://www.howtogeek.com/348545/how-to-install-lineageos-on-android/)
* [Android Authority: Beginner’s guide to installing LineageOS on your Android device](https://www.androidauthority.com/lineageos-install-guide-893303/) - lots more context and screenshots
* [LineageOSROMS (unofficial)](https://lineageosroms.com/install-lineageos/) - a very short 8 step guide
	* [LineageOSROMS (unofficial) full guide](https://lineageosroms.com/lemonadep/)
* [GetDroidTips](https://www.getdroidtips.com/lineage-os-18-1-oneplus-9-9-pro/) - not sure there's much extra useful here

[XDADevelopers coverage of Lineage support for OnePlus 9 pro](https://www.xda-developers.com/lineageos-18-builds-oneplus-9-pro-razer-phone-2-lenovo-p2/)

The steps:

* Download latest nightly (there's no stable/unstable on this): <https://download.lineageos.org/lemonadep> - this has both the ROM (OS image) and the recovery image.
* Download copy-partitions <https://androidfilehost.com/?fid=2188818919693768129> (as per wiki)
	* The sha256 for the copy I have is `200877dfd0869a0e628955b807705765a91e34dff3bfeca9f828e916346aa85f  copy-partitions-20210323_1922.zip`
* Verify all the sha256 sums: `sha256sum -c *.sha256`
* Boot to fastboot
* flash the lineage recovery:
	```
	tim@max:~/Downloads/oneplus9pro/LineageOS
	$ fastboot flash boot lineage-18.1-20211214-recovery-lemonadep.img
	Sending 'boot_a' (196608 KB)                       OKAY [  6.113s]
	Writing 'boot_a'                                   OKAY [  0.655s]
	Finished. Total time: 6.985s
	```
* copy partitions as instructed
	* boot into recovery (vol-down + power)
	* "apply update" > "apply from adb" (aka sideload)
	* `adb sideload copy-partitions-20210323_1922.zip`
	* Ignore unknown sig and "continue"
* wipe
	* boot into recovery (vol-down + power) if not already in it
	* "format data / factory reset"
* OS install
	* boot into recovery (vol-down + power) if not already in it
	* "apply update" > "apply from adb" (aka sideload)
		```
		tim@max:~/Downloads/oneplus9pro/LineageOS
		$ adb sideload lineage-18.1-20211214-nightly-lemonadep-signed.zip
		serving: 'lineage-18.1-20211214-nightly-lemonadep-signed.zip'  (~47%)
			adb: failed to read command: Success
		```
		apparently this is normal, but the failed to flash error on the phone is not, and rebooting drops me back into the existing Oxygen install. Dammit.... Try again
	* Second attempt ran fine
		* output: `step 1/2`
		* output: `step 2/2`
		* then recovery logo comes back up and it just sits there
		* volume up to the back arrow at the top, power to press it
		* *then* it says "`install complete with status 0`" (zero being unix-speak for no-issues)
		* but it doesn't ever get past the lineage logo when booting, maybe because of the boot of oxygen. hmm
		* [hard-power-off](https://www.youtube.com/watch?v=y2yB2dRrXiA) by holding down volume-up and power button
	* take 3,
		* back to recovery
		* re-wipe (factory reset)
		* reboot
		* this time it booted... briefly
		* it got to setup screen, then before I did anything rebooted into some kind of recovery failsafe and prompted to factory reset again, which I did. This time it rebooted and stayed up while I zipped through the wizard.
* go take a look - ignore the warning about doing gapps etc first just so we can see what vanilla Lineage looks like. We can always wipe & reflash
	* wonderfully empty app list!
	* basic main camera & selfie cam works
	* flashlight works
	* odd android verify notification, didn't seem to work
	* top shelf only available on lockscreen, odd
	* no sim yet and wifi not connected yet, so not much else to test
	* vol-down + power still takes screenshots

### Connect adb, see if we get root shell

<https://developer.android.com/studio/command-line/adb#Enabling>

* On the phone enable adb
	* settings > about phone > tap "build number" repeatedly
	* settings > system > advanced (grrrr) > developer options
		* usb debugging [on]
		* rooted debugging [on]
		* disable adb authorization timeout [on]
	* connect usb cable to laptop
	* phone prompts "Allow USB Debugging?"
		* tick "always allow"
		* press "allow"
* On the laptop `adb devices` should now show the phone

Success with non-root:
```
$ adb shell
OnePlus9Pro:/ $ ^D
```

Root denied without flipping the "rooted" option:
```
$ adb root 
ADB Root access is disabled by system setting - enable in Settings -> System -> Developer options
```
After enabling rooted debugging as above:
```
$ adb root  
restarting adbd as root
$ adb shell
OnePlus9Pro:/ # whoami
root
```


### Getting root back

#### Grumble

It really annoys me that on a laptop this isn't even a step, yet on Android this is a whole additional drama. But I may have already mentioned that. Understanding the reasons doesn't mean I have to like it.

#### adb root shell

According to <https://www.xda-developers.com/lineageos-dropping-superuser-addonsu-implementation-favor-magisk-manager/> adb root shell is the official LineageOS way of getting root access to "mess with important files".

```
$ adb root  
restarting adbd as root
$ adb shell
OnePlus9Pro:/ # whoami
root
```
Worth knowing but not much help for running titanium backup as root.

#### Magisk

According to <https://www.xda-developers.com/lineageos-dropping-superuser-addonsu-implementation-favor-magisk-manager/> Magisk is the only real option now. I guess SuperSU still works but lacks the masking that allows you to fool android pay etc.

##### ⚠️ Beware of fake Magisk sites !! ⚠️

Github is the official home for Magisk and it's downloads: <https://github.com/topjohnwu/Magisk>

[**Beware of clone sites**](https://www.xda-developers.com/psa-magiskmanager-com-not-official-website-magisk/amp/) especially ones offering downloads.  `MagiskManager.com` is not legit or authorised and may host malware at some point. I've seen a few others too. They look like SEO optimised clones that could potentially be feeding some or all visitors malware.

It's worth being extra-careful with things like recovery images and rooters because by definition they have full control of your device, malicious or malign.

##### Magisk root install

LineageOS said not to boot before doing installing GApps, I'm not sure if that applies to Magisk too. I already have booted up. Not sure if a factory reset plus wipe will be enough or whether the image will have to be reflashed. I'll try with just an install, if that doesn't work I'll try the reset and see what happens, and if *that* doesn't work I'll try a full reinstall.

* Look at readme at <https://github.com/topjohnwu/Magisk>
* Follow instructions <https://topjohnwu.github.io/Magisk/install.html>
* Download latest release <https://github.com/topjohnwu/Magisk/releases/latest>
* install the app with adb (with the phone on, and booted to LineageOS as per normal use)
	* <https://www.droidviews.com/install-apk-files-using-adb-commands/>
	```
	$ adb install Magisk-v23.0.apk 
	Performing Streamed Install
	Success
	```
	* On the phone, swipe up for the full app list (drawer), and there is a Magisk icon!

###### Getting boot.img

The instructions for Magisk just say you need `boot.img`, leaving know clues how to get it. [I've proposed explaining how to extract them in this pull request](https://github.com/topjohnwu/Magisk/pull/5132)

It turns out it's embedded in the Lineage system image `lineage-18.1-20211214-nightly-lemonadep-signed.zip` that we've already downloaded.

There's another payload extractor with easier dependencies that's worth a try, especially if you don't already have python: [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
 | [payload-dumper-go downloads](https://github.com/ssut/payload-dumper-go/releases/latest). I've now tested this and it works great. You don't even have to unzip the zip.

Extract the `payload.bin` file from the `lineage-18.1-20211214-nightly-lemonadep-signed.zip` to the same folder as the python script.

Some instructions on using python to extract the boot image: <https://forum.xda-developers.com/t/guide-how-to-extract-payload-bin-from-ota.3830962/> (ignore the file it's older than the github one)

The `payload_dumper` file appears to be from <https://github.com/vm03/payload_dumper> assuming my googling is accurate.

I didn't need to do the pip install.

I did change the python to python3 at the top of the py file and make it executable.

```
tim@max:~/Downloads/oneplus9pro/payload_dumper
$ ./payload_dumper.py payload.bin 
boot
dtbo
odm
product
system
system_ext
vbmeta
vbmeta_system
vendor
vendor_boot
tim@max:~/Downloads/oneplus9pro/payload_dumper
$ ll output 
total 5.6G
-rw-rw-r-- 1 tim tim 192M Dec 20 23:20 boot.img
-rw-rw-r-- 1 tim tim  24M Dec 20 23:20 dtbo.img
-rw-rw-r-- 1 tim tim 2.8M Dec 20 23:20 odm.img
-rw-rw-r-- 1 tim tim 1.3G Dec 20 23:21 product.img
-rw-rw-r-- 1 tim tim 267M Dec 20 23:21 system_ext.img
-rw-rw-r-- 1 tim tim 2.5G Dec 20 23:21 system.img
-rw-rw-r-- 1 tim tim 8.0K Dec 20 23:21 vbmeta.img
-rw-rw-r-- 1 tim tim 4.0K Dec 20 23:21 vbmeta_system.img
-rw-rw-r-- 1 tim tim 192M Dec 20 23:22 vendor_boot.img
-rw-rw-r-- 1 tim tim 1.3G Dec 20 23:22 vendor.img
```

Hurrah, now we have a `boot.img` to give to Magisk.

###### Magisk rooting

Copy the `boot.img` across:

```
tim@max:~/Downloads/oneplus9pro/payload_dumper
$ adb push output/boot.img /sdcard/ 
output/boot.img: 1 file pushed, 0 skipped. 177.5 MB/s (201326592 bytes in 1.082s)
```

* Press install on the Magisk app.
* "Select and Patch a File"
* hamburger in file browser > "OnePlus 9 Pro" (obviously, duh) > `boot.img`
* "let's go ->"
* Magisk shows steps then" output file is written to..." and a path to download folder

```
tim@max:~/Downloads/oneplus9pro/payload_dumper
$ adb shell
OnePlus9Pro:/ # ls -lh /sdcard/Download/
total 96M
-rwx------ 1 u0_a163 u0_a163 192M 2021-12-14 13:21 magisk_patched-23000_BYMDt.img
```

* pull the file back to the laptop `adb pull /sdcard/Download/magisk_patched-23000_BYMDt.img`
* Now flash the file to the phone:
	* (the vol-up + power didn't work for me, just did a normal boot, vol-down + power is reccovery not fastboot)
	* Settings > system > advanced (ffs) > gestures (wtf?) > power menu > advanced restart [on]
	* power button (hold) > power > restart > fastboot

```
tim@max:~/Downloads/oneplus9pro/payload_dumper
$ fastboot flash boot magisk_patched-23000_BYMDt.img 
Sending 'boot_b' (196608 KB)                       OKAY [  6.035s]
Writing 'boot_b'                                   OKAY [  0.639s]
Finished. Total time: 6.853s
```

* power off
* power on
* open up the Magisk app - it shows installed version number now, hurrah

Using Magisk:

* Click the cog (top right) to optionally turn on "MagiskHide"
* Along the bottom are four icons
	* Home
	* Shield - shows root requests
	* bug - shows logs
	* jigsaw piece - shows modules, activate, deactivate & install

### adb

[adb](https://developer.android.com/studio/command-line/adb)

I consider this an important backup access to the phone. If the screen fails then this allows you to pull any important files off over usb.

Steps for this are above.

## Installing "Lineage for microG" (tried, rejected for now)

* <https://lineage.microg.org/> has install and download links
* Download image from <https://download.lineage.microg.org/lemonadep/>
	* check sha: `sha256sum -c lineage-18.1-20211220-microG-lemonadep.zip.sha256sum`
	* run update_verifier python script:
		* download (or clone) [python update_verifier](https://github.com/lineageos4microg/update_verifier) - <https://github.com/lineageos4microg/update_verifier/archive/refs/heads/master.zip>
		* setup python3 with [asdf-vm](https://asdf-vm.com/) (I had python 3 but no pip, and I like to use adsf)
		* extract the zip, open terminal in extracted folder
		* `asdf plugin add python`
		* `asdf install python 3.10.1`
		* `asdf local python 3.10.1`
		* `pip install -r requirements.txt`
		* `python update_verifier.py lineageos4microg_pubkey ../lineage-18.1-20211220-microG-lemonadep.zip`
		* output: `verified successfully`
* Go back to lineage install instructions <https://wiki.lineageos.org/devices/lemonadep/install>
* Boot to fastboot
* flash the lineage-microG recovery: `fastboot flash boot lineage-18.1-20211220-microG-lemonadep-recovery.img`
* copy partitions as instructed
	* boot into recovery (vol-down + power)
		*  or "enter recovery" from lineage fastboot
	* "apply update" > "apply from adb" (aka sideload)
	* `adb sideload ../LineageOS/copy-partitions-20210323_1922.zip`
	* Ignore unknown sig and "continue"
* wipe
	* boot into recovery (vol-down + power) if not already in it
	* "format data / factory reset"
* OS install
	* boot into recovery (vol-down + power) if not already in it
	* "apply update" > "apply from adb" (aka sideload)
	* `adb sideload lineage-18.1-20211220-microG-lemonadep.zip`
* reboot
* skip all the guided setup steps
* open the microG app
* run the self check (all green ticks for me, woo)

So now I have a clean LineageOS install with a FOSS re-implementation of google's proprietary shared services. Win.

Now re-run magisk sideload from above to get root again.

* re-enable adb as before
* re-enable advance power button menu
* `adb install Magisk-v23.0.apk`
* grab a [payload-dumper-go binary release](https://github.com/ssut/payload-dumper-go/releases/latest)
* `payload-dumper-go_1.2.0_linux_amd64/payload-dumper-go lineage-18.1-20211220-microG-lemonadep.zip`
* `adb push extracted_20211221_231517/boot.img /sdcard/Download/`
* run the patch in the phone Magisk UI (under "install")
* get the filename to pull: `adb shell ls /sdcard/Download`
* `adb pull /sdcard/Download/magisk_patched-23000_d5mu3.img`
* reboot to fastboot
* `fastboot flash boot magisk_patched-23000_d5mu3.img`
* "reboot system now" in lineage fastboot menu

Success, now I have root *and* microG.

Next, see if Aurora does the job, and if not how do I get google play on top of microG, if that's even possible. Till next time...

### Getting apps

#### F-Droid

F-Droid is preinstalled (stared blankly at app list for a while before spotting it!) so that was easy, this can install *many* open source apps, and warns about "anti-features" which is a nice touch.

Used F-Droid to install andOTP as a test (alternative to google authenticator 2FA app). Worked well.

#### Apps from play store - Aurora

Found Aurora in f-droid with a search, installed no problems, opened it up.

First thing it does is prompt for install type which is confusing and lacks enough context to know what it means. The four types are explained further here: <https://auroraoss.com/faq/#how-does-aurora-store-install-apps> thought I'm still not really sure. I don't know what a "split apk" is yet, and I don't see if there's a difference between root and services as I could do either and they both say they do the same thing.

* Session - recommended but not clear why, I think it's saying it's like "Aurora Services" but with more something-or-other
* Native - doesn't support split apks, that sounds bad, see below for what they are (see below for split apk research)
* Root - auto install when downloaded
* Aurora Services - auto install when downloaded

How to choose?  I guess I'll go with the recommendation.

Couple of theme questions. Meh.

Installer question: "Select a suitable installer"

* External Storage Access [grant] - pops and allow dialog, clicked "allow"
* External Storage Manager [grant] - required on R+ (aka android 11), which we are running, guess I'll need that, - opened permissions screen, toggled to allow
* Installer Permission [grant] - opened permissions screen, toggled to allow

"Finish"

Log in using:

* Google
* Anonymous

It seems from what I've read in the FAQ and terms that using the real login is best because the anon accounts end up with random locales and app restrictions depending on where the login was generated.

[install keepassdroid and push my kdb across with adb to get the google login, eventually the kdb will be sync'd with syncthing]

... log in with google ...

And we're in, app listing showing. Disconcerting to see disney+ etc in "free" app store on a "free" phone.

WhatsApp isn't available in f-droid so let's try that as an experiment... It's in the list... it installed... it opened... it worked! (And logged me out of the other phone, fucking whatsapp).

##### What's a split APK?

* APK splitting - <https://developer.android.com/studio/build/configure-apk-splits>
* Android App Bundles - defers apk generatoin to play store <https://developer.android.com/guide/app-bundle>
* Feature delivery - partial app additions and updates <https://developer.android.com/guide/playcore/feature-delivery>
* Old unsupported app "SAI" split apk installer:
	* <https://forum.xda-developers.com/t/guide-split-apk-installation.3934631/>
	* <https://github.com/Aefyr/SAI>
* <https://www.reddit.com/r/androiddev/comments/cenuvs/what_is_it_with_publishing_split_apks_on_google/>
* <https://www.reddit.com/r/androiddev/comments/ci4a7r/confused_about_split_apk/>

### The state of the system

What's working and what isn't.

#### Google voice to text (dead)

The keyboard has a little mic button which allows you to use google's services to enter text anywhere you like by typing. This is useful as I hate phone keyboards. I use it quite a lot. Unsurprisingly with the microG setup that's not working at all. The button is there but it does nothing.

#### Bluetooth (working)

Headphones connected and played no problem.

### The state of the apps

What's working and what isn't.

#### Banking apps (mixed)

Let's start with the big one. This is most likely to sink an open source effort as they try to protect themselves by joining in the lockdown.

Surprisingly two out of three of the banking apps I'd like to use actually worked on the rooted custom ROM with an unlocked bootloader. I had not turned on the magisk hide capability at this point. One banking app behaved as if nothing was different, one popped a warning but allowed the app to continue and one flat out refused to run. I'm not going to name the banks involved on the public internet as I don't want to encourage anyone to test the security of my banking.

One of the apps logged me out of my other phone. The other functioning app offered to transfer a "digital key" to the new device, and without that allowed me to use the first phone to generate a login code and use that to poke around. I didn't try transferring the key.

More worrying was the realisation that I'd been locked in to running a google/iOS locked-down device by one of the banks as they are an "app-first" bank. You can't even use the online banking without the phone app, and the phone app requires a locked and signed phone. It's only by going on this very journey of actually trying to set up a phone that I control that I'd even noticed this insidious creeping embrace of platform-lockin. So now to truly escape the platform, I have to change banks as well.

#### Google calendar (mostly working)

I'm afraid I still use google's calendar, and there's a high cost of change as I've got my other half using a shared calendar. The calendar worked fine, although oddly the "widget" (view of calendar that can be placed on the phone's desktop when unlocked) was blank until I left the phone in the drawer with wifi off for two days. For who-knows-what reason when I got it out the drawer it has started working.

Oddly the events have shown up but reminders are missing. This is a bit of a problem as I use them a lot. It's not that they're local to my other phone because they show on the google calendar web interface too.

#### Amazon things (working)

The amazon shopping app worked no problem.

To my surprise the amazon primve video app worked and played content as normal. I rather expected some kind of DRM smackdown to kick in on a rooted device.

Audible worked and played no problem.

#### Spotify (working)

Again pleasingly working with no quibbling or warnings. This is more important to me at the moment than perhaps it should be.

Casting sound to chromecast audio not working.

#### Whatscrapp (working)

Much as I hate WhatsApp and it being owned by Facebook/Meta .... thanks to network effect I kinda still need it. I've managed to get some of my contacts over to telegram/signal but not everyone.

WhatsApp worked but signed me out of the other phone (ffs). Bonus points for receiving an important message from someone I haven't heard from in about a year on the wrong phone. Ugh.

So on the plus side I've learned of another reason to dislike WhatsApp.

### Hiding the unlock & root

Magisk has in its settings a "hide" option. This had no noticeable effect on the "SafteyNet" test (still three of three tests fail for me) built in to Magisk. I didn't notice any change in app behaiour in my limited poking.

### WiFi-based location (turn on)

Understandably from a freedom-warrior point of view the wifi-based loction services are off by default, but this is a bit of a pain because if you've ever used pure GPS positioning you'll know it's shit at doing it in houses, offices and built up areas, takes ages to get a lock, and is a bit hit and miss in cars. The accuracy you normally see is much more a function of the ubiquity of wifi in our urban lives.

### Screen refresh rate 60/120Hz (increase)

The "minimum screen refresh rate" setting was set to 60Hz. There's also a developer option for showing the current rate. In my experiment it sat at 60Hz all the time. This is fine till you scroll up and down, then you notice how much smoother the text scrolls at 120Hz. I upped the minimum to 120Hz which seemd to work.

There's also a smooth-scroll option that I turned on that seems to produce a nicer effect.

## Using adb to do backups

It might be possible to backup a locked down phone without root by using adb's backup capabilities. I haven't looked into this much or tried it yet but here's some quick research notes:

* [gist: Backup android app, data included, no root needed, with adb](https://gist.github.com/AnatomicJC/e773dd55ae60ab0b2d6dd2351eb977c1)
* <https://net2.com/how-to-backup-and-restore-your-android-device-with-adb-on-ubuntu/>
* <https://www.paulligocki.com/backup-restore-android-with-adb/>
* <https://stackpointer.io/mobile/android-adb-backup-extract-restore-repack/372/>
* <https://stackoverflow.com/questions/19225467/backing-up-android-device-using-adb>
* <https://android.stackexchange.com/questions/69567/what-all-does-adb-backup-and-how-do-i-restore-part-of-it>

This might give me a way of rescuing some of my data from my old phone that de-rooted itself in an OS upgrade and fucked my titanium backups (still bitter).

Oh but wait...

> [Devs can set the ALLOW_BACKUP flag to "No"](https://android.stackexchange.com/questions/69567/what-all-does-adb-backup-and-how-do-i-restore-part-of-it#comment125038_69576)

Argh, what is wrong with this platform.

## Customisations

* Turn on all the power button options:
	* Settings > system > advanced (ffs) > gestures (wtf?) > power menu > advanced restart [on]

## Options - what now?

That's been an enlightening exercise in "is this even possible". I've learned a huge amount about the current state of the phone ecosystem. I'm in equal measure dismayed and hopeful, there are some unpleasant trends and circumstances, and some really encouraging signs of hope for the open ecosystem.

There really isn't a clear answer for me for where to go from here. There are downsides and challenges in every direction.

The options available seem to be in increasing order of freedom and somewhat decreasing order of utility:

* Get an iPhone and abandon my principles and control, go live in a digital nursing home. - YeahNo.
	* get banking apps galore
	* never get root again
	* trust apple to administer the correct dosage of backups
	* forever more fight the divide between iOS and my linux laptops
* Install Oxygen 11, relock the bootloader, live without root, have no upgrade path because Oxygen is dead. - No.
	* possibly brick the phone trying to lock it
	* get banking apps
	* never get root again
	* never have decent backups
	* forever more fight the divide between iOS and my linux laptops
* Install lineage and one of the google apps installers
	* still no bank
	* probably get reliable google goodness
	* get stalked by google (no change there, I dno't mind as much as some about this)
	* unknown time-to-failure
	* I think this is probably the most "mainstream" of the subversive options so is most likely to continue to have a forward path for the next few years
	* worry about security of unlocked evenrything and the security of lineage - I think it's probably no worse than linux at this point but who knows
* Install lineage-for-microG (current experiment)
	* no bank, no voice-to-text
	* worry more about the security of build servers for this niche option
	* I don't know how sustainable this project is, it's certainly noble
* go all in and run a linux distro
	* definitely no apps for you
	* get to take the moral high ground
	* lose touch with everyone who is on whatsapp

It would be nice to think that by choosing to run the most open thing I can I am in some way helping, but I think the truth is users really don't make much difference to projects like this unless they come in enough numbers to sway app vendors like WhatsCrapp to support more obscure platforms. It's only the hackers and those who can financially fund projects who really make a difference here. So while I want to run the most open thing I can it doesn't really matter a hill of beans outside of my own brain whether I do or not.

I think having written down the options I'm swinging towards lineage + proprietary google services. This seems to solve the immediate problem of getting unlocked and rooted and getting working backups again without losing everything that's useful to me in the process.

I'm glad I've tried the microG version, and hope we see open source slowly chip away at the power of the two giants just like Linux did in the desktop space over decades.

## Installing LineageOS + google services on OnePlus 9 Pro (take 2) - fail

I now have the lineage bootloader so the steps to get into recovery etc are a bit different than with stock or TWRP.

> "Note: If you want the Google Apps add-on on your device, you must follow this step before booting into LineageOS for the first time!" ~ <https://wiki.lineageos.org/devices/lemonadep/install#installing-lineageos-from-recovery>

1. Download latest nightly (there's no stable/unstable on this): <https://download.lineageos.org/lemonadep> - this has both the ROM (OS image) and the recovery image.
1. Download copy-partitions <https://androidfilehost.com/?fid=2188818919693768129> (as per wiki)
	1. The sha256 for the copy I have is `200877dfd0869a0e628955b807705765a91e34dff3bfeca9f828e916346aa85f  copy-partitions-20210323_1922.zip`
1. Verify all the sha256 sums: `sha256sum -c *.sha256`
1. Boot to fastboot
1. flash the lineage recovery: `fastboot flash boot lineage-18.1-20211228-recovery-lemonadep.img`
	1. don't reboot yet
1. copy partitions as instructed
	1. switch to recovery
	1. "apply update" > "apply from adb" (aka sideload)
	1. `adb sideload copy-partitions-20210323_1922.zip`
	1. Ignore unknown sig and "continue"
	1. come back out of recovery menu (don't reboot yet)
	1. don't reboot yet
1. "factory reset" > "wipe all data"
	1. don't reboot yet
1. flash OS:
	1. "apply update" > "apply from adb" (aka sideload)
	1. `adb sideload lineage-18.1-20211228-nightly-lemonadep-signed.zip`
	1. don't reboot yet
1. MindTheGapps - I haven't found any instructions for this anywhere
	1. check the arch (it's `arm64`) here <https://wiki.lineageos.org/devices/lemonadep/>
	1. Download the arm64 build from <https://androidfilehost.com/?w=files&flid=322935>
		1. or the "mirror" <http://downloads.codefi.re/jdcteam/javelinanddart/gapps>
	1. Given there's no shas anywhere I downloaded from several mirrors and cross-checked the hashes. `85481cb98c8a8692f52c033ead1db436870af385498a917701fcd8c6182e145c  MindTheGapps-11.0.0-arm64-20210920_084011.zip`
	1. "apply update" > "apply from adb" (aka sideload)
	1. `adb sideload MindTheGapps-11.0.0-arm64-20210920_084011.zip`
	1. ignore signature warning (the price of escaping a closed ecosystem)
	1. error shown on phone, roughly:
		```
		low resource device detected, removing large extras
		not enough space for gapps! aborting
		...
		error in /sideload/package.zip (status 1)
		```
		1. [patch that adds error message](https://gitlab.com/MindTheGapps/vendor_gapps/-/commit/0f6b4560288267b644c49de0fdc538fa30980708)
		1. [current message on `sigma` branch](https://gitlab.com/MindTheGapps/vendor_gapps/-/blob/de0847802034654d63150c3de3ca05f1af326316/build/meta/com/google/android/update-binary#L38)
		1. In lineage recovery, mount `sytsem` and enable adb, run df:
			```
			OnePlus9Pro:/ # df -h /mnt/system                                                                                            
			Filesystem      Size  Used Avail Use% Mounted on
			/dev/block/dm-2 0.9G  0.9G  3.0M 100% /mnt/system
			```
			That is indeed quite full. Annoyingly the installer doesn't say which partition is full.
		1. Some ideas here <https://forum.xda-developers.com/t/q-insufficient-storage-space-in-system-partition.3018464/>
		1. Try format & reboot to recovery, nope.
		1. hint that it could be slot related <https://www.reddit.com/r/LineageOS/comments/fuykda/lineage_os_171_opengapps_error_not_sufficient/>
		1. let's try a swap slot as per <https://www.reddit.com/r/LineageOS/comments/fqashj/difficulty_installing_gapps_after_lineage_os/fluhd8s/?context=3>
		1. enter fastboot
		```
		tim@max:~/Downloads/oneplus9pro/MindTheGapps
		$ fastboot set_active other
		Setting current slot to 'b'                        OKAY [  0.043s]
		Finished. Total time: 0.044s
		```
		1. enter recovery
		1. re-run the sideload 
		1. "apply update" > "apply from adb" (aka sideload)
		1. `adb sideload MindTheGapps-11.0.0-arm64-20210920_084011.zip`
		1. ignore signature warning (the price of escaping a closed ecosystem)
		1. same space error. sigh

### Possible cause of space error

1. [Partition not mounted at all](https://forum.xda-developers.com/t/q-insufficient-storage-space-in-system-partition.3018464/post-76072942)
1. [LineageOS image has partitions that are too small](https://forum.xda-developers.com/t/q-insufficient-storage-space-in-system-partition.3018464/#post-84651523) to fit extra g-apps in.
	* Maybe use [TWRP BigSys](https://forum.xda-developers.com/t/dev-kernel-4-4-android-8-0-oreo.3688948/) to get bigger partitions??
	* Manually re-partition? Alegedly dangerous.
		* <https://android.stackexchange.com/questions/216123/android-how-to-increase-system-partition-and-decrease-data-partition#comment276924_216123> warning of brickability if you touch wrong device
		* <https://www.reddit.com/r/Android/comments/2o8lvf/why_cant_we_resize_partitions_on_android_but_on/>
1. [Incompatibility with Lineage bootloader - use TWRP instead](https://www.reddit.com/r/LineageOS/comments/fu70jg/linageos_171_unable_to_install_gapps/) - worth a try I think, probably the next thing I'll try.
1. Ruled Out: [Wrong/stale slot in use](https://www.reddit.com/r/LineageOS/comments/fuykda/lineage_os_171_opengapps_error_not_sufficient/) - tried swap slot (above), no change.
1. Ruled out: Booting phone before gapps install (didn't do this so not this).

### Patching the installer - abandoned

It seems to me having read around that the error message is hiding useful information on the state of the device and what exactly failed. (Which partition is out of space? Is it just read only or something?). I'n not feeling like playing with partitioning given the warnings I saw on a forum of potentially bricking a device

There's links to the source above and I did start fiddling with this, but you have to figure out how to re-sign the zip to get it to install at which point I fell down an android-sized rabbit hole.

#### Signing zips and apks

Here's what I found so far, I haven't got it working yet.

I *think* it's the same signing that you have to do to `apk` files, and `apk` is just a special shaped `zip` file. Off into learning-android-sdk-land I went...

* There's some kind of strange android app that can sign zips called [ZipSigner](https://f-droid.org/forums/topic/zipsigner/)
	* [ZipSigner is missing source code](https://code.google.com/archive/p/zip-signer/issues/3) so you are relying on random binaries. Dodgy but probably well intentioned.
* <https://android.stackexchange.com/questions/222262/how-to-create-manually-create-my-own-%e1%b4%8f%e1%b4%9b%e1%b4%80-update-file-to-be-used-for-adb-sideload>
* <https://android.stackexchange.com/questions/95425/update-zip-just-for-fixing-file-permissions-possible>
* <https://forum.xda-developers.com/t/tutorial-the-updater-script-completely-explained.2377695/>
* <https://www.bettermobileapp.com/article/10558021/Updater-script>
* <https://android.stackexchange.com/questions/191043/edditing-updater-script>
* <https://androidforums.com/threads/custom-rom-updater-scipt-troubleshooting.701752/>
* <https://android.stackexchange.com/questions/35600/how-to-create-an-update-zip-file-that-can-copy-rename-a-file>
* <https://developer.android.com/studio/command-line/zipalign>
* <https://developer.android.com/studio/publish/app-signing#opt-out>
* <https://developer.android.com/studio/command-line/apksigner>
* <https://www.addictivetips.com/mobile/what-is-zipalign-in-android-and-how-it-works-complete-guide/>
	* <https://stackoverflow.com/questions/3994035/what-is-aligned-memory-allocation>
* <https://www.androidcentral.com/installing-android-sdk-windows-mac-and-linux-tutorial>

### Let's try TWRP+Lineage+MindTheGapps - fail

#### Install TWRP

<https://www.getdroidtips.com/replace-lineageos-recovery-twrp/>

1. Reboot phone to fastboot or something (the built-in one where the volume key changes options), leave it in that state
1. `fastboot devices` on linux should show the phone
1. `fastboot boot twrp.img` (already downloaded and symlinked above)
1. Phone reboots into twrp temporarily
1. Advanced > flash current twrp
1. Reboot (ok the no-OS warning)
1. Yay, booted into twrp, comforting

#### Install LineageOS (yet again)

* Well, let's get a new nightly
* Instructions say check model...
	* Reboot to twrp (recovery) with USB connected to laptop
	* Laptop pops window for new mount `mtp://OnePlus_LE2123_dade278d/`
	* Yep, LE2123 is in the supported list. Phew.
* Skip all the "recovery" steps in <https://wiki.lineageos.org/devices/lemonadep/install>
* I'm guessing I don't need to run "copy partitions" again because that's to avoid only having one working slot, and I already have to having done this before. Tell me if I'm wrong!
* Give up waiting for new image download (~1GB), continue with older image...
* Factory reset
	* TWRP > Wipe > Swipe for factory reset
	* back
	* Format Data (button)
	* type yes to continue (wiping all apps & data)
	* back to main menu (android back button lots of times)
* Flash lineage
	* Still in TWRP
	* Advanced > ADB Sideload
	* Tick the wipe boxes ("Dalvik cache" + "cache")
	* Swipe to sart sideload
	* `adb sideload lineage-18.1-20211228-nightly-lemonadep-signed.zip`
	* back
	* Don't reboot yet
* Add MindTheGaps
	* still in TWRP
	* ADB Sideload
	* swipe (cache wipe still selected)
	* `adb sideload MindTheGapps-11.0.0-arm64-20210920_084011.zip`
	* fail. log:

```
**********************
MindTheGapps installer
**********************
Extracting files
Setting up environment
Mounting partitions
Could not mount /mnt/system! Aborting
Updater process ended with ERROR: 1
```
For goodness sake.

Fuck it, let's try the other gapps even though it says not to....

Reboot just to have a look... Lineage running fine, no sign of any gapps.


### Let's try TWRP+Lineage+OpenGApps - fail

* Power off
* power + vol-down - ended up in lineage recovery, wat?? swap slot??
* reboot to bootloader? no that's the built-in pixelated bright green "START" thing, oh actually that's fine, that's the fastboot thing.
* switch slot as above

```
fastboot set_active other
Setting current slot to 'b'
... OKAY [  0.048s]
Finished. Total time: 0.056s
```
* reboot to recovery
* back in TWRP

That's cool! I have lineage recovery in slot `a` and TWRP in slot `b`.

Okay, back to the plan.

#### Lineage (again again again...)

* Repeat the lineage intall steps above (no idea if that's really necessary but *shrug*)

#### OpenGApps install - fail

* Download <https://opengapps.org/?api=11.0&variant=nano> - ARM64 / 11 / nano
	* (manually changed from 10 to 11 from link on <https://wiki.lineageos.org/gapps>)
	* download the md5 too
	* `md5sum -c *.md5` to validate...
* Back to ADB Sideload in TWRP (cache wipe ticked x2), swipe to start
* `adb sideload open_gapps-arm64-11.0-nano-20220215.zip`
* cross fingers
* bah. failed, basically same error.

```
- Performing system space calculations

Insufficient storage space available in
System partition. ...
...
Error Code: 70
```

grap logs as instructed: `adb pull /sdcard/open_gapps_log.txt` - success 

[gist of log file open_gapps_log.txt](https://gist.github.com/timabell/c4f16fd656f3faf8a16d06aa113e0346)

Important bit here is that there is **ZERO** space, so choosing smaller install is not going to work.

```
...
Current Free Space |         0
...
```

Well on the plus side the diagnostics are muuuuch better in OpenGApps so that's saved me fucking around trying to patch MindTheGaps' installer.

## Two-phone-Timmy - the burner phone

Having spent some time completely stumped by the space issue and giving it some thought I realize that this battle with Android will never end. Trying to get an unholy mix of Libre and proprietary to mix is like oil and water.

I can opt out of that battle by running two phones.

1. A "primary" phone that I use as much as possible, running the Free-est thing I can muster. This would get the sim card. This would be the OnePlus 9 pro, ideally running PureOS as per the Librem 5 phone, but if not that then Lineage without the GApps that I couldn't get to work.
2. A burner phonee that's basically stock Android so that I can fall back to this for everything that can't or won't work on a free-er & unlocked base OS. (My existing OnePlus 5t for now while it lasts, reset to stock OxygenOS). This one can the get internet by tethering to the primary. I don't think any of the apps actually require the sim to be present. I guess we'll see.

### The primary (9 Pro)

The idea here is to get the free-est possible base layer (i.e. operating system), and then get maximum functionality within that. Anything that doesn't work or I can't find a working alternative to gets punted to the burner phone while we wait for hell to freeze over again. This will be the compromise for now.

* Research trying PureOS, see what the app ecosystem is like - done - nope
	* research done, doesn't seem to be possible to install on the OnePlus. Next...
* Continue with Lineage (I left the phone with a working but empty install of this)
* **Don't install proprietary google play services or play store at all.** - This is the line in the sand. I would have accepted it for now, but given I couldn't install it, I'll take it as the new battle line for free vs proprietary.
* Install microG for re-implementation of shared services (i.e. location, polling for updates from servers etc)
* Install Aurora play store proxy again to be able to try out app store apps
* See how close I can get to a usable phone.

### The burner (5t)

* Factory reset the 5t
* Install just what I couldn't get to work on the primary
* Cry because the backups were shit and now I've lost access to something I care about (I predict)

## Primary setup - experimenting

Fired up the lineage (minus all google stuff) that I'd installed and then failed to get any gapps on (space issue above, no longer care).

Went through language prompt, was looking at time prompt in setup wizard when the phone rebooted with some kind of couldn't read data error. Disturbing. Rebooted, selected "try again" and it didn't do it this time.

### Setup wizard

	- selected UK location,
	- GMT timezone.
	- Put in wifi password (incorrectly)
	- set up pin
	- set up fingerprint
	- booted into OS (yay, pleasing to see Lineage in action)

### OS update with on-phone updater

settings > advanced > updater

shows list of OS updates. hit refresh, nothing new. latest is 18.1 26th Apr 2022

tap download ....

tap intall (even longer pause ... installing ... finalising package installation ...) ..

reboot (press button that's presented)

### config

* turn off annoying sounds
	* settings > sound > advanced
	* screen locking sound - off
	* touch sounds - off

### todo

* replacement contact management (currently using google)
* replacement calendar management (currently using google)
* insert sim

### already google-free

* email (fastmail domain + k9mail app)
* broswer - firefox
* search - duckduckgo
* OTP - andOTP
* maps/satnav (partially) - could use waze + maps.me (google maps is a decent car satnav, not found a perfect equivalent)

## burner phone

No sim in this one, use wifi and/or bluetooth tethering to get internet on it.

Things I can't escape the googly jail for

* google maps?
* apps for clients
	* microsoft outlook
	* securid (vpn stuff)
	* google authenticator (use andOTP instead wherever possible)
	* microsoft authenticator (yuck, what's wrong with the OTP standard?!?!)
	* digidentity
* banking apps that don't work on the primary phone (not naming because haxxors)
* google pay (never used it, just use an actual card)
* google home for controlling the chromecast
* spotify just for casting to the chromecast audio

To my horror I have discovered that android allows apps to force remote admin privs so that IT departments can snoop on your BYOD. Hello Microsoft Outlook + Active Directory. Yet more erosion of user rights in the name of security. There's no way in hell I'm allowing a client to be an admin on my primary phone so this is burner phone territory if at all necessary; though I just won't install any of that junk at all and will be uncontactable within their network unless on their supplied devices. Shrug.

## Primary phone - microG

### lineage+microG - failed install

Re-run setup in section: Installing “Lineage for microG”

* OS install
	* power off
	* boot into lineage recovery (vol-down + power) (currently slot "b" is active)
	* "apply update" > "apply from adb" (aka sideload)
	* `adb sideload lineage-18.1-20211220-microG-lemonadep.zip`
		* it seems this is flashed to slot a and then slot is automatically swapped
	* ignore signature warning
	* accept downgrade warning
	* completed
	* back back
	* factory reset
	* reboot
	* drops to bootloader thing
	* "start" (power button to accept)
	* loops back to bootloader thing. damn.
	* vol down vol down - Recovery - power button to accept
	* starts lineage recovery - "Active slot: a" - hmmm


try swap slot
```
$ fastboot set_active other
Setting current slot to 'b'                        (bootloader) Changing the active slot with a snapshot applied may cancel the update.
OKAY [  0.038s]
Finished. Total time: 0.040s
```

power off, power on

that worked, now enters the lineage setup steps

oh but it's back to the blank OS, the apr 2022 version!.

guess there's a slot for two OSes!

swap slot again, back to the bootloader loop. interesting.

let's try installing again

```
fastboot set_active other
Setting current slot to 'a'                        OKAY [  0.060s]
Finished. Total time: 0.061s
```

```
tim@max:~/Downloads/oneplus9pro/lineage-for-microG      
$ adb sideload lineage-18.1-20211220-microG-lemonadep.zip                                                                     
serving: 'lineage-18.1-20211220-microG-lemonadep.zip'  (~21%)
```

factory reset

reboot

cross fingers. nope. still just drops back to bootloader

recovery > factory reset > reboot

nope still fooked
reboot to bootloader which says "Active slot: b" which is a bit odd. Maybe it does a swap slot automatically after flashing?

so at this point slot a has a fooked lineage-microG (maybe) and slot b has a functioning but blank vanilla lineage. I think.

<https://www.reddit.com/r/GooglePixel/comments/8cz6m9/google_pixel_bootslot_b_brick/>

grab the vars with `fastboot getvar all 2>&1 | sort > fastboot-getvar.txt`

output (sensitive things redacted with XXXX) - interesting but not super helpful:

```
all: 
(bootloader) battery-voltage:0
(bootloader) cpu-abi:arm64-v8a
(bootloader) current-slot:b
(bootloader) dynamic-partition:true
(bootloader) first-api-level:30
(bootloader) has-slot:abl_log:no
(bootloader) has-slot:abl:yes
(bootloader) has-slot:ALIGN_TO_128K_1:no
(bootloader) has-slot:ALIGN_TO_128K_2:no
(bootloader) has-slot:android_log:no
(bootloader) has-slot:aop:yes
(bootloader) has-slot:apdp_full:no
(bootloader) has-slot:apdp:no
(bootloader) has-slot:bluetooth:yes
(bootloader) has-slot:boot:yes
(bootloader) has-slot:carrier:no
(bootloader) has-slot:cdt:no
(bootloader) has-slot:connsec:no
(bootloader) has-slot:cpucp:yes
(bootloader) has-slot:ddr:no
(bootloader) has-slot:devcfg:yes
(bootloader) has-slot:devinfo:no
(bootloader) has-slot:dinfo:no
(bootloader) has-slot:dip:no
(bootloader) has-slot:DRIVER:no
(bootloader) has-slot:dsp:yes
(bootloader) has-slot:dtbo:yes
(bootloader) has-slot:engineering_cdt:yes
(bootloader) has-slot:featenabler:yes
(bootloader) has-slot:frp:no
(bootloader) has-slot:fsc:no
(bootloader) has-slot:fsg:no
(bootloader) has-slot:hyp_log:no
(bootloader) has-slot:hyp:yes
(bootloader) has-slot:imagefv:yes
(bootloader) has-slot:kernel_log:no
(bootloader) has-slot:keymaster:yes
(bootloader) has-slot:keystore:no
(bootloader) has-slot:limits-cdsp:no
(bootloader) has-slot:limits:no
(bootloader) has-slot:logdump:no
(bootloader) has-slot:logfs:no
(bootloader) has-slot:mdcompress:no
(bootloader) has-slot:mdtpsecapp:yes
(bootloader) has-slot:mdtp:yes
(bootloader) has-slot:metadata:no
(bootloader) has-slot:misc:no
(bootloader) has-slot:modemdump:no
(bootloader) has-slot:modemst1:no
(bootloader) has-slot:modemst2:no
(bootloader) has-slot:modem:yes
(bootloader) has-slot:multiimgoem:yes
(bootloader) has-slot:ocdt:no
(bootloader) has-slot:odm_b-cow:no
(bootloader) has-slot:odm:yes
(bootloader) has-slot:oplusdycnvbk:no
(bootloader) has-slot:opluslog:no
(bootloader) has-slot:oplusreserve1:no
(bootloader) has-slot:oplusreserve2:no
(bootloader) has-slot:oplusreserve3:no
(bootloader) has-slot:oplusreserve4:no
(bootloader) has-slot:oplusreserve5:no
(bootloader) has-slot:oplus_sec:yes
(bootloader) has-slot:oplusstanvbk:yes
(bootloader) has-slot:param:no
(bootloader) has-slot:persist_bkp:no
(bootloader) has-slot:persist:no
(bootloader) has-slot:product_b-cow:no
(bootloader) has-slot:product:yes
(bootloader) has-slot:qmcs:no
(bootloader) has-slot:qsee_log:no
(bootloader) has-slot:qupfw:yes
(bootloader) has-slot:qweslicstore:yes
(bootloader) has-slot:rawdump:no
(bootloader) has-slot:rtice:no
(bootloader) has-slot:sda:no
(bootloader) has-slot:sdb:no
(bootloader) has-slot:sdc:no
(bootloader) has-slot:sdd:no
(bootloader) has-slot:sde:no
(bootloader) has-slot:sdf:no
(bootloader) has-slot:secdata:no
(bootloader) has-slot:shrm:yes
(bootloader) has-slot:splash:yes
(bootloader) has-slot:spunvm:no
(bootloader) has-slot:ssd:no
(bootloader) has-slot:storsec:no
(bootloader) has-slot:super:no
(bootloader) has-slot:system_b-cow:no
(bootloader) has-slot:system_ext_b-cow:no
(bootloader) has-slot:system_ext:yes
(bootloader) has-slot:system:yes
(bootloader) has-slot:tzsc:no
(bootloader) has-slot:tz:yes
(bootloader) has-slot:uefisecapp:yes
(bootloader) has-slot:uefivarstore:no
(bootloader) has-slot:userdata:no
(bootloader) has-slot:vbmeta_system:yes
(bootloader) has-slot:vbmeta_vendor:yes
(bootloader) has-slot:vbmeta:yes
(bootloader) has-slot:vendor_b-cow:no
(bootloader) has-slot:vendor_boot:yes
(bootloader) has-slot:vendor:yes
(bootloader) has-slot:vm-bootsys:yes
(bootloader) has-slot:vm-data:no
(bootloader) has-slot:xbl_config:yes
(bootloader) has-slot:xbl:yes
(bootloader) hw-revision:0
(bootloader) is-logical:abl_a:no
(bootloader) is-logical:abl_b:no
(bootloader) is-logical:abl_log:no
(bootloader) is-logical:ALIGN_TO_128K_1:no
(bootloader) is-logical:ALIGN_TO_128K_2:no
(bootloader) is-logical:android_log:no
(bootloader) is-logical:aop_a:no
(bootloader) is-logical:aop_b:no
(bootloader) is-logical:apdp_full:no
(bootloader) is-logical:apdp:no
(bootloader) is-logical:bluetooth_a:no
(bootloader) is-logical:bluetooth_b:no
(bootloader) is-logical:boot_a:no
(bootloader) is-logical:boot_b:no
(bootloader) is-logical:carrier:no
(bootloader) is-logical:cdt:no
(bootloader) is-logical:connsec:no
(bootloader) is-logical:cpucp_a:no
(bootloader) is-logical:cpucp_b:no
(bootloader) is-logical:ddr:no
(bootloader) is-logical:devcfg_a:no
(bootloader) is-logical:devcfg_b:no
(bootloader) is-logical:devinfo:no
(bootloader) is-logical:dinfo:no
(bootloader) is-logical:dip:no
(bootloader) is-logical:DRIVER:no
(bootloader) is-logical:dsp_a:no
(bootloader) is-logical:dsp_b:no
(bootloader) is-logical:dtbo_a:no
(bootloader) is-logical:dtbo_b:no
(bootloader) is-logical:engineering_cdt_a:no
(bootloader) is-logical:engineering_cdt_b:no
(bootloader) is-logical:featenabler_a:no
(bootloader) is-logical:featenabler_b:no
(bootloader) is-logical:frp:no
(bootloader) is-logical:fsc:no
(bootloader) is-logical:fsg:no
(bootloader) is-logical:hyp_a:no
(bootloader) is-logical:hyp_b:no
(bootloader) is-logical:hyp_log:no
(bootloader) is-logical:imagefv_a:no
(bootloader) is-logical:imagefv_b:no
(bootloader) is-logical:kernel_log:no
(bootloader) is-logical:keymaster_a:no
(bootloader) is-logical:keymaster_b:no
(bootloader) is-logical:keystore:no
(bootloader) is-logical:limits-cdsp:no
(bootloader) is-logical:limits:no
(bootloader) is-logical:logdump:no
(bootloader) is-logical:logfs:no
(bootloader) is-logical:mdcompress:no
(bootloader) is-logical:mdtp_a:no
(bootloader) is-logical:mdtp_b:no
(bootloader) is-logical:mdtpsecapp_a:no
(bootloader) is-logical:mdtpsecapp_b:no
(bootloader) is-logical:metadata:no
(bootloader) is-logical:misc:no
(bootloader) is-logical:modem_a:no
(bootloader) is-logical:modem_b:no
(bootloader) is-logical:modemdump:no
(bootloader) is-logical:modemst1:no
(bootloader) is-logical:modemst2:no
(bootloader) is-logical:multiimgoem_a:no
(bootloader) is-logical:multiimgoem_b:no
(bootloader) is-logical:ocdt:no
(bootloader) is-logical:odm_b-cow:yes
(bootloader) is-logical:odm_b:yes
(bootloader) is-logical:oplusdycnvbk:no
(bootloader) is-logical:opluslog:no
(bootloader) is-logical:oplusreserve1:no
(bootloader) is-logical:oplusreserve2:no
(bootloader) is-logical:oplusreserve3:no
(bootloader) is-logical:oplusreserve4:no
(bootloader) is-logical:oplusreserve5:no
(bootloader) is-logical:oplus_sec_a:no
(bootloader) is-logical:oplus_sec_b:no
(bootloader) is-logical:oplusstanvbk_a:no
(bootloader) is-logical:oplusstanvbk_b:no
(bootloader) is-logical:param:no
(bootloader) is-logical:persist_bkp:no
(bootloader) is-logical:persist:no
(bootloader) is-logical:product_b-cow:yes
(bootloader) is-logical:product_b:yes
(bootloader) is-logical:qmcs:no
(bootloader) is-logical:qsee_log:no
(bootloader) is-logical:qupfw_a:no
(bootloader) is-logical:qupfw_b:no
(bootloader) is-logical:qweslicstore_a:no
(bootloader) is-logical:qweslicstore_b:no
(bootloader) is-logical:rawdump:no
(bootloader) is-logical:rtice:no
(bootloader) is-logical:sda:no
(bootloader) is-logical:sdb:no
(bootloader) is-logical:sdc:no
(bootloader) is-logical:sdd:no
(bootloader) is-logical:sde:no
(bootloader) is-logical:sdf:no
(bootloader) is-logical:secdata:no
(bootloader) is-logical:shrm_a:no
(bootloader) is-logical:shrm_b:no
(bootloader) is-logical:splash_a:no
(bootloader) is-logical:splash_b:no
(bootloader) is-logical:spunvm:no
(bootloader) is-logical:ssd:no
(bootloader) is-logical:storsec:no
(bootloader) is-logical:super:no
(bootloader) is-logical:system_b-cow:yes
(bootloader) is-logical:system_b:yes
(bootloader) is-logical:system_ext_b-cow:yes
(bootloader) is-logical:system_ext_b:yes
(bootloader) is-logical:tz_a:no
(bootloader) is-logical:tz_b:no
(bootloader) is-logical:tzsc:no
(bootloader) is-logical:uefisecapp_a:no
(bootloader) is-logical:uefisecapp_b:no
(bootloader) is-logical:uefivarstore:no
(bootloader) is-logical:userdata:no
(bootloader) is-logical:vbmeta_a:no
(bootloader) is-logical:vbmeta_b:no
(bootloader) is-logical:vbmeta_system_a:no
(bootloader) is-logical:vbmeta_system_b:no
(bootloader) is-logical:vbmeta_vendor_a:no
(bootloader) is-logical:vbmeta_vendor_b:no
(bootloader) is-logical:vendor_b-cow:yes
(bootloader) is-logical:vendor_boot_a:no
(bootloader) is-logical:vendor_boot_b:no
(bootloader) is-logical:vendor_b:yes
(bootloader) is-logical:vm-bootsys_a:no
(bootloader) is-logical:vm-bootsys_b:no
(bootloader) is-logical:vm-data:no
(bootloader) is-logical:xbl_a:no
(bootloader) is-logical:xbl_b:no
(bootloader) is-logical:xbl_config_a:no
(bootloader) is-logical:xbl_config_b:no
(bootloader) is-userspace:yes
(bootloader) max-download-size:0x10000000
(bootloader) partition-size:abl_a:0x800000
(bootloader) partition-size:abl_b:0x800000
(bootloader) partition-size:abl_log:0xFD0000
(bootloader) partition-size:ALIGN_TO_128K_1:0x1A000
(bootloader) partition-size:ALIGN_TO_128K_2:0x1A000
(bootloader) partition-size:android_log:0xFD0000
(bootloader) partition-size:aop_a:0x80000
(bootloader) partition-size:aop_b:0x80000
(bootloader) partition-size:apdp:0x40000
(bootloader) partition-size:apdp_full:0x40000
(bootloader) partition-size:bluetooth_a:0x200000
(bootloader) partition-size:bluetooth_b:0x200000
(bootloader) partition-size:boot_a:0xC000000
(bootloader) partition-size:boot_b:0xC000000
(bootloader) partition-size:carrier:0x4000000
(bootloader) partition-size:cdt:0x20000
(bootloader) partition-size:connsec:0x20000
(bootloader) partition-size:cpucp_a:0x100000
(bootloader) partition-size:cpucp_b:0x100000
(bootloader) partition-size:ddr:0x100000
(bootloader) partition-size:devcfg_a:0x20000
(bootloader) partition-size:devcfg_b:0x20000
(bootloader) partition-size:devinfo:0x1000
(bootloader) partition-size:dinfo:0x4000
(bootloader) partition-size:dip:0x100000
(bootloader) partition-size:DRIVER:0x2000000
(bootloader) partition-size:dsp_a:0x4000000
(bootloader) partition-size:dsp_b:0x4000000
(bootloader) partition-size:dtbo_a:0x1800000
(bootloader) partition-size:dtbo_b:0x1800000
(bootloader) partition-size:engineering_cdt_a:0x100000
(bootloader) partition-size:engineering_cdt_b:0x100000
(bootloader) partition-size:featenabler_a:0x20000
(bootloader) partition-size:featenabler_b:0x20000
(bootloader) partition-size:frp:0x80000
(bootloader) partition-size:fsc:0x20000
(bootloader) partition-size:fsg:0x300000
(bootloader) partition-size:hyp_a:0x800000
(bootloader) partition-size:hyp_b:0x800000
(bootloader) partition-size:hyp_log:0xFD0000
(bootloader) partition-size:imagefv_a:0x200000
(bootloader) partition-size:imagefv_b:0x200000
(bootloader) partition-size:kernel_log:0xFD0000
(bootloader) partition-size:keymaster_a:0x80000
(bootloader) partition-size:keymaster_b:0x80000
(bootloader) partition-size:keystore:0x80000
(bootloader) partition-size:limits:0x1000
(bootloader) partition-size:limits-cdsp:0x1000
(bootloader) partition-size:logdump:0x4000000
(bootloader) partition-size:logfs:0x800000
(bootloader) partition-size:mdcompress:0x1400000
(bootloader) partition-size:mdtp_a:0x2000000
(bootloader) partition-size:mdtp_b:0x2000000
(bootloader) partition-size:mdtpsecapp_a:0x400000
(bootloader) partition-size:mdtpsecapp_b:0x400000
(bootloader) partition-size:metadata:0x1000000
(bootloader) partition-size:misc:0x100000
(bootloader) partition-size:modem_a:0x14A00000
(bootloader) partition-size:modem_b:0x14A00000
(bootloader) partition-size:modemdump:0x12C00000
(bootloader) partition-size:modemst1:0x300000
(bootloader) partition-size:modemst2:0x300000
(bootloader) partition-size:multiimgoem_a:0x8000
(bootloader) partition-size:multiimgoem_b:0x8000
(bootloader) partition-size:ocdt:0x20000
(bootloader) partition-size:odm_b:0x2BD000
(bootloader) partition-size:odm_b-cow:0x2C1000
(bootloader) partition-size:oplusdycnvbk:0xA00000
(bootloader) partition-size:opluslog:0x10000000
(bootloader) partition-size:oplusreserve1:0x800000
(bootloader) partition-size:oplusreserve2:0x10000000
(bootloader) partition-size:oplusreserve3:0x4000000
(bootloader) partition-size:oplusreserve4:0x2000000
(bootloader) partition-size:oplusreserve5:0x4000000
(bootloader) partition-size:oplus_sec_a:0xA00000
(bootloader) partition-size:oplus_sec_b:0xA00000
(bootloader) partition-size:oplusstanvbk_a:0xA00000
(bootloader) partition-size:oplusstanvbk_b:0xA00000
(bootloader) partition-size:param:0x800000
(bootloader) partition-size:persist:0x2000000
(bootloader) partition-size:persist_bkp:0x2000000
(bootloader) partition-size:product_b:0x1652F000
(bootloader) partition-size:product_b-cow:0x16696000
(bootloader) partition-size:qmcs:0x1E00000
(bootloader) partition-size:qsee_log:0xFD0000
(bootloader) partition-size:qupfw_a:0x14000
(bootloader) partition-size:qupfw_b:0x14000
(bootloader) partition-size:qweslicstore_a:0x40000
(bootloader) partition-size:qweslicstore_b:0x40000
(bootloader) partition-size:rawdump:0x8000000
(bootloader) partition-size:rtice:0x80000
(bootloader) partition-size:sda:0x3A10800000
(bootloader) partition-size:sdb:0x800000
(bootloader) partition-size:sdc:0x800000
(bootloader) partition-size:sdd:0x2000000
(bootloader) partition-size:sde:0x180000000
(bootloader) partition-size:sdf:0x2000000
(bootloader) partition-size:secdata:0x7000
(bootloader) partition-size:shrm_a:0x20000
(bootloader) partition-size:shrm_b:0x20000
(bootloader) partition-size:splash_a:0x20A4000
(bootloader) partition-size:splash_b:0x20A4000
(bootloader) partition-size:spunvm:0x2000000
(bootloader) partition-size:ssd:0x2000
(bootloader) partition-size:storsec:0x20000
(bootloader) partition-size:super:0x29B000000
(bootloader) partition-size:system_b:0x406A4000
(bootloader) partition-size:system_b-cow:0x40AAC000
(bootloader) partition-size:system_ext_b:0xDF3A000
(bootloader) partition-size:system_ext_b-cow:0xE01B000
(bootloader) partition-size:tz_a:0x400000
(bootloader) partition-size:tz_b:0x400000
(bootloader) partition-size:tzsc:0x20000
(bootloader) partition-size:uefisecapp_a:0x200000
(bootloader) partition-size:uefisecapp_b:0x200000
(bootloader) partition-size:uefivarstore:0x80000
(bootloader) partition-size:userdata:0x3751FB3000
(bootloader) partition-size:vbmeta_a:0x10000
(bootloader) partition-size:vbmeta_b:0x10000
(bootloader) partition-size:vbmeta_system_a:0x10000
(bootloader) partition-size:vbmeta_system_b:0x10000
(bootloader) partition-size:vbmeta_vendor_a:0x10000
(bootloader) partition-size:vbmeta_vendor_b:0x10000
(bootloader) partition-size:vendor_b:0x50520000
(bootloader) partition-size:vendor_b-cow:0x50A27000
(bootloader) partition-size:vendor_boot_a:0xC000000
(bootloader) partition-size:vendor_boot_b:0xC000000
(bootloader) partition-size:vm-bootsys_a:0x10625000
(bootloader) partition-size:vm-bootsys_b:0x10625000
(bootloader) partition-size:vm-data:0x20A4000
(bootloader) partition-size:xbl_a:0x600000
(bootloader) partition-size:xbl_b:0x600000
(bootloader) partition-size:xbl_config_a:0x80000
(bootloader) partition-size:xbl_config_b:0x80000
(bootloader) product:OnePlus9Pro
(bootloader) secure:yes
(bootloader) security-patch-level:2021-12-05
(bootloader) serialno:XXXXXXX
(bootloader) slot-count:2
(bootloader) snapshot-update-status:snapshotted
(bootloader) super-partition-name:super
(bootloader) system-fingerprint:OnePlus/OnePlus9Pro_EEA/OnePlus9Pro:11/RKQ1.201105.002/2111112053:user/release-keys
(bootloader) treble-enabled:true
(bootloader) unlocked:yes
(bootloader) vendor-fingerprint:OnePlus/OnePlus9Pro_EEA/OnePlus9Pro:11/RKQ1.201105.002/2111112053:user/release-keys
(bootloader) version:0.4
(bootloader) version-baseband:
(bootloader) version-bootloader:unknown
(bootloader) version-os:11
(bootloader) version-vndk:30
Finished. Total time: 1.181s
```

Fuck. Again. ... TBC. AGAIN. how many more yaks are left to shave one wonders.

todo:

* skip all the guided setup steps
* open the microG app
* run the self check
* magisk root if needed
* everything else

### config

* settings
	* sound
	* advanced
	  * screen locking sound - off
	  * touch sounds - off
	* system
	* advanced
	  * gestures
		* power menu
		  * advanced restart - on

### Lineage+microG+Magisk again - success!

Let's try downloading the latest and flashing again.

<https://download.lineage.microg.org/lemonadep/?sort=time&order=asc>

```
tim@max:~/Downloads/oneplus9pro/lineage-for-microG
$ ll lineage-18.1-2022040*
-rw-rw-r-- 1 tim tim 192M Apr 30 20:38 lineage-18.1-20220401-microG-lemonadep-recovery.img
-rw-rw-r-- 1 tim tim 1.1G Apr 30 20:39 lineage-18.1-20220405-microG-lemonadep.zip
-rw-rw-r-- 1 tim tim 3.9K Apr 30 20:37 lineage-18.1-20220405-microG-lemonadep.zip.prop
-rw-rw-r-- 1 tim tim  109 Apr 30 20:37 lineage-18.1-20220405-microG-lemonadep.zip.sha256sum
$ sha256sum -c lineage-18.1-20220405-microG-lemonadep.zip.sha256sum
lineage-18.1-20220405-microG-lemonadep.zip: OK
tim@max:~/Downloads/oneplus9pro/lineage-for-microG
$ cd update_verifier-master 
tim@max:~/Downloads/oneplus9pro/lineage-for-microG/update_verifier-master
$ python update_verifier.py lineageos4microg_pubkey ../lineage-18.1-20220405-microG-lemonadep.zip     
verified successfully
```

We'll do a swap slot again so that it won't overwrite the currently working lineage install.

Vol-down + power button to enter recovery (from powered off).

Lineage recovery says "Active slot: b" at the top. Let's boot it, check what we have, swap, boot again to see the other...

* slot b: broken install - drops to bootloader
* slot a: also broken ...., erm I swear I booted that. wtf. phones.

so that means I should swap slot so that "a" is active, so that fastboot flashes over the broken "b" and then swaps to it without touching the currently working "a" slot.

Use lineage bootloader to format the system just to see if that fixes the broken install. .... Nope. Both slots still fubar.

Right, well, flashing time either way.

put phone into recover "update > apply from adb" mode

`adb sideload lineage-18.1-20220405-microG-lemonadep.zip`

long pause...

back > reboot system

hurrah, a lineage boot animation

rattle through setup steps again, did wifi, nothing else

todo: fingerprint and pin

todo: re-root with magisk before doing anything else

new things compared to plain lineage: f-droid & microG apps

installed andOTP & vespucci (OSM editor) from f-droid

---

enable developer options (system > about phone, tap lots of times)

system > advanced > developer options > usb debugging ON  + Disable adb authorisation timeout (so that if my screen fails or the software misbehaves I can get my files over a usb cable)

Install Magisk by John Wu via F-Droid instead of adb this time

Extract the updated payload:

```
tim@max:~/Downloads/oneplus9pro/lineage-for-microG
$ cd payload 
tim@max:~/Downloads/oneplus9pro/lineage-for-microG/payload
$ ../../payload-dumper-go/payload-dumper-go_1.2.0_linux_amd64/payload-dumper-go ../lineage-18.1-20220405-microG-lemonadep.zip
Please wait while extracting payload.bin from the archive.
payload.bin: /tmp/payload_208101762.bin
Payload Version: 2
Payload Manifest Length: 94295
Payload Manifest Signature Length: 267
Found partitions:
boot (201 MB), dtbo (25 MB), odm (2.9 MB), product (378 MB), system (1.1 GB), system_ext (234 MB), vbmeta (8.2 kB), vbmeta_system (4.1 kB), vendor (1.3 GB), vendor_boot (201 MB)
Number of workers: 4
odm (2.9 MB)            [==============================================================================================] 100 %
boot (201 MB)           [==============================================================================================] 100 %
dtbo (25 MB)            [==============================================================================================] 100 %
product (378 MB)        [==============================================================================================] 100 %
system (1.1 GB)         [==============================================================================================] 100 %
system_ext (234 MB)     [==============================================================================================] 100 %
vbmeta (8.2 kB)         [==============================================================================================] 100 %
vbmeta_system (4.1 kB)  [==============================================================================================] 100 %
vendor (1.3 GB)         [==============================================================================================] 100 %
vendor_boot (201 MB)    [==============================================================================================] 100 %
tim@max:~/Downloads/oneplus9pro/lineage-for-microG/payload
$ ll
total 4.0K
drwxr-xr-x 2 tim tim 4.0K Apr 30 21:34 extracted_20220430_213414
tim@max:~/Downloads/oneplus9pro/lineage-for-microG/payload
$ ll extracted_20220430_213414 
total 3.3G
-rwxr-xr-x 1 tim tim 192M Apr 30 21:34 boot.img
-rwxr-xr-x 1 tim tim  24M Apr 30 21:34 dtbo.img
-rwxr-xr-x 1 tim tim 2.8M Apr 30 21:34 odm.img
-rwxr-xr-x 1 tim tim 361M Apr 30 21:34 product.img
-rwxr-xr-x 1 tim tim 224M Apr 30 21:34 system_ext.img
-rwxr-xr-x 1 tim tim 1.1G Apr 30 21:34 system.img
-rwxr-xr-x 1 tim tim 8.0K Apr 30 21:34 vbmeta.img
-rwxr-xr-x 1 tim tim 4.0K Apr 30 21:34 vbmeta_system.img
-rwxr-xr-x 1 tim tim 192M Apr 30 21:34 vendor_boot.img
-rwxr-xr-x 1 tim tim 1.3G Apr 30 21:35 vendor.img
```

send to phone:
```
tim@max:~/Downloads/oneplus9pro/lineage-for-microG/payload
$ adb push extracted_20220430_213414/boot.img /sdcard/Download/
extracted_20220430_213414/boot.img: 1 file pushed, 0 skipped. 192.7 MB/s (201326592 bytes in 0.996s)
```

run the patch in the phone Magisk UI (under “install”)

get the patched file back:

```
im@max:~/Downloads/oneplus9pro/lineage-for-microG/payload
$ patched=`adb shell ls /sdcard/Download/magisk_patched*`
tim@max:~/Downloads/oneplus9pro/lineage-for-microG/payload
$ adb pull $patched
/sdcard/Download/magisk_patched-24300_v4xhs.img: 1 file pulled, 0 skipped. 34.7 MB/s (201326592 bytes in 5.532s)
```

turn on advanced reboot again in settings

reboot to fastboot

```
tim@max:~/Downloads/oneplus9pro/lineage-for-microG/payload
$ fastboot flash boot magisk_patched-24300_v4xhs.img 
Sending 'boot_a' (196608 KB)                       OKAY [  6.597s]
Writing 'boot_a'                                   OKAY [  0.611s]
Finished. Total time: 7.387s
```

"reboot now"

success. open up magisk, shows as installed (v24.3)


## F-Droid app list

### Turn On Install history

Before starting installations do this so that we (might) have an exportable record to share.

Turn on install history before starting so that we can export at the end - <https://gitlab.com/fdroid/fdroidclient/-/issues/70#note_89110104>

Settings > Expert mode > Keep install history

### Export list when done

Settings > Install history and metrics > Share (share icon with 3 linked dots at top) > fail, no apps that know what to do with the file installed yet. gah.

### Google contacts, calendar & gmail - fail

via aurora

Install contacts...

- Sign in
- Goes to microG
- Then to official google sign in
- Sign in succeeds
- Acc now listed in settings > accounts
- google contacts still shows no accounts & no contacts. Damn
- tap acc, tap any of the settings (all go to same place) turn on "Allow apps to find contacts"
- now google contacts shows the account, but still doesn't sync.

Hrmm. Need this or equivalent obviously. Switching will be non trivial.

Same problem for gmail.

Calendar app works and has all events, desktop widget broken (shows no events)

#### Research

##### Alternatives

* <https://alternativeto.net/software/google-contacts/>
* <https://www.reddit.com/r/LineageOS/comments/7wnwpe/alternative_to_google_calender_or_contacts_sync/>
* <https://www.reddit.com/r/LineageOS/comments/8qv3p3/alternative_services_to_google_calendar_and/>
* <https://www.reddit.com/r/LineageOS/comments/pt5ce7/are_the_contacts_and_telephone_apps_built_by/>
	* <https://f-droid.org/en/packages/com.simplemobiletools.contacts.pro/>
* <https://f-droid.org/en/packages/com.simplemobiletools.contacts.pro/>

##### Making it work

* <https://github.com/microg/GmsCore/issues/585>
* <https://github.com/tomwiggers/Magisk-ConCal-Sync-MicroG>
	* [download Magisk-ConCal-Sync-MicroG repo zip](https://github.com/tomwiggers/Magisk-ConCal-Sync-MicroG/archive/refs/heads/master.zip)
	* extract, go into inner folder and zip up the four items
	* copy to phone with syncthing
	* magisk > modules > install from storage > select the zip > done
	* reboot phone
	* boot loop. FUUUUUUUUCK
	* reported issue for what it's worth, including `logcat` logs: <https://github.com/tomwiggers/Magisk-ConCal-Sync-MicroG/issues/3>
	* remove modules
		* <https://www.thecustomdroid.com/uninstall-magisk-modules-in-twrp-recovery-guide/>
		* connect phone usb
		* run `adb wait-for-device shell magisk --remove-modules` on laptop
		* boot up phone normally
		* phone booted into lock screen, phew!

#### Calendar

bearable, widget broken but app itself works and syncs

have to manually turn on sync for additional calendars

#### Contacts

Need alternative, perhaps fastmail

* Let's try fastmail's contacts...
	* [google contacts web app](https://contacts.google.com/) > export from google contacts > vCard
	* [fastmail web app > dropdown thing > settings](https://www.fastmail.com/settings/setup/importexport) > import > contacts > upload addressbook file > choose the vcf
		* imported all but two, showed me the errors, not ones I care about.
	* check fastmail phone app, contacts come flooding in.
	* but no sign of them in the main phone contacts app. damn.
* <https://www.reddit.com/r/fastmail/comments/f2akqj/dealing_with_contacts/>

I've messaged fastmail support to ask them why they have a completely separate contact section in the fastmail app rather than using the shared contacts store in Android/LineageOS.

Because I'm short of good options I will reluctantly try the DAVx app that everyone points to. I really don't want yet another sync involved in the whole thing but I also don't want to run and maintain a NextCloud install (which lots of people suggest).

* Installing DAVx5
	* It's listed in Aurora (the play store proxy) and shows "£4.29" instead of the usual "Install".
	* Pressed money button to see what happens > error "Download failed, app not purchased". Cool.
	* Go to [DAVx5 on play store](https://play.google.com/store/apps/details?id=at.bitfire.davdroid) and make the purchase
		* concerningly for the future the play store pops an "install to blah device", which is fine now because it knows about my *old* phone, but what if I didn't have the old phone some time, does that mean I could no longer get paid apps and install them with Aurora?
	* Back on the new phone Aurora install now works. Win.
* Setting up DAVx5
	* rattled through default wizard without changing (or understanding) anything
	* interesting warning about oneplus blocking sync that points to <https://www.davx5.com/faq/synchronization-is-not-run-as-expected>
	* Create app password in fastmail web interface for DAVx
	* Login to DAVx app with email + app-password ... fail, presumably because it's a custom domain
	* Use custom base url option - <https://www.davx5.com/tested-with/fastmail>
		* Base url: `https://carddav.fastmail.com` + email + app-password .... success
		* Create account: account name? (defaults to tim@timwise.co.uk) - "Use your email address as account name because Android will use the account name as ORGANIZER field for events you create. You can't have two accounts with the same name." - probably fine, left default
		* Contact group method:
			* "Groups are separate vCards" - default, left as this
			* "Groups are per-contact categories"
	* Next
	* No contacts sync (missing permissions) > Permissions > All of the below to "on" > grant dialogs
	* Shows two unchecked checkboxes, but don't know what they mean
		* "Global Address Book"
		* "personal"
  	* Trying out ticking "personal", tick it and press orange sync now button
	* woo, main contacts app now full of contacts. sim switch time!!!

#### GMail

todo, probably set up imap and use k9mail + web interface on laptop

### F-Droid app list

* Vespucci (open-streetmap (OSM) editor)
* andOTP (one time password generator with backup/restore capability)
* Aurora play store proxy - configure as per above section
* Syncthing
* OAndBackupX - to replace proprietary (but very good) titanium backup
	* Needs root, provided by Magisk. Without root no apps can access the data of other apps. This is the primary reason that root is so important to me. I want a backup system that I can actually trust because it's not some proprietary cloud magic pixie dust, it's instead a straight-forward grab-the-files-and-put-them-somewhere-safe operation that I can inspect and get to without more proprietary black magic.
* [KeepassDX](https://www.keepassdx.com/) - <https://github.com/Kunzisoft/KeePassDX>
* k9mail
* vlc
* markor
* antennapod - todo restore state
* qr & barcode scanner
* aTimeLogger
* [Editor](https://f-droid.org/en/packages/org.billthefarmer.editor/) (replacement for droidedit?)
* [GPSLogger](https://f-droid.org/en/packages/com.mendhak.gpslogger/)

### todo - more apps (f-droid where possible)

* VLC
* AntennaPod
* Audible
* Maverick (for recording and viewing gps traces, could do with a replacement, the map tiles seem to have died and it's getting buggy)
* google home (for chromecast & google mini integration)
* RainAlarm (paid for ad-free)
* Google calendar (or find a non-google replacement)
* Google contacts (or find a non-google replacement)
* Waze
* Google maps (for satnav, route planning and finding local businesses)
* LinkedIn
* Twitter
* Telegram FOSS (a slightly free-er version of telegram)
* ...

### Other f-droid app suggestions

* <https://www.reddit.com/r/fdroid/comments/lzzdbg/a_list_of_some_fdroid_apps_i_installed_to_get_you/>

## Play store app list (via Aurora)

Only things not available in f-droid

* maps.me
* Spotify
* Audible
* Firefox
* google maps - works flawlessly!
* signal messemger
	* surprisingly not in f-droid!
	* can't be on multiple phones at once, can only "transfer". Grumble.
* banking apps (2/3 work)
* sunsama
* trello
* slack
* rain alarm - todo restore paid version
* zoom
* bulb energy
* YNAB
* Ring (doorbell)
* Google home
* Life360 (shared gps locations for family, saves a bunch of "have you left yet?" text messages)
* Fastmail - not for the mail, prefer k9mail, but to see if it can do contacts as well as goooooooogle
* DroidEdit
* Ringo
* National rail
* Goodreads
* Pluralsight
* LinkedIn
* FreeAgent
* BBC
    * Weather
    * Sounds
    * iPlayer
* Amazon Shopping
* Amazon Prime
* YouTube
* Microsoft authenticator
* Google authenticator
* Bandcamp
* [Offline English Dictionary by Livio](https://play.google.com/store/apps/details?id=livio.pack.lang.en_US)
* Strava

## Built-in apps

### Camera - configure

* Hamburger
	* GPS > on
	* Touch focus duration > infinite (man that has always annoyed me! Default 3 seconds, why?!)
	* shutter sound > disabled

### Browser - disable

Disable (using firefox instead)

### Messaging - disable

Messaging > long press > app info > disable

## Individual app setup

### Syncthing

* Open web gui
* Disable all non-LAN
* Remove default folder (Camera)
* Set device name
* Connect to existing machine(s).
* Add `/storage/emulated/0` folder (can't do this in non-web gui, stupid security warning. Nanny state of android.)
	* Warnings about failure to sync `Android/data` and `Android/obb`. Looks like they've tightened up security more, either that or syncthing has better warnings now. These folders will be exposed by OAndBackupX so I can safely ignore this until I sort out the ignore file for syncthing.

Oh no, syncthing can no longer access `/storage/emulated/0/Android/data` - <https://forum.syncthing.net/t/can-i-sync-send-only-data-from-android-data-in-android-11/17898>

Even more reason to have root and run a real and independent backup tool.

#### Syncthing ignore patterns

Set up ignores for caches and things that won't sync. Files for this are on github at <https://github.com/timabell/dotmatrix/tree/master/phone>

* Create file `phone.stignore` in the root of the sync'd sdcard folder. This one you can edit on the laptop as you find more things you don't want sync'd.
* Create file `phonetemplate.stignore` in the root folder and put only this line in it `#include phone.stignore`
* On the phone when they have sync'd copy the `phonetemplate.stignore` to a file named just `.stignore` in the root folder.

The reason for this dance is that syncthing won't sync the `.stignore` so to be able to edit the ignores on a different device you have to set up a link.

### AndOTP

* Set up password
* Turn off global timeout bar (distracting & stressful)
* Icons: small
* Layout: compact
* Copy backup from old phone with syncthing and restore it

### AntennaPod

Now I get to the crux of why I was so fucked off with Android.

I want to copy the *exact* state of antennapod to the new phone; but my old phone de-rooted itself and broke the backups; and you can't back up ~/data where everything lives without root because it's all locked down with per-app-user permissions, which is great for isolating apps from each other ... and you. The only option for those folders is in app sync (e.g.. sign in to trello/firefox/slack etc) so local state is throwaway, or backup to google drive .... to some magical fucking invisible folder so you can't even download the backups it made. This shit makes me so mad.

We already have working systems for backups and security and these fuckers have broken them and replaced them with their own vendor-locked-in proprietary black-box shite that doesn't even work all the time.

Because I'd lost root and usable backups it took me a while to work out how to transfer my latest beloved podcast player state to a new phone. I knew that you could import/export an OPML list of suscriptions but I really wanted to keep the play state of every episode so I caould easily scan the back-catalogues for episodes I'd never listened to dotted amongst the many thousands of episodes I have listned to. Well darm it there is a full export feature I didn't know about. It exports to the virtual sdcard storagea which is kinda like a home directory that you can actually access as a user. I already have the sdcard storage syncing to my other machines with syncthing so getting it from there onwards is a trivial copy-paste on the laptop.

Here's what a quick ~~google~~ [ddg](https://duckduckgo.com/) showed up:

* <https://github.com/AntennaPod/AntennaPod/issues/5391>
* <https://github.com/AntennaPod/AntennaPod/issues/5031>
* <https://github.com/AntennaPod/AntennaPod/issues/377>

Old phone:

* hamburger menu top left
* settings (cog at bottom) > storage > import/export > database export
* ensure syncthing is running and connected

Laptop:

* Copy file on laptop to new phone's sync folder

New phone:

* make sure symcthing is running, connected and up to date to pull new file in
* hamburger menu top left
* settings (cog at bottom) > storage > import/export > database import > Confirm
* select file
* press ok to restart Antennapod
* Woo! Queue entirely intact!

Downloads have to be re-done for the queue but the UI makes that dead easy, just hit play and it switches to a download button so you can whip through them quick.

### Bulb energy

* App downloaded
* Sign in by magic email link failed
* Sign in with password worked
* Statement download failed with "no apps can perform this action" but can always use website to get them. ... ah, no pdf reading apps installed, installing a random pdf app fixed that. Not a very clear error message that one!

### KeePassDX

Enable fingerprint unlock <https://github.com/Kunzisoft/KeePassDX/wiki/Advanced-Unlocking#b-link-database-credential-to-advanced-unlock-recognition=>

### NeoBackup

* Backup folder > neo-backup folder on emulated sdcard home > use this folder
* Allow access prompt > allow

"i" button top right > interesting note about types of android data and inability to restore apps using hardware key stores such as signal

* work out what apps to back up -- all of them, why guess what I'll need with so much storage available
* actual backups - done
* schedule backups - done, works great
* maybe automate clearing off phone onto laptop/server

* Set backup password

Set scheduled backup:

* 7 days
* 5am
* system apps + user apps
* apk + obb + data + device protected data
* all apps
* enabled
* Start now

### Firefox

3dots > settings > Search > duckduckgo

firefox was active for 6 hours which makes me think it isn't backgrounding properly, perhaps because of media or js on websites.

Firefox icon > long press > App info (i) > Advanced > Battery > Background restriction > Restrict

### Signal

Use transfer account to new phone feature
Enable chat backups to virtual SD: dots > settings > chat. > Chat backups. Set folder and create backup.

Signal popup saying detected issue with play services and establishing own connection. Now have permanent notification.

### GPSLogger

<https://f-droid.org/en/packages/com.mendhak.gpslogger/>

* hamburger
	* logging details
		* save to folder > give permissions > new folder (+) > `~/gpx`
		* New file creation > every time I start
	* performance
		* Logging interval > 5 secs

So that syncthing can see it. Defaults to inaccessible data folder. Fffffff

Also set to create new track every time.

## A thought on moving apps and data between phones

During the 1000th discussion of phones with my long-sufferring better-half I happened to utter a line that I think realy captures why this whole nonsense is (probably) worth the effort:

> "Living in the iOS ecosystem with their magical one-tap transfer from old phones to new phones that leave the new phone exactly in the same state as your old phone ... until you realize one day you want to leave the ecosystem, and you have to leave all your data behind in their walled garden." ~ Me

There are several ways of moving data between phones, which provide varying levels of protection against data loss disasters. Disasters that could be local (phone down loo), localized (all devices stolen from house), cloud based (cloud account hacked and wiped), a combination (cloud hacked and devices remote-wiped).

### Copying files directly

Something like syncthing.

Only works for data on virtual sdcard such as photos & downloads.

### Local backup/restore

With OAndBackup, NeoBackup, TitaniumBackup etc.

Needs root.

Can get app's private data out to storage you control.

Can also backup set of installed apps (`.apk`s) which it turns out is actually quite a time saver compared to clicking install in the app store 100+ times.

### Vendor-provided cloud backup

Completely walled-garden solution. No way to get your data off their cloud without restoring to another device they support (i.e. another Android/iOS device).

### 3rd party cloud backup

Something like dropbox.

It seems that the duopoly has deemed this unacceptable so have hobbled these apps fom working properly or at all. Dropbox on iOS has been reduced to a glorified photo backup which can't even run in the background.

Personally I think the fact that the duopoly is denying competition is anti-competitive practice the likes of which saw Microsoft get record fines from the EU back in the day. Hopefully the same will happen to Apple & Google to crack this open a bit, but until then we'll have to just shovel digital shit like this blog post to get out from under them.

## File transfer

Easy thanks to syncthing, just move the folders & files on the laptop from sync sdcard folder of the old phone to the one for the new phone. Win. 

## Trial TitaniumBackup restore - success

Before my old phone de-rooted itself thanks to a F****g OS update (grrrrr) I did have titanium set up, so I have somem rather stale backups from before then. Mostly as an experiment I've installed Titanium on the new phone to see if the restore works. This is the first time I've had two capable and still working phones at the same time to be able to experiment like this.

* Installed TitaniumBackup via Aurora.
* Installed Titanium's "key" app via Aurora.
* Titanium complained that Play store wasn't responding so couldn't check licence key. Fucksake. More lockin.
* Removed key app again.
* Copied one of the old backups across (google authenticator). (An app I had not yet installed on the new phone)
* Fired up titanium, hit restore for that app.
* Boom! There's the app installed, fired it up, worked no problems and now have an (outdated) list of OTPs that I don't use any more. Hollow victory achieved.

## Clock

* Settings
  * Time in seconds > on
  * Alarms
    * silence after > 5 mins
    * Snooze length > 15 minutes - I find that if I'm really too tired to move 15 mins makes a good power nap but isn't long enough to be disastrous
    * gradually increase
    * vol button to snooze

## Config

A complete list

Settings:

* Network and Internet
	*	Hotspot and Tethering
		* Wi-Fi Hotspot
			* On
			* AP Band
				* 5 GHz band preferred
		* Bluetooth tethering > On (to give the laptop internet out and about)
	* Connected Devices
		* Connection preferences
			* Bluetooth
				* Device name: foo
	* Wifi
		* Wifi preferences
			* Notify for public networks > off
* Apps and Notifications
	* Default apps
		* SMS app > Signal (actually a great integrated SMS app)
	* Notifications
		* Advanced
			* Do Not Disturb
				* People
					* Calls > "Contacts and repeat callers"
* Battery
	* Battery saver and performance
		* Automatic power saver - 15% (off by default oddly)
* Display
	* Dark theme
		* on
		* no schedule - (let's give this a try, we'll see what it's like in broad daylight)
		* pure black - on (better for battery and I think it looks cooler)
	* Night Light
		* Schedule
		* sunset till sunrise - this is an experiment, we'll see if it is sensible at it
	* Advanced (because this is extreem l33t haxxor stuff, beware n00bs)
		* Screen timeout - 5 mins (scary stuff I know, you were warned by the **advanced** thing, I hope you know what you're doing. The nanny phone-state will keep you safe, don't you worry your pretty little head about this section. Twunts.)
		* Styles and wallpapers - yes you read that right folks, wallpapers are an "Advanced" feature. What is wrong with this people?
		* push a couple of images across to ~/Pictures with syncthing and set them as home & lock screen
		* Lock screen
		* Add text on lock screen
			* `Owner Tim Abell <tim@timwise.co.uk>` (the idea is that people are generally good and this might be the best way to reach me if I've lost it)
		* Tap to sleep - off (I only ever do this by mistake)
		* Font size > Largest (I'm gettingn quite long-sighted)
* Sound
* Vibrate for calls - Always (also has a vibrate then ring which is a nice option)
* Advanced (why??????)
	* Phone ringtone - thriller three (there's a great selection & variety available, impressed with Lineage here. Also liked Solarium, Sheep (yes actual sheep), Rigel)
	* Default notification sound - Hojus (also liked Beryllium and Titan for minimal stress-inducing feel. Again a great selection available with some really fun sounds).
	* Default alarm sound - Piezo Alarm (for the retro kicks. Again more winners in here, well worth exploring)
	* Dial pad tones - off
	* Screen locking sound - off
	* Touch sounds - off
* Privacy
* Show passwords, display characters briefly as you type - off (I just find this annoying/distracting)
* Notifications on lock screen
	* Don't show notifications at all - this is more for a clear mind rather than privacy, though that's a bonus. I hate looking at my (locked) phone for the time and getting drawn into the notifications. Happened toooooo many times.
* Trust
	* SMS message limit - always confirm (default of 30 seems like a lot of spam to me), might go to 5 if this is a pain
* Security
* Screen lock - pin
* Fingerprint
* System
	* Buttons
		* Additional buttons
			* Slider top - total silence
	* Status bar
		* Network traffic monitor
		* Display mode > upload and download
		* Battery status style - Circle (much higher fidelity information)
	* Advanced
		* Gestures
		* Power menu
			* Advanced restart - on
		* Developer options
			* Automatic system updates > off ("Apply updates when device restarts)
* About phone
* Emergency information (wtf is this in about phone for? I had to ddg to find it)
	* Add information
	* set all the things
	* Add contact
	* doesn't work, just shows empty list to choose from. dang. TODO

### Legacy phone connectivity

The old phone has Wifi at home but without a sim has no internet out and about. Tether to new phone to give it access to internet elsewhere as needed.

Connected to WiFi hotspot but although it accepted the details it fails to actually connect.

Pair to other phone with bluetooth (either end is fine). On old phone open bluetooth settings, go to device > configure (cog) > Internet access > On.

Success, old phone has internet via bluetooth to new phone just like laptop. Win.

## Todo

* firmware update: <https://wiki.lineageos.org/devices/lemonadep/fw_update>
* Backup/restore with titanium
* better camera support? <https://www.xda-developers.com/google-camera-port-hub/>
* see if android pay etc will work with magisk magic mask pretending we haven't unlocked anything
* find an alternative to titanium backup <https://forum.xda-developers.com/t/farewell-to-titanium-backup-looking-for-alternative.3932814/>
* contribute to lineage to link to golang extractor, maybe with step by step instructions
* Make signal default sms app
* Camera from lock screen
* transfer paid version of rain alarm, seems to be missing three-dot-menu on new version
* Xmeye cctv
* Backup alarms
* Signal SMS warnings -> Settings-privacy-Trust-SMS Sending Limit > 5
* No access to work google cal
* Ignore public wifi
* Maps.me voice. Needs language pack. Wut.
* Remember Bluetooth tethering setting. Needs code change.
* Phone default to Bluetooth

## Problems & bugs

* Phone app
	* Fails to unblank when phone rings half the time. Workaround to use power button to sleep/wake a couple of times to wake it up. Painful but bearable.
* Rainalarm problems:
	* no menu so can't enable paid copy
	* map loads but no rain shown

## OS Updates

<https://wiki.lineageos.org/devices/lemonadep/update>

Watch out for de-rooting, make sure backups are up to date first.

Got the first Over The Air (OTA) (...well, over wifi anyway) update from LineageOS. Download. Install. Reboot. Magisk no longer installed. Well that's a fucking pain. NeoBackup fails to start. Backups now broken. Fuck you android.

todo: see if I can restore root with out a full wipe and reinstall this time. twunts. what a pile of yaks.

* [OnePlus Community forum: Keep Root with Magisk with OTA updates](https://community.oneplus.com/thread?id=914099)
* [piles of fucking yaks courtesy of reddit](https://www.reddit.com/r/LineageOS/comments/hynl52/any_way_to_keep_magisk_and_installed_modules_when/)
* <https://android.stackexchange.com/questions/200410/how-do-i-update-an-ota-while-retaining-twrp-and-magisk-only-with-my-phone>
* <https://topjohnwu.github.io/Magisk/ota.html> -

> "When an OTA is available, first go to (Magisk app → Uninstall → Restore Images). Do not reboot or you will have Magisk uninstalled."

Bit fucking late now.

So basically you have to know all this *before* you let android install an update and fuck up your setup (again). Pit of failure.

Guess I'll have to re-do the patch thing I did in the first place.

Export Antennapod state, backup andOTP and make sure syncthing has pushed the files before attempting anything.

### Re-root attempt - success!

Let's try repeating the magisk setup from the original install but with the updated image.

* Check current version installed
	* on phone: settings > about > android version >  > lineageos version: lineage-18.1-20220518-microG-lemonadep
* Download matching image to laptop from <https://download.lineage.microg.org/lemonadep/> (if it's still available, which it is. If it wasn't then might have to run more updates or grab image from phone somehow)
* Run the payload extaction, patch on phone & reflash as in original install:
	* ` ../../payload-dumper-go/payload-dumper-go_1.2.0_linux_amd64/payload-dumper-go ../lineage-18.1-20220518-microG-lemonadep.zip`
	* [plug phone in to laptop with usb]
	* `adb push extracted_20220704_232617/boot.img /sdcard/Download/`
	* patch the file in magisk on the phone (install > patch > select file etc.)
	* get the patched file back on to laptop: `patched=``adb shell ls /sdcard/Download/magisk_patched*`` && echo $patched && adb pull $patched`
	* advanced reboot on phone > fastboot
	* flash the boot image:

```
tim@max:~/Downloads/oneplus9pro/lineage-for-microG/payload2
$ fastboot flash boot magisk_patched-24300_nspcI.img
target reported max download size of 268435456 bytes
sending 'boot_b' (196608 KB)...
OKAY [  5.675s]
writing 'boot_b'...
OKAY [  0.644s]
finished. total time: 6.320s
```

* reboot phone ("reboot system now" > power button)
* open up magisk app .... drumroll ....
* success!! "Installed 24.3 (24300)"

... run a backup with neobackup to see if it works... oh never mind it just popped a notification that neobackup has been granted superuser so I guess it can run its backups now and the schedule has kicked it off after a reboot.

### OTA (Over The Air) update without losing root - fail

Having regained root by patching and flashing boot.img again (above) I'm going to try the OTA on-phone patching as per <https://topjohnwu.github.io/Magisk/ota.html>:

* Settings > System > Advanced > Updater

Press refresh symbol in top right corner.

Two images available:

1. LineageOS 19.1, 11 June 2022, 1.3GB > INFO > "Update blocked This update cannot be installed using the updater app. Please read <https://wiki.lineageos.org/devices/lemonadep/upgrade> for more information."
2. LineageOS 18.1, 18 May 2022, 1.1GB > INSTALL > ...

So let's try the point update following [the magisk ota instructions](https://topjohnwu.github.io/Magisk/ota.html)

* Magisk app > Unistall.... um, where's that then. Perhaps missing because it wasn't instaled this way.
	* "This will restore partitions modified by Magisk back to stock from backups made at install in order to pass pre-OTA block verifications." - yeah that figures, I didn't do that so there's no backups to restore.
	* Guess we'll skip this and hope for the best
* Settings > System > Advanced > Updater > 18.1 18 May 2022 > INSTALL > OK
* ... ~ 10 mins elapse ...
* Updater shows "reboot" button. *DON'T PRESS IT!!*.
* Magisk app > install > install to inactive slot (after OTA) > 
	* "Attention. Your device will be FORCED to boot to the current inactive slot after a reboot! Only use this option after the OTA is done. Continue?" > OK
	* Target slot _a ...
	* failed! dammit.
	* press little save button top right to save log

Failure log: `magisk_install_log_2022-07-05T21_12_57.log`

```
- Target slot: _a
- Target image: /dev/block/sde16
- Device platform: arm64-v8a
- Installing: 24.3 (24300)
- Unpacking boot image
Parsing boot image: [/dev/block/sde16]
HEADER_VER      [3]
KERNEL_SZ       [40823296]
RAMDISK_SZ      [10201092]
OS_VERSION      [11.0.0]
OS_PATCH_LEVEL  [2022-05]
PAGESIZE        [4096]
CMDLINE         []
KERNEL_FMT      [raw]
RAMDISK_FMT     [gzip]
VBMETA
- Checking ramdisk status
Loading cpio: [ramdisk.cpio]
- Stock boot image detected
- Patching ramdisk
Loading cpio: [ramdisk.cpio]
Add entry [init] (0750)
Create directory [overlay.d] (0750)
Create directory [overlay.d/sbin] (0750)
Add entry [overlay.d/sbin/magisk32.xz] (0644)
Add entry [overlay.d/sbin/magisk64.xz] (0644)
Patch with flag KEEPVERITY=[true] KEEPFORCEENCRYPT=[true]
Loading cpio: [ramdisk.cpio.orig]
Backup mismatch entry: [init] -> [.backup/init]
Record new entry: [overlay.d] -> [.backup/.rmlist]
Record new entry: [overlay.d/sbin] -> [.backup/.rmlist]
Record new entry: [overlay.d/sbin/magisk32.xz] -> [.backup/.rmlist]
Record new entry: [overlay.d/sbin/magisk64.xz] -> [.backup/.rmlist]
Create directory [.backup] (0000)
Add entry [.backup/.magisk] (0000)
Dump cpio: [ramdisk.cpio]
- Repacking boot image
Parsing boot image: [/dev/block/sde16]
HEADER_VER      [3]
KERNEL_SZ       [40823296]
RAMDISK_SZ      [10201092]
OS_VERSION      [11.0.0]
OS_PATCH_LEVEL  [2022-05]
PAGESIZE        [4096]
CMDLINE         []
KERNEL_FMT      [raw]
RAMDISK_FMT     [gzip]
VBMETA
Repack to boot image: [new-boot.img]
HEADER_VER      [3]
KERNEL_SZ       [40823296]
RAMDISK_SZ      [10715780]
OS_VERSION      [11.0.0]
OS_PATCH_LEVEL  [2022-05]
PAGESIZE        [4096]
CMDLINE         []
- Flashing new boot image
- Sepolicy rules dir is /dev/hWU/.magisk/mirror/metadata
! Installation failed
! Unable to download bootctl
```

Guess I'll try the patch of boot again.

## Conclusion: inconclusive

The main thing I've learned from this is the long-standing duopoly of iOS+Android has caused deep and hard to reverse problems in the phone software ecosystem. It's a crying shame really because there is so much opportunity for innovation now that phone hardware is basically done, but instead we get stagnation, pointless features, anti-features and down-right user-hostile behaviour from both we-know-best camps. It really reminds me of the dark years of the browser and operating system wars. Particularly when internet explorer became dominant and website (i.e. app) developers targeted proprietary IE APIs, locking everyone in and nearly killing the competition. The same for windows in its prime (when Balmer shouted developers-developers-developers he knew the apps created platform-vendor lock-in that he so desired).

There are some promising signs: Ubuntu so nearly made a phone, and then didn't hit their funding target (the ubuntu phone operating system lives on in obscurity), The Librem looks like it might be a sustainable Linux based phone & business (Android is *not* Linux remember).

For me I think I'll do the closest thing I can to dual-boot and VMs which is to have a second burner phone to run prioprietary crap, but have a primary phone that's as open as I can make it, just like I did with Linux and Windows around 2005-2010.

Every person that takes this route is a vote for change. User numbers matter, especially when it comes to app vendors; they won't invest in dead platforms, but they can't and don't ignore growing market share, and if that's free and open it gets supported. Just look at Microsoft rewriting their *entire* dotnet ecosystem from scratch to be cross platform.

Open source moves slowly, but like an iceberg it's hard to stop when it's claimed the land.

## End... for now

That's as far as I've got so far. I'll be editing this post as I progress with the install so do come and look again. Also suggestions and questions welcome.

I really do hope one day I can de-google my phone just like I de-microsofted my laptop, but today is not that day for me.

## Further reading

* <https://www.howtogeek.com/358166/using-android-without-google-a-kind-of-guide/>
