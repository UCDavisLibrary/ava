#Change commas to pipes in counties (can be used in states too, change "county" to "state")
#requires packages sf, stringr, rgdal

#CREATE COLLECTION DATAFRAME (optional, finds entries in avas to be fixed)
#commacounties <- data.frame(ava_id=character(),county=character())

for (i in 1:nrow(avas)){
  
  county <- avas$county[i]
  
  if(isTRUE(grepl(",",county))){
    
    #COLLECTION DATAFRAME
    #temp <- c(avas$ava_id[i],avas$county[i])
    #commacounties <- rbind(temp,commacounties)
    
    id <- as.character(avas$ava_id[i])
    
    path <- paste0("avas/",id,".geojson")
    
    avatemp <- readOGR(path)
    
    avatemp$county <- str_replace_all(avatemp$county,", ","|")
    
    file.remove(path)
    
    writeOGR(avatemp,dsn = path, layer = id, driver = "GeoJSON")
  }
}



