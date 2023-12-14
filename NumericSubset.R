library(tidyverse)

nfl_offensive_stats <- read_csv("source_data/nfl_offensive_stats.csv", col_names = T)

numeric_offensivestats_subset <- nfl_offensive_stats[, sapply(nfl_offensive_stats, is.numeric)]

write.csv(numeric_offensivestats_subset, "derived_data/numeric_offensivestats_subset.csv", row.names = FALSE)
