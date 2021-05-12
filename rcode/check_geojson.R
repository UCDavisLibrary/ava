#This script checks if the geojsons in the avas folder are clockwise, and if so reverses them 
#to fit the RFC 7946 standard of exterior rings = counterclockwise

#install.packages("lwgeom")
library(lwgeom)
library(sf)

#Get file paths
avas <- list.files(path="./avas", pattern = "*json$", full.names = "TRUE")


for(i in 1:length(avas)){
  
  #Check if ava is clockwise
  ava <- st_read(as.character(avas[i]))
  CW <- st_is_polygon_cw(ava)
  
  #For history avas, CW will be a list for all polygons
  #Since they should all have same rotation, we will just check the first entry:
  if(isTRUE(length(CW) > 1)){
    
    #replace list with first entry
    CW <- CW[1]
    
  }
  
  if(isTRUE(CW)){
    
  #Reverses order of clockwise geojson and overwrites old file  
  rev <- st_reverse(ava)
  st_write(rev, avas[i], delete_dsn = TRUE)
    
  }
  
  
}

