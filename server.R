library(shiny)
library(ggplot2)
library(ggmap)
library(raster)

#Land <- raster("Fusion")

shinyServer(function(input,output) {
                #matA1 = matrix(rnorm(9),3,3)
                #matA2 = matrix(rnorm(9),3,3)
                #matA3 = matrix(rnorm(9),3,3)
                #matA4 = matrix(rnorm(9),3,3)
                #matA5 = matrix(rnorm(9),3,3)
                #matB1 = matrix(rnorm(9),3,3)
                #matB2 = matrix(rnorm(9),3,3)
                #matB3 = matrix(rnorm(9),3,3)
                #matB4 = matrix(rnorm(9),3,3)
                #matB5 = matrix(rnorm(9),3,3)
  
                Fusion = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Fusion.tif')

                matA_v = list(Fusion)
                matB_v = list(Fusion)

                #matA_v = list(matA1, matA2, matA3, matA4, matA5)
                #matB_v = list(matB1, matB2, matB3, matB4, matB5)
  
                all_matrix = rbind(matA_v, matB_v)
                
                #select_matrix = reactive({
                #  print(input$scenario)
                #  mat_row = as.numeric(input$scenario)
                #  mat_col = as.numeric(input$year)
                #  all_matrix[mat_row, mat_col]
                #})
        
      
      #output$values <- renderPlot({plot(select_matrix()}), width = "100%", height = "400px")
                output$values <- renderPlot({
                  print(input$scenario)
                  print(input$scenario)
                  mat_row = as.numeric(input$scenario)
                  mat_col = as.numeric(input$year)
                  temp = all_matrix[mat_row, mat_col][[1]]
                  raster::plot(temp)
                  })
                #output$values <- plot(select_matrix())
})      
