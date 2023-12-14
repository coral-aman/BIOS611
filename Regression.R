library(tidyverse)

nfl_offensive_stats <- read_csv("work/derived_data/nfl_offensive_stats_subset.csv")

team_stats <- nfl_offensive_stats %>%
  group_by(team) %>%
  summarise(total_passing_yards = sum(pass_yds),
            total_passing_touchdowns = sum(pass_td))

regression_model <- lm(total_passing_touchdowns ~ total_passing_yards, data = team_stats)
summary(regression_model)

ggplot(team_stats, aes(x = total_passing_yards, y = total_passing_touchdowns, label=team)) +
  geom_point(size = 1, col= "blue")+
  geom_smooth(method = "lm",   
              se = FALSE,      
              col = "lightblue",
              linetype= "dashed") + 
  geom_text(hjust = 0.25 , vjust = 0, size = 3, nudge_y = -1, col="black", angle = 90) + 
  labs(title = "Regression Model: Total Passing Touchdowns vs. Total Passing Yards by NFL Team in 2022",
       subtitle = "*Y = total_passyds ~ total_passtds*", x = "Total Passing Yards",
       y = "Total Passing Touchdowns") +
  theme(plot.title = element_text(hjust = 0.5))  + theme(plot.subtitle = element_text(hjust = 0.5)) + 
  scale_x_continuous(breaks = seq(0, max(team_stats$total_passing_yards), by = 250)) + 
  scale_y_continuous(breaks = seq(0, 25, by = 5))
ggsave("figures/regression_PassTd~PassYds.png", plot = p)








offensive_2022 <- lm(pass_yds ~ pass_tds)