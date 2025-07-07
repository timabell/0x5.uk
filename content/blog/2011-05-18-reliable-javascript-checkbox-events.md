---
layout: post
title: Reliable javascript checkbox events
date: '2011-05-18T22:30:00.004Z'
author: Tim Abell
tags:
- dhtml
- javascript
- html
- jQuery
- web
modified_time: '2011-05-18T23:24:56.428Z'
thumbnail: http://farm4.static.flickr.com/3652/5734606641_c61a818d47_t.jpg
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-7525465672135952518
blogger_orig_url: https://timwise.blogspot.com/2011/05/reliable-javascript-checkbox-events.html
---

[![](http://farm4.static.flickr.com/3652/5734606641_c61a818d47_m.jpg)](http://www.flickr.com/photos/tim_abell/5734606641/)  
Some sites have checkboxes which show/hide another element when you click them. This a handy feature, but not all sites take into account the fact that firefox remembers the contents of a form when you reload the page (this is a good thing).  

So here's how you avoid that with jQuery:  

    <script type="text/javascript">
        $(function() {
            // initialise show/hide to match the checkbox value
            $('.targetelements').toggle($('#mycheckbox').attr('checked'));
            // attach click handler for show/hide to checkbox
            $('#mycheckbox').click(function(){ $('.targetelements').toggle(this.checked);})
        });
    </script>   

Simples!  

You could use the same principle without jQuery if you need to. Simply read the value of the checkbox with javascript the old fashioned way before deciding whether to hide when you initialise you page.
