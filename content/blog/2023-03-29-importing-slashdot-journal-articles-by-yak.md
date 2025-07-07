---
title: Importing Slashdot Journal Articles by Yak
layout: post
---

I've imported all my old slashdot journal articles because:

- posterity
- I like the fact I've been writing on the internet for so long and I want my domain to show it
- there's something to be said for keeping your own writing on your own domain and not someone else's
- because I can.

It turns out that although slashdot has an export feature, it doesn't include the journal entries. Let the yak-shaving begin.


## What worked

Use wget to download all the paginated lists of posts into html files. (I forget whether I looped this or got wget to spider it, either would work).

Parse paginated list of posts to get individual post urls into file `urls.txt`:

```bash
#!/bin/sh -v
echo "" > urls.txt
for page in page*.html; do
    xidel --data "$page" --xquery 'for $var in //article return $var//span[@class="story-title"]//a[@rel]/@href' >> urls.txt
done
```

Loop through those urls downloading the individual post pages


```bash
#!/bin/bash -v
mkdir -p posts
cd posts
while read url; do
    echo $url
    file="${url/https:\/\/slashdot.org\/journal\//}"
    file2="${file/\//-}.html"
    echo $file2
    curl $url >> $file2
done < ../urls.txt
```

Parse the downloaded files, transforming them into individual markdown files:

```ruby
#!/usr/bin/env ruby

require 'nokogiri'
require 'date'

Dir.glob("posts/*").each do |input|
    puts input
    doc = File.open(input) { |f| Nokogiri::HTML(f) }

    doc.css("article[data-fhtype='journal']").each do |a|
        url=a.at_css(".story-title a[rel]").attribute("href").text
        date = Date.parse(a.at_css("time").text[3..])
        outfile = date.to_s + "-slashdot-journal-" + url[23..].gsub("/","-") + ".md"
        puts outfile
        File.open("out/" + outfile, "w") {|out|
            out.write "---"
            out.write "\n"
            out.write "title: \"" + a.at_css(".story-title a[rel]").text + "\""
            out.write "\n"
            out.write "date: "+ date.to_s
            out.write "\n"
            out.write "slashdot_url: https:"+ url
            out.write "\n"
            out.write "---"
            out.write "\n"
            out.write "\n"
            a.css("div[class=body] div[class=p]").each do |p|
                out.write p.inner_html.strip
                out.write "\n"
                out.write "\n"
            end
        }
    end
end
```

## Exploration with nokogiri

Once you have an html file on disk you can explore the in-memory model interactively with `irb`, which helps iterate on scripts like the above more rapidly.

E.g.

```ruby
$ irb
irb(main):001:0> doc = File.open("page-0.html") { |f| Nokogiri::XML(f) }
irb(main):002:0> doc.css("article[data-fhtype='journal']").each {|a| puts "---", "title: " + a.at_css(".story-title").text, "time: "+ a.at_css("time").text, "---";};nil
```

## Dead-ends explored

- [xq](https://github.com/sibprogrammer/xq) - doesn't seem to provide a rich enough expression to pick bits out of html and stitch them back together in interesting ways, more of a tool for capturing better structured data.
- [xidel](https://github.com/benibela/xidel) - can do xquery not just xpath, got further with this but not far enough
- `wget`'ing the paginated list of posts - for some reason this resulted in repeated content when parsed with nokogiri
- `wget`'ing individual post pages - suspected manipulation of html, so dropped down to `curl`

## References

- Example of xquery in action: <https://stackoverflow.com/questions/5987474/return-multiple-data-elements/5993577#5993577>
- Using xidel for parsing html: <https://stackoverflow.com/questions/21015587/get-content-between-a-pair-of-html-tags-using-bash/21026668#21026668>
- XQuery intro: <https://www.w3schools.com/xml/xquery_intro.asp>
- Using nokogiri for parsing, official docs: <https://nokogiri.org/#parsing-and-querying>
- Parsing with nokogiri: <https://nokogiri.org/tutorials/parsing_an_html_xml_document.html>
- [Nokogiri cheatsheet gist](https://gist.github.com/carolineartz/10276637)
- Scraping with nokogiri walkthrough: <https://dev.to/kreopelle/nokogiri-scraping-walkthrough-alk>
- Globbing files in ruby: <https://stackoverflow.com/questions/7677410/how-do-i-get-a-listing-of-only-files-using-dir-glob/7677543#7677543>
- Looping through file lines in ruby: <https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash/1521498#1521498>
- String replacement in bash: <https://linuxhandbook.com/replace-string-bash/>
- Parsing odd date formats with ruby: <https://stackoverflow.com/questions/11617410/parse-date-string-in-ruby/11617505#11617505>
