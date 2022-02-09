#GOAL: To scrape the github contributors for each file in the avas folder.

library(rvest)
library(dplyr)

#Scraping the file names
url <- "https://github.com/UCDavisLibrary/ava/tree/master/avas"
webpage <- read_html(url)
titles <- webpage %>% html_nodes("a") %>% html_attr("title")
titles <- titles[grepl(".geojson", titles)]
links <- webpage %>% html_nodes("a") %>% html_attr("href")
#Only scrape text that includes ".geojson"
links <- links[grepl(".geojson", links)]
links <- paste0("https://github.com", links)

#This is the beginning of the each link that holds where the list of contributors for each file
front <- "https://github.com/UCDavisLibrary/ava/contributors-list/master/avas/"

#Going into each file link and scraping the contributors
contributors <- c()
for(title in titles){
  #Creating and going into the link with the contributors by attaching the name of the file to the end of the link
  link <- paste0(front,title)
  link <- read_html(link)
  #Scraping the contributors, and seperating them with "|"
  contributor <- link %>% html_nodes("a") %>% html_attr("href")
  contributor <- sub("/", "", contributor)
  contributor <- paste(contributor, collapse="|")
  contributors <- c(contributors, contributor)
}

df <- cbind(titles, contributors)

write.csv(df, "contributors.csv", row.names = FALSE)
