library(tidyverse)
numeric_data <- read_csv("derived_data/numeric_offensivestats_subset.csv", col_names = T)
pca_result <- prcomp(numeric_data)
summary(pca_result)
variance <- (pca_result$sdev)^2
cumulative_variance <- cumsum(variance) / sum(variance)
plot <- data.frame(Dimension =1:length(cumulative_variance), CumulativeVariance = cumulative_variance)

ggplot(plot, aes(x= Dimension, y = CumulativeVariance)) + 
  geom_line(col = "blue") + 
  geom_hline(yintercept = 0.85) + theme(plot.title = element_text(hjust = 0.5, size = 10), axis.title.x = element_text(size = 6), axis.title.y = element_text(size = 6), 
  axis.text.x = element_text(size = 6), axis.text.y = element_text(size = 6)) +
  xlab("Principal Component") + 
  ylab("Cumulative Proportion of Variance Explained") +
  ggtitle("PCA Cumulative Variance Plot")
ggsave("figures/NFL_explained_variance.png")

