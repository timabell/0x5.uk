\--- layout: post title: Always add braces date: 2018-08-28 12:14:02.000000000 +01:00 type: post parent\_id: '0' published: true password: '' status: publish categories: \[\] tags: - code meta: \_wpcom\_is\_markdown: '1' \_rest\_api\_published: '1' \_rest\_api\_client\_id: "-1" \_publicize\_job\_id: '21542936011' timeline\_notification: '1535454842' author: login: timabell email: tim@timwise.co.uk display\_name: timabell first\_name: '' last\_name: '' permalink: "/2018/08/28/always-add-braces/" --- Small matter of code style that I keep coming across. Whether to write \`\`\` if (thing) Action(); \`\`\` or \`\`\` if (thing) { Action(); } \`\`\` We should always use the latter to avoid introducing bugs when modifying the code manually or through merge tools. For the reasons behind this, read the following: \* \* \*