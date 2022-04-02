########################
### Tidy Tuesday Week 10
### Created By: Brandon Bonilla
### Created on: 2022-04-01
#######################

### Load Libraries ###
library(tidyverse)
library(tidytuesdayR)
library(here)
library(patchwork)
library(gganimate)
library(magick)

### Load Data ###

sports <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-03-29/sports.csv')

view(sports)

### Data Analysis ###

Villanova<-sports%>% #Isolating my favorite from one side of the bracket
  filter(institution_name == "Villanova University",
         sports == "Basketball", #March Madness
         year == "2019", #Closest year to 2022, some players may still be on the team
         sum_partic_men>0)

view(Villanova)

UNC<-sports%>% #Isolating my favorite from the other side of the bracket
  filter(institution_name == "University of North Carolina at Chapel Hill",
         sports == "Basketball",
         year == "2019", #Some players may still be remaining 
         sum_partic_men>0)
view(UNC)

### Plotting ###

p1<-Villanova%>% #Setting up a vertical comparison of both teams 
  ggplot()+
  geom_col(aes(x = sports, #Making desired plot
             y = sum_partic_men),
             fill = "black", #Colors of away jerseys 
           color = "gold")+
  labs(title = "Villanova Athletes in 2019",
       x = "Sport",
       y = "Number of Players")+
  theme(plot.title = element_text(hjust=0.5))
p1 

p2<-UNC%>% #Finishing vertical comparison of both teams
  ggplot()+
  geom_col(aes(x = sports, #Desired plot
               y = sum_partic_men),
           fill = "white", #Colors of home jerseys 
           color = "Blue")+
  labs(title = "UNC Athletes in 2019",
       x = "Sport",
       y = "Number of Players")+
labs(title = "UNC Athletes in 2019",
     x = "Sport",
     y = "Number of Players")+
  theme(plot.title = element_text(hjust=0.5))
p2
  
  
p1/p2 + #Using patchwork to easily compare teams
  plot_layout(guides = 'collect')+
  plot_annotation(tag_levels = 'A')

#This compares the size of players in the programs between the two teams I believe will meet in the 2022 March Madness Final. UNC had over double the roster size of Villanova as of 2019.  