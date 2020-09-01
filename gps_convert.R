library(readxl)
library(rgdal)

gps_convert <- function(data, latitude = "lat", longitude = "long") {
  # function that converts gps coordinates from SWEREF99 to WGS84
  #
  # args:
  #   data: The dataframe or matrix with coordinates
  #   latitude: Name of the column with latitude data
  #   longitude: Name of the column with longitude data
  #   
  # returns:
  #   A data frame with the same content as input 'data' object, but with 
  #   the coordinates in the wgs84 instead of SWEREF99
  SWEREF99 <- CRS("+init=epsg:3006")
  WGS84 <- CRS("+init=epsg:4326")
  #wd <- getwd()
  #inputfile <- paste(wd, data, sep = "/")
  #inputdf <- read_excel(path = inputfile)
  #coords <- inputdf[, c(longitude, latitude)]
  coords <- data[,c(longitude, latitude)]
  p1 <- SpatialPointsDataFrame(coords, data = data, proj4string = SWEREF99)
  p2 <- spTransform(p1, WGS84)
  return(p2)
}
