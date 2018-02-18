library(plyr)
library(tidyverse)
library(rvest)
library(lubridate)
library(DT)
website1 <- read_html("https://projects.fivethirtyeight.com/global-club-soccer-rankings/")
team <- html_nodes(website1, "td.team")
team <- html_text(team)
league1 <- html_nodes(website1, ".league")
league1 <- html_text(league1)
SPI <- html_nodes(website1, ".defense+ td")
SPI <- html_text(SPI)
SPI_DF <- data.frame("Team" = team, "League" = league1, "SPI" = as.numeric(SPI))
SPI_DF$Team <- as.character(SPI_DF$Team)
SPI_DF$Team[with(SPI_DF, grepl("Arsenal", Team) &grepl("Superliga", League))] <- paste0(SPI_DF$Team[with(SPI_DF,
  grepl("Arsenal", Team) &grepl("Superliga", League))], " de Sarandí")
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/champions-league/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
CL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/europa-league/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
EL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/bundesliga-austria/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
AB_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/premier-league/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
PL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/championship/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
ECC_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/ligue-1/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
FL1_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/ligue-2/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
FL2_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/bundesliga/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
B_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/bundesliga-2/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
B2_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/serie-a/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
ISA_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/serie-b/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
ISB_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/eredivisie/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win 
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
NE_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/eliteserien/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win 
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
NEL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/primeira-liga/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
PPL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/premier-league-russia/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
RPL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/premiership/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
SP_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/la-liga/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
LL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/la-liga-2/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win 
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
LL2_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/allsvenskan/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
SA_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/super-league/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
SSL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/super-lig/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
TSL_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/liga-mx/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
MX_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/mls/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
MLS_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/nwls/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
NWLS_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/superliga/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
AS_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
AS_DF$Home.Team <- as.character(AS_DF$Home.Team)
AS_DF$Home.Team[grep("Arsenal", AS_DF$Home.Team)] <- paste0(AS_DF$Home.Team[grep("Arsenal", 
  AS_DF$Home.Team)], " de Sarandí")
AS_DF$Home.Team <- as.factor(AS_DF$Home.Team)
AS_DF$Away.Team <- as.character(AS_DF$Away.Team)
AS_DF$Away.Team[grep("Arsenal", AS_DF$Away.Team)] <- paste0(AS_DF$Away.Team[grep("Arsenal",
  AS_DF$Away.Team)], " de Sarandí")
AS_DF$Away.Team <- as.factor(AS_DF$Away.Team)
website2 <- read_html("https://projects.fivethirtyeight.com/soccer-predictions/brasileirao/")
home_team <- html_nodes(website2, ".upcoming .match-top .team")
home_team <- html_text(home_team)
away_team <- html_nodes(website2, ".upcoming .match-bottom .team")
away_team <- html_text(away_team)
date1 <- html_nodes(website2, ".date div")
date1 <- html_text(date1)
date1 <- as.Date(date1, "%m/%d")
home_win <- html_nodes(website2, ".upcoming .match-top .team+ .prob")
home_win <- html_text(home_win)
away_win <- html_nodes(website2, ".upcoming .match-bottom .prob")
away_win <- html_text(away_win)
home_win <- gsub("<1%", 0, home_win)
home_win <- as.numeric(gsub("%", "", home_win))
away_win <- gsub("<1%", 0, away_win)
away_win <- as.numeric(gsub("%", "", away_win))
diff <- home_win - away_win 
for(i in 1:length(diff)){
  if(diff[i] < 0){
    diff[i] <- diff[i] * -1
  } else(diff[i] <- diff[i])
}
league2 <- html_nodes(website2, ".leagueName")
league2 <- html_text(league2)
BB_DF <- data.frame("Home.Team" = home_team, "Away.Team" = away_team, "Date" = date1, 
                    "Difference" = diff, "League" = league2)
