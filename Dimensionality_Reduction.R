library(tidyverse)
numeric_data <- read_csv("derived_data/numeric_offensivestats_subset.csv")
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
  ggtitle("PCA Cumulative Variance Plot")
ggsave("work/figures/NFL_explained_variance.png");


pcs <- pca_result$x[,1:56] %>% as_tibble(name_repair="simple")
ggplot(pcs, aes(PC1, PC2)) + geom_point() + xlim(-50, 50)
ggsave("work/figures/NFL_principle_components.png");
ggplot(pcs, aes(PC1, PC2)) + geom_point(aes(color=numeric_data$pass_yds)) + xlim(-50,50) + ylim(0, 200)


