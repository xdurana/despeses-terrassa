library(readr)
library(dplyr)
library(tidyr)
library(xlsx)

serveis <- read_csv("~/workspace/opendata-terrassa/inst/extdata/despeses.csv") %>%
  mutate(
    ORGANIC = substring(SERVEI, 1, 4),
    ORGANIC.DESCRIPCIO = substring(SERVEI, 6)
  ) %>%
  filter(
    !is.na(ORGANIC)
  ) %>%
  select(
    ORGANIC,
    ORGANIC.DESCRIPCIO
  ) %>%
  unique()

serveis %>% write_csv('output/serveis.csv')
