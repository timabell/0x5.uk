---
layout: page
title: Recruiters
path: /recruiters/
aliases: ["/2015/10/28/dealing-with-dodgy-recruiter-tactics/"]
---

While many recruiters try and be reasonable, there are enough out there using
[underhand
tactics](http://www.brandonsavage.net/why-recruiters-are-bad-for-your-career/)
to make life difficult and potentially jeopardise a good contract.

The tactics addressed below are:

1. "Multiple submission". This is where you end up with your CV landing on a client's desk from **two** different recruitment companies. I gather this can be the nail in the coffin of a contract even if the client was keen - who wants to be stuck in the middle of two recruiters fighting over the commission?!
2. Requiring "references" that are actually just lead generation.

# Multiple submission

## Principles

The first step is simple, which is **never agree verbally or otherwise to be
put forward without first finding out who the client is**, and make sure you
keep track of who sent your CV where. I find
[Trello](https://trello.com/timabell2/recommend) is a good tool for keeping on
top of the fast moving and often fragmented information you get when hunting
for contracts, particularly combining web view with the mobile apps for on-the
go access to the information.

Recruiters are often hesitant to pass on the client's name, and this is
understandable as if you were to go round them then they'd lose their
commission which is how they earn a living. Worse, if you let the name slip to
another less scrupulous recruiter then they may try and get your CV in first
themselves without asking and in doing so sour the deal for everyone. (They
often fish for names with phrases like "*I need to know who else you've been
submitted to in order to avoid duplication*" - this is a lie, you can manage
this fine yourself.)

To tackle this I recommend the following:

* Never share their client's name with anyone else, especially other
  recruiters; make it clear this is a point of principle.
* Prove your integrity by politely refusing to tell recruiters who ask, they
  might have liked the name, but they will be more likely to trust you in the
  future for respecting the wishes of other recruiters.

So that's the easy bit which I've been doing for some time...

<div style="text-align: center">
<a href="https://www.flickr.com/photos/tim_abell/21013910269/" target="_blank" rel="noopener"><img title="" src="https://c2.staticflickr.com/6/5769/21013910269_433c52303f.jpg" alt="Picture of an otter's head poking up in the sea." width="320" height="192" border="0" /></a>
</div>

## Technical measures

There are unfortunately a bunch of particularly unscrupulous recruiters out
there like sharks in the water who will without your permission, or possibly
without ever contacting you, send your CV to their "client" (or just some poor
manager they've found to spam with CVs). You can't tell them not to if they've
never asked you, and it can still ruin a deal. So what to do about that?

If you're looking for contract work, you really need good exposure, so having
your CV all over the place like leaves in the wind is not a bad way of getting
the word out there (bear in mind I'm looking for work for my contracting
company, which is a different ball-game to finding that perfect permanent
role). It's actually pretty hard to control at all if you're dealing with
recruiters because as soon as you include your CV in a response to posting on
[JobServe](http://www.jobserve.com/) it'll be dropped straight into that
recruiter's pool of CVs, and some recruiters even pool CVs between them using
services like [iProfileUK](http://www.iprofileuk.com/).

To prevent that free-wheeling CV being used without permission, it contains the
following text (as does [my LinkedIn
profile](https://www.linkedin.com/in/timabell)):

> Recruiters: this CV is not authorised for distribution to your clients.
> Please contact me for permission to represent me and for a separate copy
> containing an authorisation code & gpg signature. Thanks. To prospective
> clients, if you receive my CV without these then I haven't given permission
> to be represented.

Okay, so far so good, but any unscrupulous recruiter could just strip that out
and send it anyway, and how would I be able to make a client comfortable that
they can tell this scumbag to jog on?

So before I agree to be represented by a particular recruiter to a particular
client (which I have no particular objection to if they've found work I
otherwise couldn't have found), I will be needing the client's name. I will add
this to a list of who has authorization to send my CV and who they are
authorized to send it to. I will then generate a customised CV (via mail merge)
with explicit permission to represent me to this specific client included in
it, and a note that any CVs received without this are unauthorized by me.

To prevent a recruiter cottoning on and just generating this themselves I will
then be [GPG](https://gnupg.org/) signing the result, which can then be checked
against my public key, proving that it did indeed come from me (assuming my pc
hasn't been hacked of course but I haven't heard of any recruiters going that
far, if they could they'd probably be security consultants instead of
recruiters!).

## Technical details

### json-resume

I've been working on integrating the auth & gpg signing into my json based resume generation flow based on the excellent json-resume project. You can find the repo for this here: [github.com/timabell/json-resume](https://github.com/timabell/json-resume)

### Auth codes

These in a way are redundant, but they are easier for the average person to check, and they add air of authority to the whole thing to help discourage those who would behave in bad faith.

Using libreoffice calc, codes are generated with the following:

A cell containing allowable characters in the codes as text: `0123ABCDEF` etc
for this example this is in cell `F1`.

A row for each authorized representation containing this formula to generate a
unique authorisation code: `=CONCATENATE(MID($F$1,RANDBETWEEN(1,LEN($F$1)),1)`,
[repeat the "mid" clause once for each digit of the code to be generated] )

### Generating auth text

There's another concatenation cell to generate the message to add to the CV.

This is auth text is then copy-pasted into a file, and signed with gnupg on the command-line of my linux box.

### Signing

Here you can see the signing happening, followed by verification that the file is signed properly (as the client might do if they suspect a recruiter is reusing my CV for without my permission).

```bash
gpg --clearsign authorization.txt
```

the contents of the signed file (output to `authorization.txt.asc`) is then copy-pasted onto the end of a CV and
sent off to the recruiter to relay to their client. Along with a custom header with the client & recruiter name to make it absolutely clear who it's solely intended for.

### Verifying

```bash
gpg --verify authorization.txt.asc

gpg: Signature made Fri 07 Apr 2023 10:31:36 BST
gpg:                using RSA key 74D42A4C905507C54A7E3C9C26C6E08728CDF8EA
gpg: Good signature from "Tim Abell <tim@timwise.co.uk>" [ultimate]
```

The important bit here is "Good signature".

If you haven't told gpg to trust my key then you'll get a stern warning from gpg, but it still checks the signature. GPG (and PGP) do more than just sign files, they have a web-of-trust system that involves showing up in the real world with passports and signing each other's keys. You can see why that hasn't gone mainstream, but it is very good.

See <https://yanhan.github.io/posts/2014-03-04-gpg-how-to-trust-imported-key/> for how to mark keys as trusted.

#### My public key

My current public key `28CD F8EA` for `tim@timwise.co.uk`.

You can obtain the key for verifying from:

* My website: [public-key.txt](/public-key.txt)
* [keyserver.ubuntu.com](http://keyserver.ubuntu.com/pks/lookup?search=tim%40timwise.co.uk&fingerprint=on&op=index) (synchronised with other key servers)
* [keys.opengpg.org](https://keys.openpgp.org/search?q=tim@timwise.co.uk)

Full primary key fingerprint: `74D4 2A4C 9055 07C5 4A7E  3C9C 26C6 E087 28CD F8EA`.

Learn more about the state of sharing gpg keys: <https://superuser.com/questions/227991/where-to-upload-pgp-public-key-are-keyservers-still-surviving>

### Examples

I've uploaded a couple of files for you to try out verifying, one with the
original message, and one with a forged message where the client's name has
been changed. See if you can figure out which is which:

* [authorization1](/assets/authorization-1.txt.asc)
* [authorization2](/assets/authorization-2.txt.asc)


### Limiting the period of right to represent

It occurred to me more recently that there should be a time limit of say 3 months on the permission for a recruiter to represent you. As such my permission message currently reads:

> "Tim Abell has given permission for ExampleRecruiter to pass on this CV to ExampleClient on 22 Jan 2022; auth code Q5GAYUEEH5. Any copies of my CV received without a valid gpg signature have not been authorized for distribution. Any express or implied right to represent will expire on 22 Apr 2022 Learn more: https://timwise.co.uk/recruiters "

# Requests for "References"

Unfortunately the more unscrupulous recruiters will claim they need "references" pretty much on first contact before even making contact with the client for you. References should be a follow-up cross check once fit is agreed on. In the worst case these are no such thing, and are actually just mining you for contact details of potential new business that they can harass to find openings and contacts for their database. Worst case they will then spam that contact with unsolicited CVs in a hope of gaining an unearned commission. You owe it to your closest contacts (those who would do you the favour of writing a reference) to protect them from such approaches from the wild-west of the recruitment industry. They doubtless get enough fo this cold outreach without you allowing more of it. Worse they might even use your name without permission to try and gain credence with your contact.

Defenses:

1. Don't ever give out "reference" details until you know for certain that the end client has specifically requested them.
2. Provide them only to the end client, not the recruitment firm.
3. Provide them explicitly for the specific purpose fo reference checking, and forbid their use for any other purpose. Cite breach of GDPR.

It's also important that you check with your contact that they are happy to be a reference for you and that they will be expecting contact from whichever recruiter or client you are in talks with. This way if your name or contact is spammed or abused by this firm then you will both know it has happened.

Do not allow yourself to be pressured into providing references inappropriately, early or carelessly on pain of losing a deal. With the shadiest of recruitment companies the deal may not even exist and may just be made up for the purpose of attracting CVs and filling in their database of prospects to spam.
