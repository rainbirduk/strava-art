# attach packages
library(rStrava)
library(dplyr)

# create api token
app_name <- 'Bike' # chosen by user
app_client_id  <- '109528' # an integer, assigned by Strava
app_secret <- '95d1f334e61aedf2a0d47dd6749cd4cf0750e20a' # an alphanumeric secret, assigned by Strava

# create the authentication token
stoken <- httr::config(token = strava_oauth(app_name, app_client_id, app_secret, app_scope="activity:read_all"))

# get activities, get activities by lat/lon, distance, plot
my_acts <- get_activity_list(stoken)
act_data <- compile_activities(my_acts)
sp_act_data <- act_data %>% filter(!is.na(start_latlng1))

# save as RDS
readr::write_rds(sp_act_data, "data/spatial_activity_data.rds")



