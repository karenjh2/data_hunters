library(readr)
library(dplyr)

# load data ---------------------------------------------------------------------
raw_data <- read.csv(here::here("data-raw/minneapolis_police_use_of_force/minneapolis_police_use_of_force.csv"))

# cleaning ----------------------------------------------------------------------
# rename column 1 to remove non-ASCII characters
raw_data <- raw_data %>% rename("response_datetime" = !!names(.[1]))

# set all unknown race and sex values to NA
raw_data = raw_data %>%
  mutate(race = na_if(race, "")) %>%
  mutate(race = na_if(race, "Unknown")) %>% 
  mutate(race = na_if(race, "not recorded")) %>%
  mutate(sex = na_if(sex, "")) %>%
  mutate(sex = na_if(sex, "Unknown")) %>% 
  mutate(sex = na_if(sex, "not recorded")) 


minneapolis_police_use_of_force<- raw_data

# save --------------------------------------------------------------------------

usethis::use_data(minneapolis_police_use_of_force, overwrite = TRUE)
