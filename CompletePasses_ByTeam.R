library(tidyverse)

nfl_offensive_stats <- read_csv("derived_data/nfl_offensive_stats_subset.csv")

agg_data <- nfl_offensive_stats %>%
  group_by(team) %>%
  summarise(Total_Pass_Completions = sum(pass_cmp)) %>%
  arrange(desc(Total_Pass_Completions))

agg_data$team <- reorder(agg_data$team, -agg_data$Total_Pass_Completions)

p <- ggplot(agg_data, aes(x = team, y = Total_Pass_Completions)) +
  geom_bar(stat = "identity", fill = "lightblue", color = "steelblue") + theme_minimal() +
  labs(title = "Total Pass Completions by NFL Team in 2022", x = "NFL Team", y = "Total Pass Completions") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggsave("figures/pass_completions.png", plot = p)

