library(rvest)
library(dplyr)

#Scraping the file names
url <- "https://github.com/UCDavisLibrary/ava/tree/master/avas"
webpage <- read_html(url)
titles <- webpage %>% html_nodes("a") %>% html_attr("title")
titles <- titles[grepl(".geojson", titles)]
links <- webpage %>% html_nodes("a") %>% html_attr("href")
links <- links[grepl(".geojson", links)]
links <- paste0("https://github.com", links)
front <- "https://github.com/UCDavisLibrary/ava/contributors-list/master/avas/"

#Going into each file link and scraping the contributors
contributors <- c()
for(title in titles){
  link <- paste0(front,title)
  link <- read_html(link)
  contributor <- link %>% html_nodes("a") %>% html_attr("href")
  contributor <- sub("/", "", contributor)
  contributor <- paste(contributor, collapse="|")
  contributors <- c(contributors, contributor)
}

df <- cbind(titles, contributors)

write.csv(df, "contributors.csv", row.names = FALSE)
