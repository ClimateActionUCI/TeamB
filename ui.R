library(shiny)

shinyUI(pageWithSidebar(
                        headerPanel("Land Use Change Under Two Different Emissions Scenarios"),
                        sidebarPanel(
                                     sliderInput("year", "Year:",
                                                 min = 2000, max = 2100, step = 25, value = 2000),
                                     selectInput(inputId = "scenario",
                                                 label = "Emissions Scenario:",
                                                 choices = c(1,2),
                                                 selected = 1)),
                        #mainPanel(verbatimTextOutput("values"))
                        mainPanel(plotOutput("values", width = "100%", height = "800px"))
                                     ))                                                 
