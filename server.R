library(shiny)
library(plyr)
library(ggplot2)
library(reshape2)

#read in the data...
failures<-read.csv("failures.dat", header=TRUE, sep="\t")

head(failures)
as.Date(failures$Date, "%Y-%m-%d")


Months<-format(as.Date(failures$Date), "%b")
Years<-format(as.Date(failures$Date), "%Y")
Weeks<-format(as.Date(failures$Date), "%Y.%W")
DayofWeek<-format(as.Date(failures$Date), "%A")

failures2<-cbind(failures, Weeks, Months, DayofWeek)

failure.perweek<-count(failures2, c('Weeks'))
failure.perweekbyjob<-count(failures2, c('Weeks', 'Job.Name'))
failure.perweekday<-count(failures2, c('DayofWeek', 'Job.Name'))
failure.perweekday2<-count(failures2, c('Weeks','DayofWeek', 'Job.Name'))

myChart=""
# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  chartToPlot <- function(x) {
    y <- as.character(x)
    switch(y,
                   "1" = ggplot(data=failure.perweek,aes(x=Weeks,y=freq)) + 
                     geom_point() +
                     geom_smooth(method="lm", formula=y~x, aes(group=1)) +
                     xlab("Week of the Year") + 
                     ylab("Total Failures per Week") + theme(axis.text.x = element_text(angle = 90))+
                     ggtitle("Total Job Failures per Week for the last 6 Months"),
                   
                   "2" = ggplot(data=failure.perweekbyjob,aes(x=Weeks,y=Job.Name)) + 
                     geom_tile(aes(fill=freq)) +
                     geom_text(aes(label=freq), size=3, colour="white") +
                     xlab("Week of the Year") + 
                     ylab("CRB Job") + theme(axis.text.x = element_text(angle = 90))+
                     ggtitle("Jobs that have had failures (count per week)in the last 6 Months"),
                   "3" = ggplot(data=failure.perweekday, aes(x=log(freq+1), fill=factor(DayofWeek))) +
                     geom_density(alpha=0.2) + xlab("Frequency of failure") + ylab("Density") +
                     ggtitle("Density Plot of Job Failures Frequencies by Day of week for the last 6 Months"))
  }
  
  output$plotComesHere <- renderPlot({
    chartToPlot(input$chartType)
  })
  
  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(failures)
  })
  
  # Generate an HTML table view of the data
  output$tableView <- renderTable({
    #data.frame(x=data())
    head(failures, n=50)
  })
  
})