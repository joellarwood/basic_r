# Larwood (2017) datq cleaning

larwood_2017 <- read_csv(
  "https://raw.githubusercontent.com/joellarwood/MusicEmoRegInRumination/master/data/s2Processed.csv"
) %>%
  janitor::clean_names() %>%
  mutate(
    tas_4r = 6 - tas4_1, # Reverse code items
    tas_5r = 6 - tas5_1,
    tas_10r = 6 - tas10_1,
    tas_18r = 6 - tas18_1,
    tas_19r = 6 - tas19_1
  ) %>%
  mutate(tas = rowSums(
    select(
      larwood_2017,
      tas1_1:tas3_1,
      tas_4r,
      tas_5r,
      tas6_1:tas9_1,
      tas_10r,
      tas11_1:tas17_1,
      tas_18r,
      tas_19r,
      tas20_1
    )
  ), 
  age = 17 + age, 
  gender_recode = if_else(gender == 0, "male", "female"))%>% 
  select(
    age, 
    gender, 
    gender_recode, 
    ders, 
    depression, 
    tas, 
    rumination
  )


write_csv(larwood_2017, 
          here::here(
            "data", 
            "larwood_2017_condensed.csv"
          ))
