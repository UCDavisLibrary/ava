#GOAL: separate AVAs by state to make a .geojson and .shp file set for each state

#Load Libraries
library(geojson)
library(geojsonio)
library(rgdal)
library(zip)

#Set working directory
working.directory<-"C:\\Users\\mmtobias\\Documents\\GitHub\\ava"
setwd(working.directory)

#set temp directory
temp.directory<-"C:/Users/mmtobias/Downloads/avas_by_state"

avas<-geojson_read("avas.geojson", what="sp")

#List of states
states<-c('AR', 'AZ', 'CA', 'CO', 'CT', 'GA', 'IA', 'ID', 'IL', 'IN', 'KY', 'LA', 'MA', 'MD', 'MI', 'MN', 'MO', 'MS', 'NC', 'NJ', 'NM', 'NY', 'OH', 'OR', 'PA', 'RI', 'TN', 'TX', 'VA', 'WA', 'WI', 'WV')

#Loop thought states
for (i in 1:length(states)){
  state.avas<-subset(avas, grepl(states[i], avas$state))
  file.name<-paste(states[i], "avas", sep="_")
  print(file.name)
  print(c(states[i], dim(state.avas)))
  
  #write the geojson file for the state at hand
  geojson_write(state.avas, file=paste(".\\avas_by_state\\", file.name, ".geojson", sep=""), overwrite=TRUE)
  
  #write the shapefile bits to the avas_by_state folder in the temp directory (mine is my downloads folder)
  writeOGR(state.avas, dsn=temp.directory, layer=file.name, driver="ESRI Shapefile", overwrite_layer=TRUE)
  
  #zip the files in the temp directory 
  setwd(temp.directory) #temporarily set the working directory to the temporary folder
  
  zip(zipfile=paste(working.directory, "\\avas_by_state\\", file.name, "_shapefile.zip", sep=""), files=list.files(temp.directory, full.names=FALSE), recurse=FALSE)
  
  #remove the shp bits so the next loop starts with an empty folder
  file.remove(list.files(temp.directory, full.names = TRUE))
  
  setwd(working.directory) #reset the working directory to the working directory
}
