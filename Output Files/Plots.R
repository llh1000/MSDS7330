#Load libary's 
library("ggplot2")
library("plyr")
library("reshape2")

#Set working directory
setwd("")

#Check files 
list.files()

#Read csv file in to R
rs <- read.csv("AttendancVSRuns.csv", sep = ",")

#Check data
head(rs)

#Melt the wanted variables together
dfm <- melt(rs[,c('Team','TotalRunsScoredRanked','TotalRunsAllowedRanked', 'TotalHomeRunsRanked')],id.vars = 1)

#Plot the data
ggplot(dfm,aes(x = Team,y = value)) + 
  geom_bar(aes(fill = variable),stat = "identity",position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  labs(x = "Team", y = "Rank")
  





