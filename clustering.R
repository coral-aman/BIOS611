library(tidyverse)

nfl_offensive_stats <- read_csv("work/source_data/nfl_offensive_stats.csv", col_names = T)

numeric_data <- nfl_offensive_stats[, sapply(nfl_offensive_stats, is.numeric)]

pca_result <- prcomp(numeric_data)
summary(pca_result)

variance <- (pca_result$sdev)^2
cumulative_variance <- cumsum(variance) / sum(variance)

plot <- data.frame(Dimension =1:length(cumulative_variance), CumulativeVariance = cumulative_variance)

ggplot(plot, aes(x= Dimension, y = CumulativeVariance)) + 
  geom_line() + 
  geom_hline(yintercept = 0.85) +
  xlab("Principal Component") + 
  ylab("Cumulative Proportion of Variance Explained") +
  ggtitle("PCA cumulative Variance Plot")
ggsave("work/figures/explained_variance.png");






