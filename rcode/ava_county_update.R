# Goal: Compare county of each individual ava.geojson file with the census county shapefile 
# and output a list of updates in the 'county' column that need to be made

# Packages used
library(sf)
sf_use_s2(FALSE)
library(dplyr)
library(ggplot2)
library(stringr)

## Read and transform county shapefile from 
# https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html
county_shp <- read_sf("~/Downloads/tl_2021_us_county/tl_2021_us_county.shp")
county_shp <- st_transform(county_shp, 4269) # CRS to (EPSG:4269)

## Read and transform each avas.geojson file 
# avas folder contains each individual completed AVA boundaries
avas <- list.files(path="~/git/AVA/avas", pattern = "*json$", full.names = "TRUE")

## Function that converts ava .geojson to a df
convert_file_to_df <- function(x){
  file = st_read(x) 
  file <- st_transform(file, 4269) # CRS to (EPSG:4269)
  file <- arrange(file, ava_id)
  return(file)
}

# test
#file = convert_file_to_df(avas[183]) 

## Function that intersects ava with county shapefile & creates a new df for subsetting 
create_AVAarea <- function(file){
  int <- st_intersection(file, county_shp)
  AVAarea <- data.frame(ava_id=int$ava_id, new_area=as.numeric(st_area(int)), county=int$NAME)
  AVAarea <- arrange(AVAarea, ava_id, county)
  count <- AVAarea %>% count(ava_id)
  AVAarea <- AVAarea %>% 
    left_join(count %>% mutate(n = count$n))
  return(AVAarea)
}

# AVAarea <- create_AVAarea(file)

## Remove rows (counties) that has an area less than 1x10^7 (sliver)
# Include the county if there is only one row (county) per ava
# AVAarea1 <- subset(AVAarea, (new_area >= 10000000 & n > 1) | (n==1)) 

## Unclear sliver range: 1x10^6 - 1x10^7 (could be a sliver or part of an AVA)
# For loop that prints out rows that are within an unclear sliver range and if the county was in the original file, keep the county
#for (i in 1:nrow(AVAarea)) {
#  if (AVAarea[i,4] != 1) {
#    if (AVAarea[i,2] >= 1000000 & AVAarea[i,2] < 10000000) {
#      if (sum(str_detect(file$county, AVAarea[i,3])) > 0) {
#        print(AVAarea[i,])
#        AVAarea1 <- rbind(AVAarea1, AVAarea[i,])
#      }
#    }
#  }
#}

## Split counties group by ava_id
#lst = split(AVAarea1$county, AVAarea1$ava_id)

## Function that adjust format
format_county <- function(lst){
  df_total = data.frame()
  for (i in 1:length(lst)) {
    county <- paste(lst[[i]], collapse = "|")
    ava_id <- names(lst[i])
    df <- data.frame(ava_id, county) 
    df_total <- rbind(df_total,df)
  }
  return(df_total)
}

# df_total <- format_county(lst)

## Replace county column in original avas df
# file$county <- df_total$county

## Arrange rows (with history) in chronological order # used valid_start
# file <- file[order(as.Date(file$valid_start, format="%Y-%m-%d")),]

## Replace updated county in file
# write_sf(file, dsn=avas1[221], driver="GeoJSON", delete_dsn=TRUE)

### Final loop
# Method: loop through each .geojson -> find int area -> determine if its an ava county -> clean format -> add back into original file
# Combined all the functions + loops mentioned above in order
old_vs_new <- data.frame()

avas1 = avas
for (i in 1:length(avas1)){
  print(avas1[i])
  file <- convert_file_to_df(avas1[i])
  AVAarea <- create_AVAarea(file)
  AVAarea1 <- subset(AVAarea, (new_area >= 10000000 & n > 1) | (n==1))
  for (i in 1:nrow(AVAarea)) {
    if (AVAarea[i,4] != 1) {
      if (AVAarea[i,2] >= 1000000 & AVAarea[i,2] < 10000000) {
        if (sum(str_detect(file$county, AVAarea[i,3])) > 0) {
          print(AVAarea[i,])
          AVAarea1 <- rbind(AVAarea1, AVAarea[i,])
        }
      }
    }
  }
  lst <- split(AVAarea1$county, AVAarea1$ava_id)
  df_total <- format_county(lst) # new counties from the script
  new_file <- file[order(as.Date(file$valid_start, format="%Y-%m-%d")),]
  df_total$county_old <- new_file$county # original counties in chronological order if there are ava histories
  old_vs_new <- rbind(old_vs_new, df_total) 
}
old_vs_new

## Rearrange county and county_old seperated by "|" in alphabetical order
old_vs_new$county_old <- sapply(strsplit(old_vs_new$county_old, "[|]+"), function(x) paste(sort(x),collapse="|"))
old_vs_new$county <- sapply(strsplit(old_vs_new$county, "[|]+"), function(x) paste(sort(x),collapse="|"))

## Output the ava_id and county to change to if there are differences in county vs. county_old
old_vs_new$change <- ifelse(old_vs_new$county != old_vs_new$county_old, "Different", "Same")
change <- subset(old_vs_new, old_vs_new$change == "Different", select = c(ava_id, county))

# Final df that shows output
change
