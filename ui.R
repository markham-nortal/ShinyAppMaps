library(lintr)
library(styler)
library(dplyr)
library(ggplot2)
library(shiny)
library(leaflet)

# define the UI
ui <- fluidPage(
  
  # App title ----
  titlePanel("CitiBike Rides in North Jersey - June 2022"),
  

    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Map of North Jersey
      # height ensures that the map uses 90% of the vertical space
      # otherwise, it will be a narrow rectangle 
      leafletOutput("citiPlot", height="90vh" )
      
    )

)
