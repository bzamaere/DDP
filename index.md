---
title       : Visualizing Batch Job Errors
subtitle    : A Developing Data Products Project
author      : Bruce Zamaere
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Background

This presentation is being created as part of the peer assessment for the Coursera MOOC on Developing Data Products. This specific project looks into the failure of batch jobs for a certain application in a large financial institution. Details of the application and the financial organization have been with held.


--- .class #id 

## The Application

The application is used to give a brief but dynamic Management Information System report on the batch job failures for an application. The report is made available using Shiny and has been deployed at the following url: https://errorvisualizer.shinyapps.io/errorvisualizer

The application allows a user to generate three custom charts that help to visualize the application failures that are reported on a weekly bases. The source code for the project is available on the GitHub at: https://github.com/bzamaere/DDP.


--- .class #id 

## The Data
This application is based on data collected on the number and frequency of server errors. The application in question runs in a large financial institution and relies on numerous batch jobs. This error data was collected over a period of about 6 months. Details of the application and financial institution are withheld. Furthermore all identifying information has been removed from the dataset.

Summary statistics for the dataset are:

```
##          Date            Job.Name  
##  2015-04-22:  42   posrec    :432  
##  2015-04-21:  36   smcRefs   :414  
##  2015-04-28:  36   SMCMapping:163  
##  2015-04-29:  36   posroll   :130  
##  2015-04-16:  34   smcCA     :105  
##  2015-05-21:  34   getMstFile:104  
##  (Other)   :1685   (Other)   :555
```

--- .class #id 

## Thank You

Thank you for taking the time to view my Shiny and Slidify work.

