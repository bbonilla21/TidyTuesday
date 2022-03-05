######################################
### Tidy Tuesday 2022-03-01
### Created by: Brandon Bonilla
### Created on: 2022-03-03
###################################

### Load Libraries ####
library(tidytuesdayR)
library(tidyverse)
library(here)

### Load Data ###
tuesdata <- tidytuesdayR::tt_load('2022-03-01')
tuesdata <- tidytuesdayR::tt_load(2022, week = 9)

stations <- tuesdata$stations

stations <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-03-01/stations.csv')

view(stations)

### Data Analysis ###
FuelData<-stations%>% # Creating an object
  filter(STATE == "CA", 
         CITY == "Los Angeles")%>% # Filtering out the specific data locations I want
  select(LONGITUDE,LATITUDE,STATE,CITY,FUEL_TYPE_CODE)%>% # Specifying columns of data
  drop_na()
view(FuelData)

### Plotting ###

FuelData%>% # Plotting my object
  ggplot(aes(x = LONGITUDE, # Making a coordinate plot
             y = LATITUDE,
             fill = FUEL_TYPE_CODE))+
  geom_boxplot(aes(fill = FUEL_TYPE_CODE))+ # Adding filled color to boxplot
  labs(title = "Coordinates of Different Fuel Types in Los Angeles",
       fill = "Fuel Type")+ # Labeling
  theme(plot.title = element_text(hjust = 0.5),
        panel.border = element_rect(fill = NA,
                                    color = "black")) # Cleaning
  
