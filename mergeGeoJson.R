# This R script combines all the GeoJSON files in a folder into one file, then writes it back to the folder.
# Modified from its original source: https://gist.github.com/wildintellect/582bb1096092170070996d21037b82d8

library(raster)
library(geojsonio)
library(rgdal)

# probably want to change the pattern to exclude or filter after to drop the all.geojson file
avas <- list.files(path="./avas", pattern = "*json$", full.names = "TRUE")
tbd <- list.files(path="./tbd", pattern = "*json$", full.names = "TRUE")

gj <- c(avas, tbd)

# exclude the all.geojson file... probably a more elegant way to do this, but this works:
gj <- gj[gj != "./avas.geojson"]
gj <- gj[gj != "./tbd/avas.geojson"]

#read all the geojson files
vects <- lapply(gj, geojson_read, what="sp")

#combine all the vectors together, bind is from the raster package
#probably could just rbind geojson lists too, but thats harder to plot
all <- do.call(bind, vects)

#Change any "N/A" data to nulls
all@data[all@data=="N/A"]<- NA

geojson_write(all, file="avas.geojson", overwrite=TRUE, convert_wgs84 = TRUE)
