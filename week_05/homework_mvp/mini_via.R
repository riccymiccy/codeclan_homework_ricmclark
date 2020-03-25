library(dplyr)
library(tidyverse)
library(CodeClanData)

olympics_overall_medals %>%
  filter(team %in% c("United States",
                     "Soviet Union",
                     "Germany",
                     "Italy",
                     "Great Britain")) %>%
  filter(medal == <INPUT>) %>%
  filter(season == <INPUT>) %>%
  ggplot() +
  aes(x = team, y = count) +
  geom_col()
