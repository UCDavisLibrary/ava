# This R script combines all the GeoJSON files in a folder into one file, then writes it back to the folder.
# Modified from its original source: https://gist.github.com/wildintellect/582bb1096092170070996d21037b82d8


# TODO 
# try reading each list and then combining them 

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

#read all the geojson files with readOGR? or geojsonio package
avavects  <- lapply(avas, FUN=geojson_read, what="sp")
vects  <- c()

for (i in gj){
  tbdi <- geojson_read(i, what="sp")
  #tbdogr<-ogrInfo(tbdi)
  #tbdlint<-lint(tbdi)
  vects <- c(vects, tbdi)
  #print(tbdogr)
}

vects <- lapply(gj, geojson_read, what="sp")


#combine all the vectors together, bind is from the raster package
#probably could just rbind geojson lists too, but thats harder to plot
all <- do.call(bind, vects)
geojson_write(all, file="avas.geojson", overwrite=TRUE, convert_wgs84 = TRUE)

# tested 3/30/2017 with 2 geojson polygons -> success -- MicheleTobias 