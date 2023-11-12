#github: https://github.com/csmotherman/CSC302-HW2

df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu','Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
aggregate(df1$Sales, by=list(df1$State), FUN=sum)
library(dplyr)
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))

#The code starts with creating a data frame with columns (Name, State, Sales)
#The aggregate function then groups the data by State and then calculates the sum of sales for each of the states.
#The dplyr library really just does the same thing but in a different way of coding it.
# The output shoes us a summary of all of the states and the sum of their sales in a neat output.

#Set Directory
setwd("/Users/cartersmotherman/Documents/CSC 302/DATA")

#--- 2 --- Load in World Cup csv file from local folder
world_cup <- read.csv("WorldCupMatches.csv")

#2a
dim(world_cup)
#2b
summary(world_cup)
#2c
length(unique(world_cup$City))
#2d
mean(world_cup$Attendance, na.rm = TRUE)
#2e
world_cup %>% group_by(Home.Team.Name) %>% summarise(total_goals = sum(Home.Team.Goals))
#2f
world_cup %>% group_by(Year) %>% summarise(avg_attendance = mean(Attendance))

#--- 3 --- Load in Metabolite csv file from local folder
metab <- read.csv("metabolite.csv")

#3a
sum(metab$Label == "Alzheimer")
#3b
colSums(is.na(metab))
#3c
metab_new <- metab[!is.na(metab$Dopamine), ]
#3d
metab_new$c4.OH.Pro[is.na(metab_new$c4.OH.Pro)]  <- median(metab_new$c4.OH.Pro, na.rm = TRUE)
