library(tidyverse)
numeric_data <- read_csv("derived_data/numeric_offensivestats_subset.csv")

##Clustering##

kmeans_result <- kmeans(numeric_data, centers = 3)

ggplot(numeric_data, aes(x = rush_yds)) +
  geom_density(aes(fill = factor(kmeans_result$cluster))) + theme(plot.title = element_text(hjust = 0.5)) +
  labs(title = "K-means Clustering for Rushing Yards", x="Rushing Yards", y="Density") + xlim(0, 50.0) + ylim(0, 0.20)
ggsave("figures/Clustering_RushingYards.png")