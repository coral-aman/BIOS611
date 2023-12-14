library(tidyverse)
numeric_data <- read_csv("derived_data/numeric_offensivestats_subset.csv")

##Clustering##

kmeans_result <- kmeans(numeric_data, centers = 3)

ggplot(numeric_data, aes(x = pass_yds)) +
  geom_density(aes(fill = factor(kmeans_result$cluster))) +
  labs(title = "K-means Clustering") + xlim(0, 10)
ggsave("work/figures/Clustering_PassingYards.png")


ggplot(numeric_data, aes(x = pass_tds)) +
  geom_density(aes(fill = factor(kmeans_result$cluster))) +
  labs(title = "K-means Clustering") + xlim(0, 40) + ylim(0, 3.0)
ggsave("work/figures/Clustering_PassingTouchdowns.png")


