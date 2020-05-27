library(tidyverse)

download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile="data_raw/portal_data_joined.csv")

surveys <- read_csv("data_raw/portal_data_joined.csv")

View(surveys)

select(surveys, plot_id, species_id, weight)

select(surveys, -record_id)

filter(surveys, year == 1995)

plot2 <- filter(surveys, plot_id == 2)

# Select sex and weight of animals with weight less than 5

surveys %>%
  filter(weight < 5) %>% 
  select(species_id, sex, weight)

surveys_sml <- surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight)

surveys %>% 
  filter(year < 1995) %>% 
  select(year, sex, weight)

surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm=TRUE))

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight))

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight)) %>% 
  arrange(mean_weight)

surveys %>% 
  count(species_id)

surveys %>% 
  count(plot_type)

fatrats <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(year) %>% 
  select(year, genus, species_id, weight) %>% 
  summarize(max_weight = max(weight))

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(year) %>% 
  filter(weight == max(weight)) %>% 
  select(year, genus, species_id, weight) %>% 
  arrange(year)

surveys_complete <- surveys %>% 
  filter(!is.na(weight),
         !is.na(hindfoot_length),
         !is.na(sex))

species_counts <- surveys_complete %>% 
  count(species_id) %>% 
  filter(n >= 50)

surveys_complete <- surveys_complete %>% 
  filter(species_id %in% species_counts$species_id)

write_csv(surveys_complete, path='surveys_complete.csv')
