library(maps)
library(mapdata)
library (ggmap)
require(dplyr)  

state_county <-read.csv("state_final.csv", header=T)
/*specify fields in the dataset as numeric fields*/
state_county$district<- as.numeric(state_county$district)
state_county$group<- as.numeric(state_county$group)
staet_county$order<- as.numeric(state_county$order)

colors=rainbow(n) /*select n colors to be assigned to each district (where n is the number of district for the state)*/

/*This section reads some files containins coordinates of shared counties to manipulate their color*/
...
shared_county1<-read.csv("shared_county1.csv", header=T)
shared_county2<-read.csv("shared_county2.csv", header=T)
shared_county3<-read.csv("shared_county3.csv", header=T)
...

state_county$colorBuckets <- as.numeric(cut(state_county$district, c(1, 2, 3, 4, 5, 6, 7, 8))) /*Associate one color to each district*/

/*Plot the map and assign separately the color to shared counties*/
state_base <- ggplot(data = state_county, mapping = aes(x = long, y = lat, group=group)) + 
  geom_polygon(color = "black", fill = colors[w_county$colorBuckets]) + 
  geom_polygon(color = "black", fill = NA)+
  geom_polygon(data = shared_county1, aes(x = long, y = lat, group = group), fill = "orange", color="black") + 
  geom_polygon(data = shared_county2, aes(x = long, y = lat, group = group), fill = "#00FF40FF", color="black") + 
  geom_polygon(data = shared_county3, aes(x = long, y = lat, group = group), fill = "white", color="black") + 
  
  coord_fixed(1.3)
  
/*Visualize the map*/ 
state_base