#GOAL: Scrape the ECFR site for the names and revision histories for the AVAs.

#Libraries
library(rvest)
library(xml2)
library(plyr)

#Load Data

#   Website
url<-"https://www.ecfr.gov/cgi-bin/text-idx?c=ecfr&sid=057f99d792668247a3c45b4699417291&rgn=div5&view=text&node=27:1.0.1.1.7&idno=27#sp27.1.9.c"

#   Scrape website

ecfr<-read_html(url)

#Get all of the H2 tags
h2<-html_nodes(ecfr, "h2")
#ava.name<-h2[grep("§", h2)]
ava.name<-h2[grep("style", h2)]
#ava.list<-substr(ava.name, regexpr("§",ava.name), nchar(ava.name)-1)
ava.list<-as_list(ava.name)
ava.df<-data.frame(matrix(unlist(ava.list)), stringsAsFactors = FALSE)
avas<-ava.df[-1,]

section<-substr(avas,1,6)
section<-trimws(section, which="both", whitespace = "[\\h\\v]")
ava.name<-substr(avas, 7, 100)
ava.name<-gsub("\\.", "", ava.name)
ava.name<-trimws(ava.name, which="both", whitespace = "[\\h\\v]")

#This doesn't work because one of the revision history strings has the wrong class assigned to it
# revision.history<-ecfr %>% 
#   html_nodes('[class="cita"]')
# revision.list<-as_list(revision.history)
# revision.df<-data.frame(matrix(unlist(revision.list)))

#Get the nodes with ' FR ' in them because all the revision histories have this
#   Not all are correctly formed so you can't get them based on the first part of the string
try.fr<-xml_find_all(ecfr, "//text()[contains(., ' FR ')]")
fr.list<-as_list(try.fr)
fr.df<-data.frame(matrix(unlist(fr.list)), stringsAsFactors = FALSE)
fr<-fr.df[,1]

#split up the revision string into it's component citations
fr.standardized<-gsub(", as amended by", ";", fr)
fr.pieces<-strsplit(fr.standardized, ";")
#fr.matrix<-do.call(rbind, fr.pieces)
#rbindfill
fr.df<-rbind.fill(lapply(fr.pieces, function(y){as.data.frame(t(y), stringsAsFacfors=FALSE)}))


all.data<-as.data.frame(cbind(section, ava.name, fr, fr.df), stringsAsFactors = FALSE)
names(all.data)[3]<-"revision.string"

#write.csv(ava.df, "d:\\avaname.csv")
write.csv(all.data, "d:\\revisionhistories.csv")
