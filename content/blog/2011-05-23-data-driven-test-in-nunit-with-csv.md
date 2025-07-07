---
layout: post
title: Data driven test in NUnit with csv source data
date: '2011-05-23T09:38:00.004Z'
author: Tim Abell
tags:
- csv
- c#
- visual studio
- tdd
- NUnit
modified_time: '2014-05-11T14:09:23.853Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-7979159669115124674
blogger_orig_url: https://timwise.blogspot.com/2011/05/data-driven-test-in-nunit-with-csv.html
---

I wanted to test a date parser across a large range of values so wanted a simple test harness to test all the values.  

The test framework options around c# / .net seem to be:  

*   MSTest - can do csv via jet, but can't do inline test data which is something I also want.
*   NUnit - can do inline data driven test data (with the TestCase(data...) attribute), and has support for extending this via the TestCaseSource attribute.
*   xUnit - confusing (aka flexible), doesn't seem to get me to my end result any faster after a bit of searching around.

I've used NUnit and combined TestCaseSource with a simple wrapper class around the csv parsing library  

To get this to work:  

*   Save your csv file in your test project
*   add the file to your project (in visual studio 2008 in this case)
*   right-click on the csv file in solution explorer, click properties, change "<span style="font-style: italic;">Copy to Output Directory</span>" to "<span style="font-style: italic;">Copy Always</span>"
*   download the [binaries (dlls) for csv reader](http://www.codeproject.com/KB/database/CsvReader/CsvReader_bin.zip) from code project, add a reference to this in your test project
*   add a private method to your test class for reading the csv file and returning an enumarable (see code below)
*   add the TestCaseSource attribute to your test method(s) that you want to use the csv data, referencing your new IEnumerable method (see code below)

```
using System.Collections.Generic;
using System.IO;
using LumenWorks.Framework.IO.Csv;
using NUnit.Framework;

namespace mytests
{
    class MegaTests
    {
        [Test, TestCaseSource("GetTestData")]
        public void MyExample_Test(int data1, int data2, int expectedOutput)
        {
            var methodOutput = MethodUnderTest(data2, data1);
            Assert.AreEqual(expectedOutput, methodOutput, string.Format("Method failed for data1: {0}, data2: {1}", data1, data2));
        }

        private int MethodUnderTest(int data2, int data1)
        {
            return 42; //todo: real implementation
        }

        private IEnumerable<int[]> GetTestData()
        {
            using (var csv = new CsvReader(new StreamReader("test-data.csv"), true))
            {
                while (csv.ReadNextRecord())
                {
                    int data1 = int.Parse(csv[0]);
                    int data2 = int.Parse(csv[1]);
                    int expectedOutput = int.Parse(csv[2]);
                    yield return new[] { data1, data2, expectedOutput };
                }
            }
        }
    }
}
```

<span style="font-weight: bold;">references:</span>  

*   [CodeProject.com - CsvReader](http://www.codeproject.com/KB/database/CsvReader.aspx)
*   [StackOverflow.com - Data-driven testing in NUnit](http://stackoverflow.com/questions/4036840/data-driven-testing-in-nunit)
*   [NUnit TestCaseSource](http://nunit.com/index.php?p=testCaseSource&r=2.5.8)
*   [msdn ref, c# yield](http://msdn.microsoft.com/en-us/library/9k7k7cf0%28v=vs.80%29.aspx) - for generating an IEnumerable.
