library(sp)
library(raster)
library(rgdal)
library(plyr)

map <- raster('D:/Estudos/UCI PhD/CATP 2017/Project/TeamB-master/Land_use.tif')
#plot(map)
#map

new.extent <- extent(-2357953, -1584494, 1217459.4, 2538997) #CA box coords
#new.extent
map_test_crop <- crop(map,new.extent)
#plot(map_test_crop)
#str(map_test_crop)

cali<-readOGR('D:/Estudos/UCI PhD/CATP 2017/Project/CA_state/CA_state copy') #From http://rpubs.com/collnell/CATwrangling
#plot(cali)

#Rotation of California boudaries map
csd <- spTransform(cali,CRSobj=CRS("+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0"))
#plot(csd) 

#Overlapping maps
Fusion <- mask(map_test_crop,csd)
Fusion <- trim(Fusion)
#plot (Fusion)

#writeRaster(Fusion, "TeamB-master/Land_Use")