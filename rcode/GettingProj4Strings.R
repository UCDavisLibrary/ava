# getting proj.4 strings for qgis

library(raster)
library(rgdal)

setwd("C:\\Users\\mmtobias\\Documents\\WineData\\Topos\\TrinityLakes")
topo<-raster("CA_Papoose Creek_293949_1982_24000_geo.tif")
crs(topo)

#paste the results into the proj.4 string for your topo in the layer properties to set the correct CRS.