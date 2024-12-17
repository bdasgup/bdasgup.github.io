library(maps)
library(mapdata)
library (ggmap)
US_counties <- map_data("county") /* retrieve the US states divided into counties */
state_county <- subset(state_counties, region == "state_name") /* specify the state you want to analyze*/
write.csv(state_county, "state_final.csv") /* create a data frame with coordinates of all the point representing the state divided into counties*/