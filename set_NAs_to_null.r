# This R script combines all the GeoJSON files in a folder into one file, then writes it back to the folder.
# Modified from its original source: https://gist.github.com/wildintellect/582bb1096092170070996d21037b82d8

library(raster)
library(geojsonio)
library(rgdal)

#set you working directory first with setwd()

avaname = "willow_creek"
filename= paste(avaname,".geojson", sep="")

#read all the geojson files
newava<-geojson_read(filename, what = "sp")


#all<- lapply(data.frame(all, stringsAsFactors = FALSE), function(x) {gsub("N/A", NA, x)})
newava@data[newava@data=="N/A"]<- NA
geojson_write(newava, file=filename, overwrite=TRUE, convert_wgs84 = TRUE)
