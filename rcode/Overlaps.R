#GOAL:  Write a script that identifies which AVA polygons overlap other polygons
# and creates a new column in each file containing the overlapping AVAs. 

#Identify the Overlapping AVA --------------------------------------------------

#Load Libraries 
library(geojson)
library(geojsonio)
library(geojsonsf)
library(sf)
library(tidyverse)
library(dplyr)

# Set Working Directory 

# setwd("/Users/sonal/Documents/Documents - Sonal’s MacBook Pro/ava")

# read avas 
avas<-st_read("avas_aggregated_files/avas.geojson")

#overlap avas 
overlap = st_overlaps(avas)

#Replace indexes of avas with the ava_id 
for (i in 1:length(overlap)){
  
  #isolate the indexes 
  overlaps_index = overlap[[i]]
  
  #replace inexes with the corresponding ava_id with the same index 
  overlap[[i]] <- avas$ava_id[overlaps_index]
} 

#Create a new data frame to organize overlap data 
overlap.data <- data.frame(overlap)
colnames(overlap.data) <- c("ava", "overlaps")

# The value in overlap.data$ava decides the index of avas$ava_id that we want to print in overlap.data$ava 
overlap.data$ava <- avas$ava_id[overlap.data$ava]


# Write as a csv file (So that we can store our overlaps separately, or we can remove this alltogether)
write.csv(overlap.data, "avas_aggregated_files/ava_overlap_IDS.csv", row.names = FALSE)

#Create Overlap Column with updated Overlaps------------------------------------

#list all ava files 
avas.list = list.files("avas", full.names = "TRUE") 

#read all ava files as sf object 
vectsf <- lapply(avas.list, read_sf) 

# Read in overlap data frame (Change this to your path)
overlap.data = read.csv("/Users/sonal/Documents/Documents - Sonal’s MacBook Pro/ava/avas_aggregated_files/ava_overlap_IDS.csv")

# find the overlapping avas for each ava using the overlap.data data frame 
for (i in 1:length(vectsf)){
  #create an character empty vector 
  vectsf[[i]]$overlaps = c("")
  
  #find the indexes of the sf ava ids with the overlap data frame ava ids 
  matches <- which(overlap.data$ava == vectsf[[i]]$ava_id) 
  
  # tells us the name of the overlapping ava(s)
  overlap = overlap.data$overlaps[matches] 
  
  #If we want the actual geojson file inside it: 
  # vectsf[[i]]$overlaps <- paste0(overlap, ".geojson") | not sure if we want this format 
  
  #Place names of overlapping avas in the new column
  vectsf[[i]]$overlaps = list(overlap)  
  
  #Change the overlapping column from a list to a character vector 
  overlap_string <- sapply(vectsf[[i]]$overlaps, function(x) paste(sort(x), collapse = "| "))
  
  #Put this vector back in the overlaps column 
  vectsf[[i]]$overlaps <- overlap_string 
} 


#Write updated files with Overlap column back into original files. 

for (i in 1:length(vectsf)){
  st_write(vectsf[[i]], avas.list[i], delete_dsn = TRUE)
}










