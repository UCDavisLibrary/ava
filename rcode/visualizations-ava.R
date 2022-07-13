#Goal: Create visualizations for the AVA Project. 

#Libraries
library(rvest)
library(dplyr)
library(jsonlite)
library(tidyverse)
library(purrr)

#LOAD FILE AVA.JSON
AVA_main<- fromJSON("./avas_aggregated_files/avas.geojson")

# Timeline of the Avas creation dates  ------------------------------------


