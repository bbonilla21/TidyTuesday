########################
### Tidy Tuesday Week 12
### Created By: Brandon Bonilla
### Created on: 2022-04-23
#######################

### Load Libraries ###
library(tidyverse)
library(tidytuesdayR)
library(here)
library(patchwork)
library(gganimate)
library(magick)
library(lubridate)
library(tidytext)

### Load Data ###

dave <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-04-19/big_dave.csv')
times <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-04-19/times.csv')

view(dave)
view(times)

### Data Anlysis ###
answers <- times %>% #new object made 
  filter(!is.na(answer)) %>% #remove NAs
  select(answer) #selected column

view(answers) 

Top10<-answers %>% # new object words
  count(answer) %>% # answers 
  arrange(desc(n))%>% # sort the answers
  slice(1:10) # top 10 ranked

view(Top10)

Top10 #Listing the Top 10 ranked answers
