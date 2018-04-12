# getting proj.4 strings for qgis

library(raster)
library(rgdal)

setwd("C:\\Users\\mmtobias\\Documents\\WineData\\Topos\\Yadkin")
topo<-raster("NC_Charlotte_164185_1953_250000_geo.tif")
crs(topo)

#paste the results into the proj.4 string for your topo in the layer properties to set the correct CRS.

#reproject the topo

newcrs<-crs("+init=epsg:4326")

topo4326<-projectRaster(topo, crs=newcrs)

writeRaster(topo4326, 'Charlotte.tif', overwrite=TRUE)
