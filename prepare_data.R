library(dplyr)
library(tidyr)


# we need to generate a series of data frames for the visualization, namely:
# a data frame that shows each station, total number of rides and the 



# read in data 
data = read.csv("data/june2022.csv", stringsAsFactors = FALSE)

# select the unique start station names 
key_data = data %>% distinct(start_station_name, .keep_all=TRUE)


# count the # of rides originating from each station
stations <- data %>% count(start_station_name)


# select the key data we need for this data frame (counting rides starting from each station)

rides = key_data %>% select(start_station_name, start_station_id, start_lat, start_lng)



# combine the above data with the station name and count of number of rides data so 
# we have summary stats for each station + geolocation data
stations_full = left_join(key_data, stations, by="start_station_name")

# rename columns

station_full <- rename(stations_full, station = start_station_name, lattitude = start_lat, longitude = start_lng, total_rides=n)


# save data 
write.csv(station_full, "data/station_full.csv", row.names = FALSE)


# isolate the data that we will use to place each station on the map AND indicate the number of rides originating at each station 
map_data = station_full %>% select(station, start_station_id, lattitude, longitude, total_rides)


#save map data 
write.csv(map_data, "data/map_data.csv", row.names = FALSE)


