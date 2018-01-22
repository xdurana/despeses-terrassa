library(readr)
library(dplyr)
library(tidyr)
library(xlsx)

arees <- read_csv("~/workspace/opendata-terrassa/inst/extdata/despeses.csv") %>%
  mutate(
    AREA.DESCRIPCIO = substring(AREA, 3),
    AREA = as.factor(substring(AREA, 1, 1))
  ) %>%
  filter(
    !is.na(AREA)
  ) %>%
  select(
    AREA,
    AREA.DESCRIPCIO
  ) %>%
  unique()

arees %>% write_csv('output/area.csv')