fixtures_DF <- join_all(list(AB_DF, AS_DF, B_DF, B2_DF, CL_DF, ECC_DF, EL_DF, FL1_DF,
  FL2_DF, ISA_DF, ISB_DF, LL_DF, LL2_DF, MX_DF, NE_DF, PL_DF, PPL_DF, RPL_DF, SP_DF,
  SSL_DF, TSL_DF), type = "full")
##Three main DFs - TV_DF, SPI_DF, fixtures_DF
fixtures_DF <- merge(x = fixtures_DF, y = SPI_DF[, c("Team", "SPI")], by.x = "Home.Team",
  by.y = "Team")
colnames(fixtures_DF)[ncol(fixtures_DF)] <- "Home.SPI"
fixtures_DF <- merge(x = fixtures_DF, y = SPI_DF[, c("Team", "SPI")], by.x = "Away.Team",
                     by.y = "Team")
colnames(fixtures_DF)[ncol(fixtures_DF)] <- "Away.SPI"
fixtures_DF$Match_Quality <- fixtures_DF$Home.SPI + fixtures_DF$Away.SPI
fixtures_DF[!is.finite(fixtures_DF$Competitiveness_Score), fixtures_DF$Competitiveness_Score] <- 1
fixtures_DF$Competitiveness_Score <- 1 - (fixtures_DF$Difference - min(fixtures_DF$Difference))/(max(fixtures_DF$Difference) - 
 min(fixtures_DF$Difference))
fixtures_DF$Match_Quality_Score <- (fixtures_DF$Match_Quality - min(fixtures_DF$Match_Quality))/
  (max(fixtures_DF$Match_Quality) - min(fixtures_DF$Match_Quality))
fixtures_DF$Enjoyment_Score <- (fixtures_DF$Competitiveness_Score + fixtures_DF$Match_Quality_Score)/
  2
twitter_fixtures_DF <- fixtures_DF[order(-fixtures_DF$Enjoyment_Score),
  ]
twitter_fixtures_DF <- twitter_fixtures_DF[,c(2,1,5,3,9,10,11)]
twitter_fixtures_DF$Competitiveness_Score <- round(twitter_fixtures_DF$Competitiveness_Score, 
  2)
twitter_fixtures_DF$Match_Quality_Score <- round(twitter_fixtures_DF$Match_Quality_Score, 
  2)
twitter_fixtures_DF$Enjoyment_Score <- round(twitter_fixtures_DF$Enjoyment_Score,  
  2)
brks1 <- quantile(twitter_fixtures_DF[,5], probs = seq(.05, .95, .05), na.rm = TRUE)
brks2 <- quantile(twitter_fixtures_DF[,6], probs = seq(.05, .95, .05), na.rm = TRUE)
brks3 <- quantile(twitter_fixtures_DF[,7], probs = seq(.05, .95, .05), na.rm = TRUE)
clrs1 <- round(seq(255, 40, length.out = length(brks1) + 1), 0) %>%
{paste0("rgb(255,", ., ",", ., ")")}
clrs2 <- round(seq(255, 40, length.out = length(brks2) + 1), 0) %>%
{paste0("rgb(255,", ., ",", ., ")")}
clrs3 <- round(seq(255, 40, length.out = length(brks3) + 1), 0) %>%
{paste0("rgb(255,", ., ",", ., ")")}
DT <- datatable(twitter_fixtures_DF, rownames = F,
  colnames = c("Home Team", "Away Team", "League", "Date", "Competitiveness Score", "Quality Score",
  "Enjoyment Score"))
DT <- formatStyle(DT, "Competitiveness_Score", backgroundColor = styleInterval(brks1,
  clrs1))
DT <- formatStyle(DT, "Match_Quality_Score", backgroundColor = styleInterval(brks2,
                                                                               clrs2))
DT <- formatStyle(DT, "Enjoyment_Score", backgroundColor = styleInterval(brks3,
                                                                               clrs3))
DT