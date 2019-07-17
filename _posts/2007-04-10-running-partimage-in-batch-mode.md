\--- layout: post title: running partimage in batch mode date: '2007-04-10T22:01:00.000Z' author: Tim Abell tags: - partimage - dev - project modified\_time: '2007-04-11T01:08:46.017Z' blogger\_id: tag:blogger.com,1999:blog-5082828566240519947.post-3391820548015517010 blogger\_orig\_url: https://timwise.blogspot.com/2007/04/running-partimage-in-batch-mode.html --- A continuation of the [partimage](http://www.partimage.org/) project.  
  
As it would appear that stdout support doesn't work due the user interface making use of stdout, I have been figuring out how to make the program run in batch mode, with a little help from KDevelop.  
  
My continued findings:  
  
The help presents a fully batch mode, -B  

    $ ./partimage --help===============================================================================Partition Image (http://www.partimage.org/) version 0.6.5_beta4 [stable]---- distributed under the GPL 2 license (GNU General Public License) ----Supported file systems:....Ext2/3, Reiser3, FAT16/32, HPFS, JFS, XFS,                           UFS(beta), HFS(beta), NTFS(experimental)usage: partimage [options] <action> <device> <image_file>       partimage <imginfo/restmbr> <image_file>ex: partimage -z1 -o -d save /dev/hda12 /mnt/backup/redhat-6.2.partimg.gzex: partimage restore /dev/hda13 /mnt/backup/suse-6.4.partimgex: partimage restmbr /mnt/backup/debian-potato-2.2.partimg.bz2ex: partimage -z1 -om save /dev/hda9 /mnt/backup/win95-osr2.partimg.gzex: partimage imginfo /mnt/backup/debian-potato-2.2.partimg.bz2ex: partimage -a/dev/hda6#/mnt/partimg#vfat -V 700 save /dev/hda12 /mnt/partimg/redhat-6.2.partimg.gzArguments:* <action>:  - save: save the partition datas in an image file  - restore: restore the partition from an image file  - restmbr: restore a MBR of the image file to an hard disk  - imginfo: show informations about the image file* <device>: partition to save/restore (example: /dev/hda1)* <image_file>: file where data will be read/written. Can be very big.                For restore, <image_file> can have the value 'stdin'. This allows                for providing image files through a pipe.Options:* -z,  --compress      (image file compression level):  -z0, --compress=0    don't compress: very fast but very big image file  -z1, --compress=1    compress using gzip: fast and small image file (default)  -z2, --compress=2    (compress using bzip2: very slow and very small image file):* -c,  --nocheck       don't check the partition before saving* -o,  --overwrite     overwrite the existing image file without confirmation* -d,  --nodesc        don't ask any description for the image file* -V,  --volume        (split image into multiple volumes files)  -VX, --volume=X      create volumes with a size of X MB* -w,  --waitvol       wait for a confirmation after each volume change* -e,  --erase         erase empty blocks on restore with zero bytes* -m,  --allowmnt      don't fail if the partition is mounted. Dangerous !* -M,  --nombr         don't create a backup of the MBR (Mast Boot Record) in the image file* -h,  --help          show help* -v,  --version       show version* -i,  --compilinfo    show compilation options used* -f,  --finish        (action to do if finished successfully):  -f0, --finish=0      wait: don't make anything  -f1, --finish=1      halt (power off) the computer  -f2, --finish=2      reboot (restart the computer):  -f3, --finish=3      quit* -b,  --batch         batch mode: the GUI won't wait for an user action* -BX, --fully-batch=X batch mode without GUI, X is a challenge response string* -y,  --nosync        don't synchronize the disks at the end of the operation (dangerous)* -sX, --server=X      give partimaged server's ip address* -pX, --port=X        give partimaged server's listening port* -g,  --debug=X       set the debug level to X (default: 1):* -n,  --nossl         disable SSL in network mode* -S,  --simulate      simulation of restoration mode* -aX, --automnt=X     automatic mount with X options. Read the doc for more details* -UX  --username=X    username to authenticate to server* -PX  --password=X    password for authentication of user to server===============================================================================

  
  
It is not immediately obvious what "X is a challenge response string" means.  
I was able to get the program to run to a limited extend after a bit of searching the internet and trial and error with the option "-B x=y".  
  
Having stepped through the program, it transpires that where I have put "x", the program expects a pattern to match with the title and content of any messages that would otherwise have been shown to the user, and "y" is the pre-programmed response. This is in the "interface\_none" section.  
"x" has to match the question in the form "message title/message content" and is compared using fnmatch which allows \* as a wildcard (anyone got a good reference for fnmatch?).  
If the program hits a question for the user, and cannot find a matching answer in the command arguments, "CInterfaceNone::invalid\_programmed\_response()" fires "exit(8)" and the program dies.  
  
So far I have been running the program as a normal user, which will inevitably fail where it attempts to work with block devices / root owned files & folders. This produces a warning in the user interface, followed by program termination.  
  
To bypass this first "not root" warning, I successfully used this pre-programmed answer:  
./partimage -B Warning\*=Continue  
Alternatively the following is more specific and also works:  
./partimage -B Warning\*root\*=continue  
  
I haven't figured out how to pass more than one predefined answer in batch mode.  
  
The run arguments can be set in KDevelop here:  
project > options > debugger > program arguments  
  
_Side note:_  
The program has a base class of user interface defined, and then either instantiates interface\_none or interface\_newt depending on command line arguments.  
  
If not using full batch mode it helps to set "enable separate terminal for application IO" in KDevelop (project > options > debugger) so that you can see the full user interface. However if the program exits then the console closes and any output is lost.  
  
As part of stepping through the code, I came across a macro, which makes the program harder to follow while debugging due to not being able to step through. So I figured out what it did, and wrote out its output C++ code in full:  
  
[interface\_none.cpp, line 103](http://partimage.svn.sourceforge.net/viewvc/partimage/trunk/partimage/src/client/interface_none.cpp?revision=1&view=markup&pathrev=20#l_103)  

    #define MB_2(One,Other,ONE,OTHER)       \int CInterfaceNone::msgBox##One##Other(char *title, char *text, ...) {  \char *result= lookup(title,text,"(unspecified)");     \va_list al;          \va_start(al,text);         \message_only(#One "/" #Other, title, text, al, result);    \va_end(al);          \if (!strcasecmp(result,#One)) return MSGBOX_##ONE;     \if (!strcasecmp(result,#Other)) return MSGBOX_##OTHER;    \invalid_programmed_response();       \return 0;                                                             \}MB_2(Continue,Cancel,CONTINUE,CANCEL)MB_2(Yes,No,YES,NO)

  
  
my expanded version:  

    //notes: have expanded out macro so I can step through it.int CInterfaceNone::msgBoxContinueCancel(char *title, char *text, ...) { char *result= lookup(title,text,"(unspecified)"); va_list al;           va_start(al,text);          message_only("Continue" "/" "Cancel", title, text, al, result);     va_end(al);           if (!strcasecmp(result,"Continue")) return MSGBOX_CONTINUE;     if (!strcasecmp(result,"Cancel")) return MSGBOX_CANCEL;     invalid_programmed_response();       return 0;                                                             }int CInterfaceNone::msgBoxYesNo(char *title, char *text, ...) {   char *result= lookup(title,text,"(unspecified)");      va_list al;           va_start(al,text);          message_only("Yes" "/" "No", title, text, al, result);     va_end(al);           if (!strcasecmp(result,"Yes")) return MSGBOX_YES;      if (!strcasecmp(result,"No")) return MSGBOX_NO;     invalid_programmed_response();        return 0;                                                             }

  
  
**creating a ramdisk for testing.**  
[http://www.vanemery.com/Linux/Ramdisk/ramdisk.html](http://www.vanemery.com/Linux/Ramdisk/ramdisk.html)  
(I am on ubuntu 6.10 here, details may vary)  
  

    $ ls -l /dev/ram*brw-rw---- 1 root disk 1,  0 2007-04-08 20:10 /dev/ram0brw-rw---- 1 root disk 1,  1 2007-04-08 20:10 /dev/ram1brw-rw---- 1 root disk 1, 10 2007-04-08 20:10 /dev/ram10brw-rw---- 1 root disk 1, 11 2007-04-08 20:10 /dev/ram11brw-rw---- 1 root disk 1, 12 2007-04-08 20:10 /dev/ram12brw-rw---- 1 root disk 1, 13 2007-04-08 20:10 /dev/ram13brw-rw---- 1 root disk 1, 14 2007-04-08 20:10 /dev/ram14brw-rw---- 1 root disk 1, 15 2007-04-08 20:10 /dev/ram15brw-rw---- 1 root disk 1,  2 2007-04-08 20:10 /dev/ram2brw-rw---- 1 root disk 1,  3 2007-04-08 20:10 /dev/ram3brw-rw---- 1 root disk 1,  4 2007-04-08 20:10 /dev/ram4brw-rw---- 1 root disk 1,  5 2007-04-08 20:10 /dev/ram5brw-rw---- 1 root disk 1,  6 2007-04-08 20:10 /dev/ram6brw-rw---- 1 root disk 1,  7 2007-04-08 20:10 /dev/ram7brw-rw---- 1 root disk 1,  8 2007-04-08 20:10 /dev/ram8brw-rw---- 1 root disk 1,  9 2007-04-08 20:10 /dev/ram9

  
  
create and mount test ramdisk  

    # mke2fs /dev/ram0# mkdir /media/ram0# mount /dev/ram0 /media/ram0

  
add a test file and unmount the disk  

    # echo "test data #1." >> /media/ram0/foo.txt# umount /media/ram0

  
  
the above, as a script:  

    #!/bin/bash# create and mount test ramdiskmke2fs /dev/ram0if [ ! -d /media/ram0 ]; then    mkdir /media/ram0fimount /dev/ram0 /media/ram0#add a test file and unmount the diskecho "test file." >> /media/ram0/foo.txtdate >> /media/ram0/foo.txtcat /media/ram0/foo.txtumount /media/ram0

  
  
Create & run script (as root, because it (un)mounts a file system, and creates a dir in a root owned folder):  

    $ gedit mkram.sh$ chmod ug+x mkram.sh$ sudo ./mkram.sh

  
  
Wierdly, partimage won't run in full batch mode without a second part to the -B switch, even if it's set up to not need to ask any questions. Supplying a dummy "x=y" seems sufficient to fool it.  
  
Runing as root without asking for partition description works:  

    $ sudo ./partimage -d -B x=y save /dev/ram0 ram0.img

  
  
Restore image to a different ramdisk and check file:  

    $ sudo ./partimage -B x=y restore /dev/ram1 ram0.img.000$ sudo mount /dev/ram1 /media/ram1$ cat /media/ram1/foo.txttest file.Mon Apr  9 12:56:59 BST 2007

  
Success!  
  
Script for checking file in saved partition:  

    #!/bin/bash# mount and check restored ramdiskif [ ! -d /media/ram1 ]; then    mkdir /media/ram1fimount /dev/ram1 /media/ram1cat /media/ram1/foo.txtumount /media/ram1

  
  
To debug in KDevelop as root (in ubuntu):  
alt-F2 (run)  
gksudo kdevelop  
open project... (go find existing copy)  
  
So in summary, I have made progress in understanding the ways of this useful utility, and am a step closer to making a useful contribution to the project.  
  
The rambling nature of this post reflects the way in which one begins to understand a new program. Hopefully it's not too hard to follow, or pick out the useful pieces. All feedback gratefully appreciated.  
  
Tim.