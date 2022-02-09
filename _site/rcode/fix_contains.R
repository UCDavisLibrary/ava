#Replace commas and delete state abbr in within/contains

#uses packages sf, stringr, rgdal

#CREATE COLLECTION DATAFRAME (optional, finds entries in avas to be fixed)
#commas <- data.frame(ava_id=character(),county=character())

avas <- st_read("avas.geojson")

for (i in 1:nrow(avas)){
  
  contains <- avas$contains[i]
  
  id <- as.character(avas$ava_id[i])
  
  path <- paste0("avas/",id,".geojson")
  
  avatemp <- readOGR(path)
  
  #replace commas with pipes
  if(isTRUE(grepl(", ",contains))){
    
    #COLLECTION DATAFRAME
    #temp <- c(avas$ava_id[i],avas$contains[i])
    #commas <- rbind(temp,commas)
    
    avatemp$contains <- str_replace_all(avatemp$contains,", ","|")
    
  }
  
  #search for parentheses with date abbreviations inside
  if (isTRUE(grepl("\\(",contains))){
    
    #COLLECTION DATAFRAME
    #temp <- c(avas$ava_id[i],avas$contains[i])
    #commas <- rbind(temp,commas)
    
    #find all locations of open parentheses and convert to DF
    openpar <- str_locate_all(contains,"\\(")
    OPdf <- as.data.frame(openpar[1])
    #find all locations of close parentheses and convert to DF
    closepar <- str_locate_all(contains,"\\)")
    CPdf <- as.data.frame(closepar[1])
    
    #creates empty list to be populated by for loop
    abb <- list()
    
    #for each open parentheses, creates substring of section from ( to )
    #adds \\ so parentheses don't break things
    for(i in 1:nrow(OPdf)){
      
      abb[i] <- substr(contains, OPdf$start[i], CPdf$start[i])
    
      abbL = nchar(abb[i])
    
      abb[i] <- paste0("\\",substr(abb[i],1,abbL-1),"\\",substr(abb[i],abbL,abbL))
    
    }
  
    for(i in 1:length(abb)){
      
      abbC <- as.character(abb[i])
      avatemp$contains <- str_remove(avatemp$contains,abbC)
      
    }
   
   #remove any left over spaces
   avatemp$contains <- str_replace_all(avatemp$contains,"  \\|", "\\|")
   avatemp$contains <- str_replace_all(avatemp$contains," \\|", "\\|")
  
  }
  
  file.remove(path)
  
  writeOGR(avatemp,dsn = path, layer = id, driver = "GeoJSON")
  
}


