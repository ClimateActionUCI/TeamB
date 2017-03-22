library(shiny)

shinyUI(pageWithSidebar(
                        headerPanel("Land Use Change Under Four Different Emissions Scenarios"),
                        sidebarPanel(
                                     sliderInput("year", "Year:",
                                                 min = 2000, max = 2100, step = 25, value = 2000),
                                     selectInput(inputId = "scenario",
                                                 label = "Emissions Scenario:",
                                                 choices = list("Scenario B1" = 1, "Scenario B2" = 2, "Scenario A1B" = 3, "Scenario A2" = 4),
                                                 selected = 1),
                                  img(src="legend.png"))
                                     ),
                        mainPanel(
                                  plotOutput("values", width = "100%", height = "800px"),
                                     )                                           
