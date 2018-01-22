library(readr)
library(dplyr)
library(tidyr)

arees <- read_csv("inst/extdata/arees.csv") %>%
  mutate(
    AREA = as.factor(AREA)    
  )

serveis <- read_csv("inst/extdata/serveis.csv")
programes <- read_csv("inst/extdata/programes.csv")

despeses <- read_csv("inst/extdata/despeses.csv") %>%
  mutate(
    EXERCICI = EXERCICI_COMPTAB,
    GRUP_PROGRAMA = trimws(substring(PARTIDA, 11, 17)),
    PROGRAMA_DESCRIPCIO = substring(PROGRAMA, 3),
    PROGRAMA = as.factor(substring(PROGRAMA, 1, 1)),
    CAPITOL_DESCRIPCIO = substring(CAPITOL, 3),
    CAPITOL = as.factor(substring(CAPITOL, 1, 1)),
    AREA = as.factor(substring(PARTIDA, 6, 6)),
    ORGANIC = substring(PARTIDA, 6, 9),
    COMPTE = substring(PARTIDA, 18, 23)
  ) %>%
  left_join(arees) %>%
  left_join(serveis) %>%
  left_join(programes) %>%
  select(
    EXERCICI,
    CAPITOL,
    CAPITOL_DESCRIPCIO,
    AREA,
    AREA_DESCRIPCIO,
    ORGANIC,
    ORGANIC_DESCRIPCIO,
    PROGRAMA,
    PROGRAMA_DESCRIPCIO,
    GRUP_PROGRAMA,
    GRUP_PROGRAMA_DESCRIPCIO,
    PARTIDA,
    DESCRIPCIO_PARTIDA,
    PRESSUPOST_DEFINITIU,
    LIQUIDACIO
  ) %>%
  arrange(
    CAPITOL,
    ORGANIC,
    PROGRAMA
  )

despeses %>%
  filter(
    EXERCICI == 2017
  ) %>%
  View()
