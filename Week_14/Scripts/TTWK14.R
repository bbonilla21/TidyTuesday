########################
### Tidy Tuesday Week 12
### Created By: Brandon Bonilla
### Created on: 2022-04-29
#######################

### Load Libraries ###
library(tidyverse)
library(tidytuesdayR)
library(here)
library(patchwork)
library(gganimate)
library(magick)
library(lubridate)
library(flair)

### Load Data ###
capacity <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-05-03/capacity.csv')
view(capacity)

capacityclean<-capacity%>%
  drop_na()

view(capacityclean)

capacityclean%>% # plotting new object
  ggplot(aes(x = year,
         y = total_gw,
         color = type))+
  geom_point()+
  transition_states(total_gw, # added animations
                    transition_length = 1,
                    state_length =1)+
  labs(title = "Increasing Total Capacity (gw) Throught Years by Type", # clean the visuals 
       x = "Year",
       y = "Total Capacity (gw)",
       density = "Type")+
  theme(plot.title = element_text(hjust = 0.5),
        panel.border = element_rect(fill = NA,
                                    color = "black"))


  
  
  
  
  