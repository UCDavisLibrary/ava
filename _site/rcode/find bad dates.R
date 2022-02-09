#DATES: go through column 4, check that first 4 chars are digits, if not add row to "datewrong"

#uses sf package

avas <- st_read("avas.geojson")

#create empty dataframe
datewrong <- data.frame(ava_id=character(),created=character())

#for loop to go through avas
for (i in 1:nrow(avas)){
  
  date <- avas$created[i]
  
  if(isTRUE(substr(date,5,5) != "-")){
    
    temp <- c(avas$ava_id[i],avas$created[i])
    
    datewrong <- rbind(temp,datewrong)
    
  } else {
    
    if(isTRUE(as.integer(substr(date,6,7)) > 12)){
      
      temp <- c(avas$ava_id[i],avas$created[i])
      
      datewrong <- rbind(temp,datewrong)
      
    }
  }
  
  
}
