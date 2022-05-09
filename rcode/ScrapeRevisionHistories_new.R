#GOAL: Scrape the ECFR site for the names and revision histories for the AVAs.



# Loading data ------------------------------------------------------------

#Libraries
library(rvest)
library(xml2)
library(dplyr)
library(httr)
library(jsonlite)
library(tidyverse)


# Last Updated API Return -------------------------------------------------

#URL
url_date<- "https://www.ecfr.gov/api/versioner/v1/versions.json" #This API lets you know when each title was last updated and returns a json file
update.frame<-fromJSON(url_date)%>%as.data.frame() #This line returns the json file turned into a data.frame that is readable
title27_v1<- which(update.frame$title_versions.title==27) #Returns the row in which the update.frame the title 27 is, at the moment it is the row 27,
# but in the future if any changes to the row are made this line will prevent it from returning the incorrect data.
last_update<- update.frame$title_versions.last_updated[title27_v1] #last_update corresponds to the last date in which the title 27 was updated


# JSON from Latest Date ---------------------------------------------------

url_api<- paste0('https://www.ecfr.gov/api/versioner/v1/structure/', last_update, '/title-27.json')#calls the api for the last date updated json hierarchy
ava_json<-read_json(url_api) #reads json file
ava_json<-fromJSON(url_api)%>%as.data.frame()#makes dataframe out of the json
ch1_df<- as.data.frame(ava_json[1,13])#data.frame ofchapter 1
subpartA_df<-as.data.frame(ch1_df[1,7])#data.frame of subpart A
which_part9<- which(subpartA_df$label=='Part 9 - American Viticultural Areas')
part9_df<-as.data.frame(subpartA_df[7,8])
subpartC_df<-as.data.frame(part9_df[4,9])


