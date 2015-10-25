library(shiny)


shinyUI(
  #Top level Navigation
  navbarPage("Errors Visualizer",
    # Homer tab.
    tabPanel("Home",
             h3("Batch Job Errors"),
             hr(),
      sidebarLayout(
        sidebarPanel(
          h4("Choose prompt, single"),
          radioButtons("chartType", label = "Select Type of Report:",
                       choices = list("Total Failures per Week" = 1, "Heat Map of Failures by Batch Job" = 2, "Job Failure Frequency by Week day" = 3), 
                       selected = 1),
          
          hr()

        ),

        mainPanel(
          tabsetPanel(type = "tabs", 
                      tabPanel("Plot", 
                               plotOutput("plotComesHere")), 
                      tabPanel("Summary", 
                               verbatimTextOutput("summary")), 
                      tabPanel("Table", 
                               tableOutput("tableView")),
                      tabPanel("About", 
                               "This is application is intended to help visualize the source of Batch Job Errors. It takes as input three radio buttons corresponding to three distinct charts that it can produce to dispay different characteristics of the dataset. Using the application is straight forward. Simply choose the type of chart you wish to display. The takes your input and create a chart corresponding to that input.")
          )
        )
      )
    ),

    # Second tab.
    tabPanel("Help",
             "This is a simple app that needs no extensive tutorial on how to use it. However, to fulfill the requirements of the course, here is how to use it. First decide on which Report or Chart you wish to view. Only three options here so its not rocket science. Select the radio button corresponding to the chart you wish to look at. Voila!! Should you wish to look at the summary statistics for the dataset click on the 'Summary' tab. A short table view of the data is also provided in the 'Table' tab. Finally, If you would like some information about the app visit the 'About' tab. Please note that the app was designed for 30 inch monitors. If you happen to be using a smaller monitor, squinting is very much encouraged."
    )
  )
)