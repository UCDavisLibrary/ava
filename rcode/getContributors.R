library(rvest)
library(dplyr)
url <- "https://github.com/UCDavisLibrary/ava/tree/master/avas"
webpage <- read_html(url)
titles <- webpage %>% html_nodes("a") %>% html_attr("title")
titles <- titles[grepl(".geojson", titles)]
links <- webpage %>% html_nodes("a") %>% html_attr("href")
links <- links[grepl(".geojson", links)]
links <- paste0("https://github.com", links)
front <- "https://github.com/UCDavisLibrary/ava/contributors-list/master/avas/"

temp <- titles[1:10]

contributers <- c()
for(title in titles){
  link <- paste0(front,title)
  link <- read_html(link)
  contributer <- link %>% html_nodes("a") %>% html_attr("href")
  contributer <- sub("/", "", contributer)
  contributer <- paste(contributer, collapse=",")
  contributers <- c(contributers, contributer)
}

df <- cbind(titles, contributers)

write.csv(df, "test.csv", row.names = FALSE)


test <- read.csv("test.csv")
test[,1]
