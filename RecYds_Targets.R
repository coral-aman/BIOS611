library(tidyverse)

nfl_offensive_stats <- read_csv("derived_data/nfl_offensive_stats_subset.csv")

nfl_offensive_stats$position <- as.character(nfl_offensive_stats$position)

subset_wrs <- subset(nfl_offensive_stats, !is.na(position) & position == "WR")

ggplot(subset_wrs, aes(x= targets, y= rec_yds)) +
geom_point(color = "blue",  
           size = .5) +
  labs(
    title = "Total Receiving Yards for NFL WRs",
    x = "Targets",
    y = "Total Receiving Yards"
  ) + ylim(0, 150) + geom_smooth(method = "lm", se = FALSE, color = "orange") +
  theme(plot.title = element_text(hjust = 0.5))  + theme(plot.title = element_text(size = 6), 
    axis.title.x = element_text(size=6), axis.title.y = element_text(size=6), 
    axis.text.y = element_text(size = 6), axis.text.x = element_text(size=6))

ggsave("figures/RecYds_Targets.png")