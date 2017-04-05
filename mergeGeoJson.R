# This R script combines all the GeoJSON files in a folder into one file, then writes it back to the folder.
# Modified from its original source: https://gist.github.com/wildintellect/582bb1096092170070996d21037b82d8

library(raster)
library(geojsonio)


# probably want to change the pattern to exclude or filter after to drop the all.geojson file
gj <- list.files(path=".", pattern = "*json$", full.names = "TRUE")

# exclude the all.geojson file... probably a more elegant way to do this, but this works:
gj <- gj[gj != "./all.geojson"]
gj <- gj[gj != "./TEMPLATE_AVA.geojson"]

#read all the geojson files with readOGR? or geojsonio package
vects <- lapply(gj, geojson_read, what="sp")


#combine all the vectors together, bind is from the raster package
#probably could just rbind geojson lists too, but thats harder to plot
all <- do.call(bind, vects)
geojson_write(all, file="all.geojson", overwrite=TRUE, convert_wgs84 = TRUE)

# tested 3/30/2017 with 2 geojson polygons -> success -- MicheleTobias 