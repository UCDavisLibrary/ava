library(ggplot2)
df <- read.csv("contributors.csv")
cont <- strsplit(df[,2], '|',fixed=TRUE)

#get the number of unique contributors
unique.contributors <- unique(unlist(cont))

#get the number of contributors for each file and add it to the dataframe
number.of.contributors <- lengths(cont)
new_df <- cbind.data.frame(df, number.of.contributors)

#get the max number of contributors for a file and the names of those files
max <- max(new_df[,3])
max.cont.files <- new_df[which(new_df[,3] == max),1]

#plot of the number of contributors
ggplot(new_df,aes(number.of.contributors)) + geom_bar()
