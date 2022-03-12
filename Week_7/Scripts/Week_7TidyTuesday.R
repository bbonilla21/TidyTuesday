######################################
### Tidy Tuesday 2022-03-08
### Created by: Brandon Bonilla
### Created on: 2022-03-11
###################################

### Load Libraries ###
library(tidyverse)
library(here)
library(tidytuesdayR)
library(beyonce)

### Load Data ###

erasmus <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-03-08/erasmus.csv')

### Data Analysis ###
glimpse(erasmus)
View(erasmus)

fewer_opportunity_studentsUK<-erasmus%>%
  select(fewer_opportunities,
         participant_nationality,
         participants,
         participant_age,
         participant_gender,
         sending_city)%>%
  filter(fewer_opportunities == "Yes",
         participant_nationality == "UK",
         participant_age > 17,
         participant_age < 27)
  view(fewer_opportunity_studentsUK)
  
### Plotting ###
fewer_opportunity_studentsUK%>%
  ggplot(aes(x = participant_gender,
             y = participants))+
  geom_boxplot()+
  labs(title = "Underpriviledged Young Adult Participants (18-26) From the UK",
       x = "Gender",
       y = "Number of Participants")+
  theme(plot.title = element_text(hjust = 0.5),
        panel.border = element_rect(fill = NA,
                                    color = "black"))+
  geom_point(aes(color = "red"))+
  guides(color = guide_legend(title = "Participants"))+
  theme_linedraw()+
  theme_dark()



