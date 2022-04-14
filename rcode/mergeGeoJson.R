# This R script combines all the GeoJSON files in a folder into one file, then writes it back to the folder.
# Modified from its original source: https://gist.github.com/wildintellect/582bb1096092170070996d21037b82d8
# Version 2 rewritten to us sf which is way faster, comparison at the link above

library(sf)
library(dplyr)
library(rgdal)
library(lwgeom)
library(geojsonsf)

# probably want to change the pattern to exclude or filter after to drop the all.geojson file
# AVAs folder contains the completed AVA boundaries
# TBD folder contains the boundaries waiting to be completed - it will be empty once all of the AVAs are completed
avas <- list.files(path="./avas", pattern = "*json$", full.names = "TRUE")
tbd <- list.files(path="./tbd", pattern = "*json$", full.names = "TRUE")

gj <- c(avas, tbd)

# exclude the all.geojson file... probably a more elegant way to do this, but this works:
gj <- gj[gj != "./avas.geojson"]
gj <- gj[gj != "./tbd/avas.geojson"]

# mark the start time so we can calculate how long it takes to run the process
c <- Sys.time()

# gread the geojson files
vectsf <- lapply(gj, read_sf)

#Bug, if date field has NA it's a char but valid dates are doubles, can't bind those
#Option convert after reading to char, or read as char to begin with
vectsf2 <- lapply(vectsf, function(d){
  d$created <- as.character(d$created)
  return(d)
  })

# put the polygons into one table
allsf <- do.call(rbind, vectsf2)

# replace N/A with NA
allsf <- mutate_if(allsf, is.character, gsub, pattern="N/A", replacement=NA) 

# replace blanks with NA in the valid_end column
allsf$valid_end[allsf$valid_end=='']<-NA

# calculate the area of the polygons
allsf$area <- st_area(allsf)

# arrange the polygons so the smaller ones are on top
allsf <- arrange(allsf,desc(area))

#write_sf(allsf, dsn="avas.geojson", driver="GeoJSON", delete_dsn=TRUE)
#geojson_write(allsf, file="avas-sf.geojson", overwrite=TRUE, convert_wgs84 = TRUE)


# Separate the current & historic AVAs ---------------------------------
setwd("C:/Users/mmtobias/Documents/GitHub/ava/avas_aggregated_files")

current.avas<-allsf[which(is.na(allsf$valid_end)),]
write_sf(current.avas, dsn="avas.geojson", driver="GeoJSON", delete_dsn=TRUE)

historic.avas<-allsf[which(nchar(allsf$valid_end)>0),]
write_sf(historic.avas, dsn="avas_historic.geojson", driver="GeoJSON", delete_dsn=TRUE)

write_sf(allsf, dsn="avas_allboundaries.geojson", driver="GeoJSON", delete_dsn=TRUE)


# Write JS file -----------------------------------------------------------

txt<-sf_geojson(current.avas) #this isn't writing the attribute table correctly
js=paste0("var avas =", txt)
writeLines(js, "avas.js")


#how long did it take?
d <- Sys.time()
paste("This process finished in", d-c)
