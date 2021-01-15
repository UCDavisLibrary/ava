#Script for producing county field from shapefile (when info not found in CFR)

#BEFORE RUNNING: 
#1.Download US counties shapefile: https://catalog.data.gov/dataset/tiger-line-shapefile-2017-nation-u-s-current-county-and-equivalent-national-shapefile
#2.Load into QGIS and select counties that overlap AVA with Vector>Research Tools>Select by Location...
#3.Save new shapefile (right click counties layer, Export>Save selected features as...) 
# to R working directory, name it "SelectByLocationCounties.shp"
#4.Install and load "sf" and "clipr" packages

#reads shapefile
counties <- st_read("SelectByLocationCounties.shp")

#new dataframe with county names in alphabetical order
alpha <- counties[order(counties$NAME),5]

#creates empy character object county_str
county_str <- ""

#for loop adds each county name to county_str, seperated by pipe "|"
for (i in 1:nrow(alpha)){
  
  #access ith county name
  county <- as.character(alpha$NAME[i])
  #add ith county name to county  with a pipe in front
  county_str <- paste(county_str, county, sep = "|")
  
}

#remove pipe at beginning of county_str
county_str <- substring(county_str, 2)

#copy final result to clipboard for pasting in QGIS attribute table
write_clip(county_str)
