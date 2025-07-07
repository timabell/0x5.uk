+++
path = "/2025/05/20/how-to-upload-kindle-fire-kids-photos-to-amazon-photos/"
title = "How to upload kindle fire kids photos to amazon photos"
+++

This is a bit off my normal subject, so ignore this if you are not a user of the amazon kindle fire kids tablets.

## Other upset kindle users

I've been having a world of pain trying to get the kids' photos off their old tablet before sending it back, fortunately before it was completely broken. Apparently I'm not alone:

- <https://www.reddit.com/r/kindlefire/comments/sivx7d/getting_photos_and_videos_off_of_kids_fire/> “Granddaughter takes photos constantly on her Fire HD 8 Kids Edition… but how do we get them off? Nothing is backed up.”
- <https://www.reddit.com/r/kindlefire/comments/19bmn8h/backup_copy_photos_and_videos_from_fire_tablet_7/> “No way of getting photos off of a Fire 7 Kids profile… Amazon Photos doesn’t back them up.”
- <https://www.reddit.com/r/kindlefire/comments/1gv8t83/fire_8_kids_photos_gone_after_nov_18_update/> “My daughter’s Fire 8 is no longer indexing the photos after yesterday’s update. They’re gone.”
- <https://www.reddit.com/r/kindlefire/comments/1evpxyj/photos_app_replaced_with_gallery/> “Amazon Photos app was removed and replaced with Gallery… which doesn’t auto-sync to the cloud.”
- <https://www.reddit.com/r/kindlefire/comments/jxfkwx/backing_up_photos_on_a_fire_7_kids_profile/> “Found an Auto Save toggle buried in settings. Why isn’t this on by default?”
- <https://forums.digitalspy.com/discussion/2433516/copying-files-from-amazon-fire-kids-tablet> “Wife checked Amazon Photos and nothing’s there. The tablet doesn’t show up as a drive either.”
- <https://forums.moneysavingexpert.com/discussion/6280419/kindle-fire-for-kids-would-like-to-backup-videos-onto-my-computer-not-onto-amazon-photos> “Trying to copy my kids’ videos off the Fire tablet — they’re hidden and Photos won’t back them up fully.”

## Failed support escalations

