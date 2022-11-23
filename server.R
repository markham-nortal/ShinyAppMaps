library(dplyr)
library(ggplot2)
library(shiny)
library(leaflet)
library(ggmap)

# import UI file 
source("ui.R")

# prepare data and map for rendering 
# dividing the total rides by 100 keeps the map circles from getting too large 
bike_data = read.csv("data/map_data.csv", stringsAsFactors=FALSE)
bike_data$rides_adjusted = bike_data$total_rides/100

# "server" code for Shiny Maps, using map view, using renderLeaflet to ensure
# the map is interactive when published via Shiny 
server = function(input, output) {
  
    output$citiPlot = renderLeaflet({
    
      leaflet(bike_data) %>%  addTiles() %>% addCircleMarkers(
        lat = ~lattitude,
        lng = ~longitude,
        popup = paste(bike_data$station, "<br>", "Total Departures: ",
                      bike_data$total_rides), 
        stroke = FALSE,
        radius = ~rides_adjusted,
        fillOpacity = 0.7)
    
  })
  
}