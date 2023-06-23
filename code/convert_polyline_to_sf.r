# read in RDS
strava_poly <- readr::read_rds("data/spatial_activity_data.rds")

# convert to sf
coords <- googlePolylines::decode(strava_poly$map.summary_polyline)
sfg <- lapply( coords, function(x) sf::st_linestring( x = as.matrix(x) ) )
sfc <- sf::st_sfc(sfg)
sf <- sf::st_as_sf(cbind(strava_poly, sfc))
