# Goal: Look at county of AVA in qgis map & make sure it’s correctly projected on the attribute table

# Load packages

install.packages("Rcpp")
library(Rcpp)
install.packages("stars")
library(stars)
install.packages("tmaptools")
library(tmaptools)
install.packages("dplyr")
library(dplyr)
install.packages("tmap")
library(tmap)

 ## updated packages
install.packages("s2")
install.packages("sf")
library(sf)
sf_use_s2()
library(s2)

# Read county shapefile from 
# https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html
county_shp <- read_sf("~/Downloads/tl_2021_us_county/tl_2021_us_county.shp")
county_shp <- st_transform(county_shp, 4269) # CRS to (EPSG:4269)

# Read AVA  # avas <- st_read("avas.geojson")
# Identify if AVA is in county boundary 
#for loop to go through avas, replace NAME of county into attribute
ava <- read_sf("~/git/AVA/avas/columbia_gorge.geojson")
ava <- st_transform(ava, 4269) # CRS to (EPSG:4269)

# Retrieve county from AVA
#ori_county <- ava$county

# Extract intersecting counties
county_intersect <- st_intersects(ava, county_shp)
namesofcounty <- lapply(county_intersect, function(n){county$NAME[n]})

# https://r-spatial.github.io/sf/reference/geos_binary_pred.html
# Problem: points from AVA boundary that intersect county boundary is included
# Solution?: snap first, then use "closed" model 
# Example below 
ava2 <- read_sf("~/git/AVA/avas/southern_oregon.geojson")
ava2 <- st_transform(ava2, 4269) # CRS to (EPSG:4269)

# Retrieve county from AVA
#ori_county <- ava$county
# Extract intersecting counties

county_intersect2 <- st_intersects(ava2, county_shp, model = "closed", snap = s2_snap_level(1))

s2_options(model = "closed", snap = s2_snap_level(30))

namesofcounty2 <- lapply(county_intersect2, function(n){county$NAME[n]})

                                                                                                              
