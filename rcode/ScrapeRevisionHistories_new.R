#GOAL: Scrape the ECFR site for the names and revision histories for the AVAs.



# Loading data ------------------------------------------------------------

#Libraries
library(rvest)
library(xml2)
library(dplyr)
library(httr)
library(jsonlite)
library(tidyverse)
library(purrr)


# Last Updated API Return -------------------------------------------------

#URL
url_date<- "https://www.ecfr.gov/api/versioner/v1/versions.json" #This API lets you know when each title was last updated and returns a json file
update.frame<-fromJSON(url_date)%>%as.data.frame() #This line returns the json file turned into a data.frame that is readable
title27_v1<- which(update.frame$title_versions.title==27) #Returns the row in which the update.frame the title 27 is, at the moment it is the row 27,
# but in the future if any changes to the row are made this line will prevent it from returning the incorrect data.
last_update<- update.frame$title_versions.last_updated[title27_v1] #last_update corresponds to the last date in which the title 27 was updated

# JSON from Latest Date ---------------------------------------------------

url_api<- paste0('https://www.ecfr.gov/api/versioner/v1/structure/', last_update, '/title-27.json')#calls the api for the last date updated json hierarchy

ava_json<-fromJSON(url_api)#reads json file from API returning the hierarchy of title 27
subpartC<-ava_json$children$children[[1]]$children[[1]]$children[[7]]$children[[4]]#returns a data frame with the names of all the avas by order in the website 

subpartC<-subpartC[2:nrow(subpartC),] #getting rid of general section 9.21
#The portion above is a simplified process of what is commented out below, to get the names fromJSON seems to return slightly better results than read_json
#if for any reasons the structure of the json changes, the code below can be used to try and find the names again.

# ava_json<-read_json(url_api) #reads json file
# ava_json<-fromJSON(url_api)%>%as.data.frame()#makes dataframe out of the json
# ch1_df<- as.data.frame(ava_json[1,13])#data.frame ofchapter 1
# subpartA_df<-as.data.frame(ch1_df[1,7])#data.frame of subpart A
# which_part9<- which(subpartA_df$label=='Part 9 - American Viticultural Areas')
# part9_df<-as.data.frame(subpartA_df[7,8])
# subpartC_df<-as.data.frame(part9_df[4,9]) #This contains the names of all the avas by order, will be used to match the revision string to the ava.
 

# Working with XML from API -----------------------------------------------


url_xml<- paste0('https://www.ecfr.gov/api/versioner/v1/full/', last_update, '/title-27.xml?part=9&subpart=C')#calls the api for the last date updated xml

XML_API<- read_xml(url_xml) #reads the xml from the API call

XML_CITA<-xml_find_all(XML_API, './/CITA|.//SECAUTH')%>%xml_text()%>%as_tibble() # gets all the CITA (revision strings) from the XML and 9.126 which has a 'secauth' divisor 

#The reason why I did not use the XML to find the names is that the xml class head is used for the names as well as other variables on the file, so it would require extra cleaning
# XML_CITA<-XML_CITA[1:nrow(rev_strings),]

# CFR Revision Data Frame -------------------------------------------------


current_cita<-data.frame(subpartC$label_level, subpartC$label_description, XML_CITA$value) #creates df with current cfr ava section name and revision string
colnames(current_cita)<-c('section', 'ecfr_name','revision_string_eCFR')#changes the names of the columns to make more sense, ecfr_name refers to the name on ecfr

# NOTE: revision string and CITA are used interchangeable on this script because the class for the xml nodes corresponding to the revision strings are CITA

current_cita$ecfr_name<-gsub(".","",current_cita$ecfr_name, fixed = TRUE) #removes period to be able to match the CFR data frame with the geojson data frame by name of the ava

current_cita$ecfr_name<-gsub("AVA","",current_cita$ecfr_name, fixed = TRUE) #removes period to be able to match the CFR data frame with the geojson data frame by name of the ava

# avas from our geojson file -----------------------------------------------------

avas <- list.files(path="./avas", pattern = "*json$", full.names = "TRUE") #lists to the avas path

rev_strings<-data.frame(matrix(ncol = 3, nrow = 0))

for (l in 1:length(avas)){
  x<-read_json(avas[l])
  y<-x$features[[1]]$properties
  z<-data.frame(y$name, y$cfr_revision_history,y$cfr_index)
  rev_strings<-rbind.data.frame(rev_strings,z)
}

colnames(rev_strings)<-c('geo_name', 'cfr_revision_history', 'cfr_index') 
#geo_name refers to the name found in the geojson files, cfr_revision_history and cfr_index are also from the geojson files

# Cleaning names and rev strings ------------------------------------------

rev_strings$geo_name<-gsub("'","'",rev_strings$geo_name, fixed = TRUE) 
#changes the quotation mark to fit with the quotation mark the cfr uses
rev_strings$geo_name<-gsub("AVA","",rev_strings$geo_name, fixed = TRUE)%>% str_trim()
#removes the AVA from the names + gets rid of whitespaces at the end
rev_strings$geo_name<-gsub(".","",rev_strings$geo_name, fixed = TRUE)
#removes period to be able to match the CFR data frame with the geojson data frame by name of the ava
rev_strings$geo_name<-gsub(",","",rev_strings$geo_name, fixed = TRUE)
#removes comma to be able to match the CFR data frame with the geojson data frame by name of the ava
current_cita$ecfr_name<-gsub(",","",current_cita$ecfr_name)%>%str_trim()
current_cita$section<-gsub("§","",current_cita$section)%>%str_trim()
# New Avas  ---------------------------------------------------------------

new_avas<-current_cita[nrow(rev_strings):nrow(XML_CITA),]

# Comparing the current_cita with our rev_strings -----------------

current_cita<-current_cita[1:nrow(rev_strings),] #Matches the lengths of the ecfr website data frame to the ones we have.

compared_revisions<-merge(rev_strings,current_cita, by.x="cfr_index", by.y="section", all.x = TRUE, all.y = TRUE)

compared_revisions$revision_string_eCFR<-gsub(" ","",compared_revisions$revision_string_eCFR, fixed = TRUE)# remove spaces from our revision strings
compared_revisions$cfr_revision_history<-gsub(" ", "", compared_revisions$cfr_revision_history, fixed = TRUE) # remove spaces from the cfr revision strings

compared_revisions[is.na(compared_revisions)]<-'MISSING'#replaces NAs with the word 'MISSING' which is useful to match the strings with loop

for (i in 1:nrow(compared_revisions)){
  if (compared_revisions$cfr_revision_history[[i]]==compared_revisions$revision_string_eCFR[[i]]){
    compared_revisions$sameas_cfr_string[[i]]= 'TRUE'
  }
  if(compared_revisions$cfr_revision_history[[i]]!=compared_revisions$revision_string_eCFR[[i]]){
    compared_revisions$sameas_cfr_string[[i]]= 'FALSE'
  }
}

# Non-matched output ------------------------------------------------------

false_rows<-which(compared_revisions$sameas_cfr_string==FALSE) #returns the number of rows with the avas that need updating

nonmatching<-compared_revisions[false_rows,] %>% as.data.frame() #returns the avas that need updating

nonmatching$sameas_cfr_string<-as.character(nonmatching$sameas_cfr_string) #making sure that they are a character type so it can be outputted as a csv files

write.csv(x=nonmatching, file="./avas_aggregated_files/need_updating_avas.csv", row.names = FALSE)
