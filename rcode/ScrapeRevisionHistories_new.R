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

subpartC<-subpartC[2:262,] #getting rid of general section 9.21
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
XML_CITA<-XML_CITA[1:nrow(subpartC),]

# CFR Revision Data Frame -------------------------------------------------


current_cita<-data.frame(subpartC$label_level, subpartC$label_description, XML_CITA$value) #creates df with current cfr ava section name and revision string
colnames(current_cita)<-c('section', 'ava_name','revision_string_current')#changes the names of the columns to maje more sense

# NOTE: revision string and CITA are used interchangeable on this script because the class for the xml nodes corresponding to the revision strings are CITA

current_cita$ava_name<-gsub(".","",current_cita$ava_name, fixed = TRUE) #removes period to be able to match the CFR data frame with the geojson data frame by name of the ava

current_cita$ava_name<-gsub("AVA","",current_cita$ava_name, fixed = TRUE) #removes period to be able to match the CFR data frame with the geojson data frame by name of the ava

# CITA from our geojson file -----------------------------------------------------

avas_geojson<-fromJSON("./avas_aggregated_files/avas.geojson")#reads the geojson file from the avas_aggregated files

avas_complete_df<-avas_geojson$features$properties #contains a data_fram of all the ava info inside of the geojson

rev_stings<- avas_complete_df[,c(2, 13)] #data frame which contatins only the name and the revision string


# Cleaning names and rev strings ------------------------------------------

rev_stings$name<-gsub("'","'",rev_stings$name, fixed = TRUE) 
#changes the quotation mark to fit with the quotation mark the cfr uses
rev_stings$name<-gsub("AVA","",rev_stings$name, fixed = TRUE)%>% str_trim()
#removes the AVA from the names + gets rid of whitespaces at the end
rev_stings$name<-gsub(".","",rev_stings$name, fixed = TRUE)
#removes period to be able to match the CFR data frame with the geojson data frame by name of the ava
rev_stings$name<-gsub(",","",rev_stings$name, fixed = TRUE)
#removes comma to be able to match the CFR data frame with the geojson data frame by name of the ava
current_cita$ava_name<-gsub(",","",current_cita$ava_name)%>%str_trim()

# Comparing the current_cita with our rev_stings -----------------

compared_revisions<-merge(rev_stings,current_cita, by.x="name", by.y="ava_name", all.x = TRUE)

compared_revisions$revision_string_current<-gsub(" ","",compared_revisions$revision_string_current, fixed = TRUE)# remove spaces from our revision strings
compared_revisions$cfr_revision_history<-gsub(" ", "", compared_revisions$cfr_revision_history, fixed = TRUE) # remove spaces from the cfr revision strings
order(compared_revisions$section, increasing= TRUE)

for (i in 1:261){
  if (is.na(compared_revisions$cfr_revision_history[[i]])){
    compared_revisions$cfr_revision_history[[i]]='MISSING'
  }
  if (compared_revisions$cfr_revision_history[[i]]==compared_revisions$revision_string_current[[i]]){
    compared_revisions$sameas_cfr_string[[i]]= 'TRUE'
  }
  if(compared_revisions$cfr_revision_history[[i]]!=compared_revisions$revision_string_current[[i]]){
    compared_revisions$sameas_cfr_string[[i]]= 'FALSE'
  }
}     
#west sonoma and obispo? 
false_rows<-which(compared_revisions$sameas_cfr_string==FALSE) #returns the number of rows with the avas that need updating

nonmatching<-compared_revisions[false_rows,] %>% as.data.frame() #returns the avas that need updating

nonmatching$sameas_cfr_string<-as.character(nonmatching$sameas_cfr_string)

write.csv(x=nonmatching, file="./avas_aggregated_files/need_updating_avas.csv", row.names = FALSE)
