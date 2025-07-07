+++
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
tags = ["code"]
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

* <https://www.joelonsoftware.com/2005/05/11/making-wrong-code-look-wrong/>
* <https://dzone.com/articles/omitting-braces-not-just-a-mat>
* [Anatomy of a “goto fail” – Apple’s SSL bug explained, plus an unofficial patch for OS X!](https://web.archive.org/web/20220406111833/https://nakedsecurity.sophos.com/2014/02/24/anatomy-of-a-goto-fail-apples-ssl-bug-explained-plus-an-unofficial-patch/)
