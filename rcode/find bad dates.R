#DATES: go through column 4, check that first 4 chars are digits, if not add row to "datewrong"

# Load packages
library(sf)
library(tidyverse)

# Working directory in ava
avas <- st_read("avas_aggregated_files/avas.geojson")

#create empty dataframe
datewrong <- data.frame(ava_id=character(),created=character())

#for loop to go through avas.geojson 
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

# Go through each ava file in avas folder to detect wrong date format 
# if wrong, ava_id added to "datewrong"
avas_list <- list.files(path="avas", pattern = "*json$", full.names = "TRUE")

# Function that converts each ava to a df
convert_file_to_df <- function(x){
  file = st_read(x) 
  file <- st_transform(file, 4269) # CRS to (EPSG:4269)
  file <- arrange(file, ava_id)
  return(file)
}

#create empty dataframe
datewrong <- data.frame(ava_id=character(),created=character())

#for loop to go through avas.geojson 
for (i in 1:length(avas_list)){
  
  df <- convert_file_to_df(avas_list[i])
  
  date <- df$created
  
  if(isTRUE(substr(date,5,5) != "-")){
    
    temp <- c(df$ava_id[i],df$created[i])
    
    datewrong <- rbind(temp,datewrong)
    
  } else {
    
    if(isTRUE(as.integer(substr(date,6,7)) > 12)){
      
      temp <- c(df$ava_id[i],df$created[i])
      
      datewrong <- rbind(temp,datewrong)
      
    }
  }
  
  
}
