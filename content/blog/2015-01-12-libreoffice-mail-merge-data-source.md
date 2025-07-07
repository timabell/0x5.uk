---
layout: post
title: LibreOffice mail merge - "data source 'SOURCE' was not found"
date: '2015-01-12T22:31:00.002Z'
author: Tim Abell
tags: 
modified_time: '2015-02-26T00:51:32.105Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-3978505848471658988
blogger_orig_url: https://timwise.blogspot.com/2015/01/libreoffice-mail-merge-data-source.html
---

So another year on, LibreOffice 4.2.7.2 (via Linux Mint 17.1) still has a dog's breakfast of a mail merge feature, hey ho, hopefully it might actually get fixed following the fork from OpenOffice and the change in contribution methods.  

Anyways  

So I've moved machines, copied my files across and for some reason my mail merge has soiled itself and now bleats _"data source 'SOURCE' was not found"_ which is as unhelpful as it is infuriating, especially given that the "check connections" button is exactly the wrong place to look for an answer.  

Turns out you actually get this if even just a single field in your document is 'broken'. How do you tell which ones are broken? Well you have to change them all to just be sure. Sigh.  

The fix for me today was as follows (though with such a messy feature there's unlimited ways it can break):  

1.  Hit F4 and check that your connection to the spreadsheet actually exists and works, and unbreak anything you find therein. While you're in there you can marvel at how it requires a whole other file (.odb) just to remember how to get to a spreadsheet. (See below for fixing this)
2.  Turn on the field names so you can see what the f*** is actually going on with "_View > Field Names (ctrl+f9)_" which will show you the fully qualified field name, which might even be completely wrong. You can now see that for whatever reason (insanity?) it embeds more than just the field name at the field place-holder.
3.  And finally the way you actually fix the broken fields it's failing to tell you about actually lies under the menu item "_Edit > Fields_", where you can change all the broken references one at a time to the correct place.
4.  For bonus points, if it the field looks right but is silently broken somehow then you have to change the field to something else, hit okay, and then change it back again for anything to actually change, which is annoying if you have a lot of fields.

Fragile much?  

Another fix I've just discovered is you can rename your data source to match the name defined in the fields (assuming they're all the same) and it'll start working again.  

#### Fixing the .odb file

If you're stuck on point 1, here's how you fix it, also completely non-obvious and full of apparent dead-ends and dubious information.  

1.  Give up on trying to do this in writer, it doesn't seem possible, in spite of false hope from the data sources tool, it only allows you to select .odb (database) files, not spreadsheets.
2.  Open up "libreoffice base", which pops open the database wizard
3.  Choose "connect to an existing database"
4.  In the dropdown choose "Spreadsheet"
5.  Next
6.  Browse for your spreadsheet
7.  Next
8.  Leave "register database for me" selected
9.  Leave "open the database for editing" checked
10.  Finish
11.  It prompts to save the new database (.odb), I suggest saving it in the same folder as the spreadsheet to save future confusion.
12.  You now have the database open in "base", you should see your spreadsheet sheets listed as tables
13.  Open a table (i.e. a sheet) and check you can see the spreadsheet contents
14.  Close "base", saving changes
15.  Return to your writer document
16.  Open the data sources again (F4), you should now be able to browse your spreadsheet via your newly created database.

Simpler than getting planning permission out of a vogon. :-/  

Hope that helps some other poor open source die-hard who has work to do.  

Useful refs:  

*   [http://davidmburke.com/2011/08/10/mail-merge-in-libreoffice/](http://davidmburke.com/2011/08/10/mail-merge-in-libreoffice/)
*   [https://forum.openoffice.org/en/forum/viewtopic.php?f=30&t=29708](https://forum.openoffice.org/en/forum/viewtopic.php?f=30&t=29708)
*   [https://www.libreoffice.org/bugzilla/buglist.cgi?quicksearch=mailmerge](https://www.libreoffice.org/bugzilla/buglist.cgi?quicksearch=mailmerge)
*   [http://ask.libreoffice.org/en/question/19590/can-you-import-a-libreoffice-calc-spreadsheet-into-a-libreoffice-database/](http://ask.libreoffice.org/en/question/19590/can-you-import-a-libreoffice-calc-spreadsheet-into-a-libreoffice-database/)
