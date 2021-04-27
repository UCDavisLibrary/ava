

install.packages("lwgeom")
library(lwgeom)
library(sf)
library(rgdal)

avas <- list.files(path="./avas", pattern = "*json$", full.names = "TRUE")
listCW <- list()

for(i in 1:length(avas)){
  
  ava <- st_read(as.character(avas[i]))
  st_is_polygon_cw(ava)
  listCW <- c(listCW, CW)
}

