#This script uses the data frame created in getContributors.R to return some basic analysis such as
#the unique contributors to the AVA github, a data frame of the number of contributors to each file and
#their names. It will also show the file names of those with the most amount of contributors, and a histogram
#of the distribution of the number of contributors across all the files.
library(ggplot2)
df <- read.csv("contributors.csv")
cont <- strsplit(df[,2], '|',fixed=TRUE)

#get the number of unique contributors
unique.contributors <- unique(unlist(cont))
unique.contributors

#get the number of contributors for each file and add it to the dataframe
number.of.contributors <- lengths(cont)
new_df <- cbind.data.frame(df, number.of.contributors)
write.csv(new_df, "contributor_info.csv", row.names = FALSE)


#get the max number of contributors for a file and the names of those files
max <- max(new_df[,3])
max.cont.files <- new_df[which(new_df[,3] == max),1]
max.cont.files

#plot of the number of contributors
#we can see that files range from 1-6 contributors, with most having 4.
contributors.by.file.plot <- ggplot(new_df,aes(number.of.contributors)) + geom_bar() + ggtitle("Histogram of the Number of Files with each Amount of Contributors (1-5)") + xlab("Number of Contributors") + ylab("Number of Files")
ggsave(filename="contributors_by_file.png",path="./images/",plot=contributors.by.file.plot,width=5,height=5,dpi=300)

#get the number of files that each contributor contributed to and put it in a data frame
individual.contributors <- data.frame()
for(contributor in unique.contributors){
  num.contributions <- length(which(grepl(contributor, new_df$contributors)))
  row <- c(contributor, num.contributions)
  individual.contributors <- rbind(individual.contributors, row)
}

#Graphing the number of files that contributors who have contributed to over 10 files
colnames(individual.contributors) <- c("Contributor", "Number of Contributions")
individual.contributors
individual.contributors[,2] = as.numeric(individual.contributors[,2])
contributors_over10 <- individual.contributors[which(individual.contributors$`Number of Contributions` > 10),]
contributors_over10
ggplot(contributors_over10, aes(Contributor, `Number of Contributions`)) + geom_col() + ggtitle("Histogram of Contributors Who Contributed to Over 10 Files")
contributors_over10
contributors.over.10.plot <- ggplot(contributors_over10, aes(Contributor, `Number of Contributions`)) + geom_col() + ggtitle("Histogram of Contributors Who Contributed to Over 10 Files") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(filename="contributors_over_10.png",path="./images/",plot=contributors.over.10.plot,width=5,height=5,dpi=300)
