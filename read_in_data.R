library(tidyverse)

library(readr)
nfl_offensive_stats <- read_csv("source_data/nfl_offensive_stats.csv")

nfl_offensive_stats$game_id <- substr(nfl_offensive_stats$game_id, 1, 4)
subset_nfl_offensive_stats <- nfl_offensive_stats[nfl_offensive_stats$game_id == "2022", ]
subset_nfl_offensive_stats

write.csv(subset_nfl_offensive_stats, "derived_data/nfl_offensive_stats_subset.csv", row.names = FALSE)




