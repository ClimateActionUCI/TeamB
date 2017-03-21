library(shiny)
library(ggplot2)
library(ggmap)

shinyServer(function(input,output) {
                matA1 = matrix(rnorm(9),3,3)
                matA2 = matrix(rnorm(9),3,3)
                matA3 = matrix(rnorm(9),3,3)
                matA4 = matrix(rnorm(9),3,3)
                matA5 = matrix(rnorm(9),3,3)
                matB1 = matrix(rnorm(9),3,3)
                matB2 = matrix(rnorm(9),3,3)
                matB3 = matrix(rnorm(9),3,3)
                matB4 = matrix(rnorm(9),3,3)
                matB5 = matrix(rnorm(9),3,3)

                matA_v = list(matA1, matA2, matA3, matA4, matA5)
                matB_v = list(matB1, matB2, matB3, matB4, matB5)

                all_matrix = rbind(matA_v, matB_v)
                
                select_matrix = reactive({
                  print(input$scenario)
                  mat_row = as.numeric(input$scenario)
                  mat_col = as.numeric(input$year)
                  all_matrix[mat_row, mat_col]
                })
      
      output$values <- renderPrint(select_matrix())
})      
