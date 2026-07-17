+++
path = "/2018/08/28/always-add-braces/"
title = "Always add braces"
date = "2018-08-28T12:14:02+01:00"
[extra]
type = "post"
parent_id = "0"
published = true
password = ""
status = "publish"
permalink = "/2018/08/28/always-add-braces/"
[taxonomies]
tags = ["code-quality", "maintainability", "development-practices"]
+++
Small matter of code style that I keep coming across.

Whether to write

```c#
if (thing) Action();
```

or

```c#
if (thing)
  Action();
```

or

```c#
if (thing)
{
	Action();
}
```

We should always use the braces to avoid introducing bugs when modifying the code manually or through merge tools.

For the reasons behind this, read the following:

* [Omitting Braces: Not Just A Matter Of Style - DZone Java (archive)](https://web.archive.org/web/20191116213208/https://dzone.com/articles/omitting-braces-not-just-a-mat)
* [Making Wrong Code Look Wrong – Joel on Software](https://www.joelonsoftware.com/2005/05/11/making-wrong-code-look-wrong/)
* [Anatomy of a “goto fail” – Apple’s SSL bug explained, plus an unofficial patch for OS X! (archive)](https://web.archive.org/web/20220406111833/https://nakedsecurity.sophos.com/2014/02/24/anatomy-of-a-goto-fail-apples-ssl-bug-explained-plus-an-unofficial-patch/) - an example of a serious security flaw that would likely have not happened if braces had been in place.
