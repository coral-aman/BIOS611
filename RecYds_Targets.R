library(tidyverse)

nfl_offensive_stats <- read_csv("work/source_data/nfl_offensive_stats.csv")

nfl_offensive_stats$position <- as.character(nfl_offensive_stats$position)

subset_wrs <- subset(nfl_offensive_stats, !is.na(position) & position == "WR")

ggplot(subset_wrs, aes(x= targets, y= rec_yds)) +
geom_point(color = "blue",  
           size = .5) +
  labs(
    title = "Total Receiving Yards for NFL Wide Receivers",
    x = "Targets",
    y = "Total Receiving Yards"
  ) + ylim(0, 150) + geom_smooth(method = "lm", se = FALSE, color = "orange") 