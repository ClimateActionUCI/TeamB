library(shiny)

shinyUI(pageWithSidebar(
                        headerPanel("Land Use Change Under Two Different Emissions Scenarios"),
                        sidebarPanel(
                                     sliderInput("year", "Year:",
                                                 min = 1, max = 5, step = 1, value = 1),
                                     selectInput(inputId = "scenario",
                                                 label = "Emissions Scenario:",
                                                 choices = c(1,2),
                                                 selected = 1)),
                        mainPanel(verbatimTextOutput("values"))
                                     ))                                                 
