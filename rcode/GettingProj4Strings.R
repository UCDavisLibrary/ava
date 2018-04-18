# getting proj.4 strings for qgis

library(raster)
library(rgdal)

#set your working directory to the folder you put your topos in:
setwd("C:\\Users\\mmtobias\\Documents\\WineData\\Topos")

#gets the list of all the .tif files in your folder
all.topos <- list.files(path="./Sonoita", pattern = "*.tif$", full.names = "TRUE")

#Lists the name of the .tif and then the proj.4 string for each file
for (i in all.topos){
  topo<-raster(i)
  topo.crs<-crs(topo)
  print(i) 
  print(topo.crs)
}


#paste the results into the proj.4 string for your topo in the layer properties to set the correct CRS.



#reproject the topo if needed... probably the step above will work without having to write a new file.

newcrs<-crs("+init=epsg:4326")

topo4326<-projectRaster(topo, crs=newcrs)

writeRaster(topo4326, 'Charlotte.tif', overwrite=TRUE)
