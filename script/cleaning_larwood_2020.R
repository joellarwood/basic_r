library(tidyverse)

larwood_messy <- read_csv(
  here::here(
    "data",
    "larwood_et_al_2020_messy.csv"
  )
) %>%
  janitor::clean_names() %>%
  select(
    age,
    gender,
    contains("dass"),
    contains("tas")
  ) %>%
  mutate(
    tas_4r = 6 - tas4_1, # Reverse code items
    tas_5r = 6 - tas5_1,
    tas_10r = 6 - tas10_1,
    tas_18r = 6 - tas18_1,
    tas_19r = 6 - tas19_1
  )



larwood_clean <- larwood_messy %>%
  mutate(
    tas = select(
      .,
      tas1_1:tas3_1,
      tas_4r,
      tas_5r,
      tas6_1:tas9_1,
      tas_10r,
      tas11_1:tas17_1,
      tas_18r,
      tas_19r,
      tas20_1
    ) %>%
      rowSums(),
    dep = select(
      .,
      dass3_1,
      dass5_1,
      dass10_1,
      dass13_1,
      dass16_1,
      dass17_1,
      dass21_1
    ) %>%
      rowSums(),
    age = 17 + age, 
    gender_recode = if_else(gender == 1, "male", "female")
  ) %>% 
  select(age, 
         gender_recode,
         gender, 
         tas, 
         dep)

write_csv(
  larwood_clean, 
  here::here(
    "data", 
    "larwood_et_al_2020_condensed.csv"
  )
)