Having spent several hours on amazon's chat support and got nowhere (they clearly don't have a clue and have no escalation path) I turned to chat-gpt to help and it let me know that if you email a bunch of amazon executive email accounts you get fast-tracked to a non-idiot for better support. (Why they can't just escalate from chat is beyond me, and yes I did ask both on chat and phone support to be put through to more senior folks, to no avail, complete dead end). These emails got a response from an intelligent and helpful human-being, who managed to fine a very obscure and gnarly way to at least upload the photos as a one-time upload. Seeing as it's nigh on impossible to find I'll document it here for anyone else who needs it, and for myself next time round. I hope the support person is able to knock heads together of the actual product teams as promised as they've really screwed up this one compared to the seamless background cloud upload folks have come to expect from their google and apple devices.

It has been confirmed that the amazon photos app has been killed in the android fire ecosystem, leaving only full android with a functioning photo sync.

## Step 1 - enable parent viewing of photos

This was already enabled for me, but I'm assured this is a required step

1. Switch to the child profile
2. Swipe [all the way] down from top, click the settings cog
3. Enter the adult pin
4. You then find a settings dashboard (not the android settings screen, this is a kindle fire thing)
5. Click "Device Settings"
6. Check that "Enable Camera & Photo Gallery" toggle switch is enabled (i.e. yellow)

![](/images/blog/kindle-fire-photos/pull-down.jpg)

![](/images/blog/kindle-fire-photos/kids-settings.jpg)

![](/images/blog/kindle-fire-photos/enable-camera.jpg)

(I'm not convinced this stacks up logically, but it was already enabled and working on mine, so whatever. Documented here as something to check.)

## Check access to kids photos from adult profile

1. Go into the grown up profile
2. Open the gallery app
3. Verify that you can see the kid's photos alongside those taken from the adult profile.

Tip: write adult/kid on two pieces of paper, take a photo of each from the respective profile, that way you can see at a glance which photos are coming from which profile.

![](/images/blog/kindle-fire-photos/profile-finder-photos.jpg)

## The hidden upload

ℹ️ The following is for upload to Amazon Photos via the silk browser in the adult profile. This is the way I did it because this is what support showed me how to do, and because I was looking to Amazon for an end-to-end solution. I've since realised that the key insight here is that even though the file browser apps are unable to see the kids' photos, the web browser is able to select and upload them. I don't know what magical back-door the browser and gallery are using to be able to see them, but the fact the file browser can't completely threw me off the scent here.

You can actually use the website of any of the file storage services for this - dropbox, google drive, one drive etc. It's the installed app versions that can't access the photos. The browser however, has special magical access somehow.

⚠️ Before doing this, ensure you have _nothing_ in the "Folders > Pictures > Web" folder of [amazon photos](https://www.amazon.co.uk/photos), otherwise they'll all get mixed up. Move anything there out of the way first.

1. Go into the grown up profile
2. Open the "Amazon Photos" app, which will bounce you to <https://www.amazon.co.uk/photos> in the silk browser (or just open silk browser and navigate there yourself, same difference).
3. On the amazon photos website, click the "+" button
   1. (Note this is *not* the identical "+" button in the "Albums" area of amazon photos.)
4. Click "Upload photos"
   1. This should pop the option to choose which "app" to upload photos from
   2. Note: This appears to be buggy, I had a lot of problems with this pop-up immediately vanishing again. Closing silk browser and starting again would solve it temporarily.
5. Select "Files"
   1. This opens up the android file browser for file selection
6. Click the hamburger menu (three horizontal lines)
7. Click "Images" (not "photos", just to be different)
8. Long-press one of the images
9. Click the three tiny dots top-right (some kind of android options menu)
10. Click "Select All" in the menu that pops up (the only option)
11. Click "Open" (it's not really open, it means "upload")
12. Finally you should see the photos uploading one at a time with a progress bar in the amazon photos website
13. 🚨 Repeat the above for Videos!! They are not in the "images" section. 🚨 - I very nearly lost all the kid's videos because of this.

![](/images/blog/kindle-fire-photos/silk-web-upload-button.jpg)

![](/images/blog/kindle-fire-photos/silk-web-upload-options.jpg)

![](/images/blog/kindle-fire-photos/silk-web-upload-gallery-hamburger.jpg)

![](/images/blog/kindle-fire-photos/silk-web-upload-gallery-images-videos.jpg)

![](/images/blog/kindle-fire-photos/silk-web-upload-select-one.jpg)

![](/images/blog/kindle-fire-photos/silk-web-upload-select-all.jpg)

![](/images/blog/kindle-fire-photos/silk-web-upload-open.jpg)

![](/images/blog/kindle-fire-photos/silk-web-uploading.jpg)

Note: the very tempting "gallery" option does *not* seem to manage to select and upload photos, so that's no use. Stick to the top two images/videos option in the hamburger menu.

## Download from amazon photos

To exfiltrate your kids photos from the amazon walled garden:

### 1. Check they actually uploaded

1. On a laptop (preferably linux, because you learned your lesson about lock-in and walled gardens, right?)
2. Log in to "Amazon Photos" <https://www.amazon.co.uk/photos> with the same amazon account as the adult profile you've been using on the tablet.
3. Look in Folders > Pictures > Web
4. You should see all your kids photos in there, mixed with anything else you've already uploaded (lame)


### 2. Download them

![](/images/blog/kindle-fire-photos/web-photos.png)

![](/images/blog/kindle-fire-photos/web-download.png)

## Footnotes

In the gallery app there's a text-button that gives false-hope that reads "Go to Amazon Photos for backup options", but ha! When you click it dutifully launches the "Amazon Photos" app... which... no longer is an actual app and just opens the silk browser on the amazon photos web page, which obviously can't back up shit, especially in the background on a schedule, like backups are supposed to be, and there's no "backup" options in the website, because, well, it's a website not an app or tablet setting. Infuriating, like everything else to do with this.

If anyone from amazon is listening, this an absolute joke, and I know it's been like this for years because I had exactly the same runaround from support and crazy workaround when the previous tablet needed replacing. Currently the choices are:

1. Spend literally hours fighting amazon support, and more hours trying to figure out these hidden back doors, or
2. Accept that amazon have managed to lock all the kids photos in an impenetrable fortress and tell the kids that all their efforts are lost (fun).

As you can see from the above, plus the hidden hours I've spent to even be able to get to this point, this is the opposite of slick, seamless and effortless.

Oh yeah, and amazon confirmed that there is NO background sync capabilities. So when your kid drops the tablet in the lake and you haven't done the above hour-long toil recently, well it's just tough shit, and now you have to reasons for your kid to be upset not just one.

Honestly I'd throw these pieces of junk in the lake myself, but as far as I know none of the other tablet vendors provide an age-appropriate(ish) curated tablet experience for kids, with a range of downloadable apps and content that the kids can move around on their own. Last I checked apple only had a full ipad experience with the ability to lock the kids into a single app, which is a nightmare on a long trip because they constantly need you to change apps, or you give up and give them unfettered access, which given how even grown-ups are destroying their own mental health with tech these days is just a bad idea. If you know of better alternatives I'm all ears.

I need a lie down after that. Thanks to the amazon support person for spending two or so hours on the phone with me, including screensharing the tablet while we found the hidden options that actually worked.
