#Goal: Create visualizations for the AVA Project. 

#Libraries
library(rvest)
library(dplyr)
library(jsonlite)
library(tidyverse)
library(purrr)
library(vistime)
library(ggplot2)
library(plotly)
library(htmlwidgets)
library(webshot)

#LOAD FILE AVA.JSON
AVA_main<- fromJSON("./avas_aggregated_files/avas.geojson")
ava_properites<-AVA_main$features$properties# Properties of the avas

# Timeline of the Avas creation dates  ------------------------------------

# gg_vistime(ava_properites_CA, col.event = "name", col.start="created", linewidth = 5) did not use it because it is too crowded and has plots single points

ava_properites$created<-substring(ava_properites$created, 1,4) # replaces the created date with the year only

date_occurrences<-table(ava_properites$created) %>% as.data.frame() #creates a dataframe with the years on the avas_properties df and how many avas were created on that year

date_occurrences$Var1<-as.numeric(as.character(date_occurrences$Var1)) #Making the dates into numeric so they can be read by ggplot and make steps automatically between years

timeline_dist<- ggplot(date_occurrences, aes(x=Var1, y=Freq))+ geom_col(fill="#a95667")+ 
  labs(x= "Year", y= "AVAs created", title = "AVAs Created Per Year")+ theme(legend.position="none") +theme_bw()


# ggsave("./docs/visualizations/timeline_created.png")

# AVA States --------------------------------------------------------------
#Pie chart of which states contain the most avas
state_occurrences<-table(ava_properites$state) %>% as.data.frame()

state_occurrences$Freq<-as.integer(state_occurrences$Freq)

k<-0
e<-""
for (i in 1:nrow(state_occurrences)){
  if (state_occurrences$Freq[i] < 5){ #change to < 143 if option two selected ca_vs_all
    b<-state_occurrences$Freq[i]
    k<-k+b
    print(k)
    e<-c(e,i)
  }
}
e<-as.integer(e[-1])
state_occurrences_ca<- state_occurrences[-e,]
k<-data.frame(Var1 = "Others Summed", Freq = k)
df_states <- rbind(state_occurrences_ca,k)%>%.[order(.$Freq, decreasing = TRUE), ] %>% droplevels(.) #Check why we needed droplevels()

plot_states<-df_states %>% plot_ly(x= df_states$Freq,
       y= df_states$Var1,
       color = df_states$Var1,
       type = "bar",
       orientation = "h") %>%
  layout(
    barmode = "stack"
  ) %>% 
  layout(yaxis = list(categoryorder = "total ascending"))

plot_states

#ggsave("")

# saveWidget(plot_states,"./docs/visualizations/avas_perstate.html")
# webshot("./docs/visualizations/avas_perstate.html", file="./docs/visualizations/avas_perstate.png", delay=2)
#This are ways to save the file as png, but it can always be save easily with the viewer in r

# ava_properites_CA<-ava_properites[which(ava_properites$state=="CA"),]


# AVA Regions -------------------------------------------------------------


# AVA Contains ------------------------------------------------------------

#AVAs by size 

