---
layout: post
title: Always add braces
date: 2018-08-28 12:14:02.000000000 +01:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- code
meta:
  _wpcom_is_markdown: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _publicize_job_id: '21542936011'
  timeline_notification: '1535454842'
author:
  login: timabell
  email: tim@timwise.co.uk
  display_name: timabell
  first_name: ''
  last_name: ''
permalink: "/2018/08/28/always-add-braces/"
---
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
