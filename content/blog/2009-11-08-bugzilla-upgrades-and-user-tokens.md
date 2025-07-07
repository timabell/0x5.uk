---
layout: post
title: bugzilla upgrades and user tokens
date: '2009-11-08T18:12:00.006Z'
author: Tim Abell
tags:
- mysql
- bugzilla
- troubleshooting
- sys admin
modified_time: '2009-11-10T22:28:00.731Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-1315274421552207269
blogger_orig_url: https://timwise.blogspot.com/2009/11/bugzilla-upgrades-and-user-tokens.html
---

It's bugzilla upgrade time for my private install, and I have for the second time run into a strange issue with the tokens system. Since this is the second time and I know how to fix it, here it is for the record.

I have upgrade from v3.0.4 to 3.4.3.

Once the site was up again, saving the site parameters (`editparams.cgi`) showed a big red warning:

> It looks like you didn't come from the right page (you have no valid token
> for the *edit_parameters* action while processing the 'editparams.cgi'
> script). The reason could be one of:
>
> *   You clicked the "Back" button of your web browser after having
>     successfully submitted changes, which is generally not a good idea (but
>     harmless).
> *   You entered the URL in the address bar of your web browser directly,
>     which should be safe.
> *   You clicked on a URL which redirected you here **without your consent**,
>     in which case this action is much more critical.
>
> Are you sure you want to commit these changes anyway? This may result in
> unexpected and undesired results.
>
> [Confirm Changes]
>
> Or throw away these changes and go back to editparams.cgi.

Pushing the button doesn't work (same page shows again).

After much digging last time I discovered that the tokens it refers to are stored in table bugs.tokens, and that the size of the field is wrong in my installation after the upgrade (again).

```
mysql> use bugs;
mysql> describe tokens;
+-----------+--------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| userid | mediumint(9) | YES | MUL | NULL | |
| issuedate | datetime | NO | | NULL | |
| <span style="font-weight: bold;">token | varchar(5)</span> | NO | PRI | NULL | |
| tokentype | varchar(8) | YES | | NULL | |
| eventdata | tinytext | YES | | NULL | |
+-----------+--------------+------+-----+---------+-------+
5 rows in set (0.02 sec)
```

According to the published schema, token should be `varchar(16)`. [http://www.ravenbrook.com/project/p4dti/tool/cgi/bugzilla-schema/index.cgi?action=single&version=3.4.2&view=View+schema#table-tokens](http://www.ravenbrook.com/project/p4dti/tool/cgi/bugzilla-schema/index.cgi?action=single&version=3.4.2&view=View+schema#table-tokens)

To fix the problem I modified the data type as follows:

```
mysql> alter table tokens modify column token varchar(16) not null;
Query OK, 20 rows affected (0.32 sec)
Records: 20 Duplicates: 0 Warnings: 0
```

And then I was able to change my parameters.

[https://bugzilla.mozilla.org/show_bug.cgi?id=527780](https://bugzilla.mozilla.org/show_bug.cgi?id=527780)
