library(shiny)
library(ggplot2)
library(ggmap)
library(raster)

shinyServer(function(input,output) {
  
                Fusion = raster('Fusion.tif')
                
                A1B_2025 = raster('Land_Use_2025_A1B.tif')
                A1B_2050 = raster('Land_Use_2050_A1B.tif')
                A1B_2075 = raster('Land_Use_2075_A1B.tif')
                A1B_2100 = raster('Land_Use_2100_A1B.tif')
                
                A2_2025 = raster('Land_Use_2025_A2.tif')
                A2_2050 = raster('Land_Use_2050_A2.tif')
                A2_2075 = raster('Land_Use_2075_A2.tif')
                A2_2100 = raster('Land_Use_2100_A2.tif')
                
                B1_2025 = raster('Land_Use_2025_B1.tif')
                B1_2050 = raster('Land_Use_2050_B1.tif')
                B1_2075 = raster('Land_Use_2075_B1.tif')
                B1_2100 = raster('Land_Use_2100_B1.tif')
                
                B2_2025 = raster('Land_Use_2025_B2.tif')
                B2_2050 = raster('Land_Use_2050_B2.tif')
                B2_2075 = raster('Land_Use_2075_B2.tif')
                B2_2100 = raster('Land_Use_2100_B2.tif')
                
                listB1 = list(Fusion, B1_2025, B1_2050, B1_2075, B1_2100)
                listA2 = list(Fusion, A2_2025, A2_2050, A2_2075, A2_2100)
                listA1B = list(Fusion, A1B_2025, A1B_2050, A1B_2075, A1B_2100)
                listB2 = list(Fusion, B2_2025, B2_2050, B2_2075, B2_2100)
  
                all_matrix = rbind(listB1, listB2, listA1, listA2)
              
                output$values = renderPlot({
                  print(input$scenario)
                  print(input$scenario)
                  mat_row = as.numeric(input$scenario)
                  mat_col = 1 + (as.numeric(input$year) - 2000) / 25
                  temp = all_matrix[mat_row, mat_col][[1]]
                  raster::plot(temp)
                  })

                output$preImage = renderImage({
                    filename = "legend.png"
                    list(src = filename,
                    alt = paste("Legend"))
                    }, deleteFile = FALSE)
})
