########################
### Tidy Tuesday Week 12
### Created By: Brandon Bonilla
### Created on: 2022-04-15
#######################

### Load Libraries ###
library(tidyverse)
library(tidytuesdayR)
library(here)
library(patchwork)
library(gganimate)
library(magick)
library(lubridate)

### Load Data ###

tuesdata <- tidytuesdayR::tt_load('2022-04-12')
tuesdata <- tidytuesdayR::tt_load(2022, week = 15)

death_fuel <- tuesdata$death_fuel

View(death_fuel)

### Data Analysis ###
South_America<-death_fuel%>% #Getting data I want 
  drop_na()%>%
  filter(Continent == "South America", #Isolating only desired continent
         Year...3 == "2015")
  


view(South_America)

South_America%>%
  ggplot(aes(x = Year...3, #plotting x and y 
             y = `Deaths - Cause: All causes - Risk: Household air pollution from solid fuels - Sex: Both - Age: All Ages (Number)...4`,
             color = Entity))+
  geom_point()+
  transition_states(`Deaths - Cause: All causes - Risk: Household air pollution from solid fuels - Sex: Both - Age: All Ages (Number)...4`,
                    transition_length = 2, #adding animations 
                    state_length = 1)+
  labs(title = "Indoor Polution Deaths of All Causes in South America", #appropriate titles 
       x = "Year",
       y = "Indoor Deaths")


