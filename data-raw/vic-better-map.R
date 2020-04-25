library(tidyverse)
library(rgdal)
library(here)
sp_df <- readOGR(dsn = here("data-raw", "vic-better-map", "vic-july-2018-esri"), 
                 layer = "E_AUGFN3_region",
                 verbose = FALSE)

vicmap2019 <- broom::tidy(sp_df, region = "Elect_div") %>% 
  mutate(elect_div = toupper(id))

save(vicmap2019, file = here("extra-data", "vicmap2019.rda"))
