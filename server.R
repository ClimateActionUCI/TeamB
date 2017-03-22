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
                
                A1B_2025 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2025_A1B.tif')
                A1B_2050 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2050_A1B.tif')
                A1B_2075 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2075_A1B.tif')
                A1B_2100 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2100_A1B.tif')
                
                A2_2025 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2025_A2.tif')
                A2_2050 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2050_A2.tif')
                A2_2075 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2075_A2.tif')
                A2_2100 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2100_A2.tif')
                
                B1_2025 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2025_B1.tif')
                B1_2050 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2050_B1.tif')
                B1_2075 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2075_B1.tif')
                B1_2100 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2100_B1.tif')
                
                B2_2025 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2025_B2.tif')
                B2_2050 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2050_B2.tif')
                B2_2075 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2075_B2.tif')
                B2_2100 = raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_Use_2100_B2.tif')
                
                matA_v = list(Fusion, B1_2025, B1_2050, B1_2075, B1_2100)
                matB_v = list(Fusion, A2_2025, A2_2050, A2_2075, A2_2100)

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
                  mat_col = 1 + (as.numeric(input$year) - 2000) / 25
                  temp = all_matrix[mat_row, mat_col][[1]]
                  raster::plot(temp)
                  })
                #output$values <- plot(select_matrix())
})      
