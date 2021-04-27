

#install.packages("lwgeom")
library(lwgeom)
library(sf)


avas <- list.files(path="./avas", pattern = "*json$", full.names = "TRUE")


for(i in 1:length(avas)){
  
  ava <- st_read(as.character(avas[i]))
  CW <- st_is_polygon_cw(ava)
  
  if(isTRUE(length(CW) > 1)){
    
    CW <- CW[1]
    
  }
  
  if(isTRUE(CW)){
    
  rev <- st_reverse(ava)
  st_write(rev, avas[i], append = FALSE)
    
  }
  
  
}

