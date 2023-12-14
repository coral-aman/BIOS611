library(tidyverse)
numeric_data <- read_csv("derived_data/numeric_offensivestats_subset.csv", col_names = T)
pca_result <- prcomp(numeric_data)
pcs <- pca_result$x[,1:56] %>% as_tibble(name_repair="simple")
ggplot(pcs, aes(PC1, PC2)) + geom_point(col="lightblue") + xlim(-50, 50) + labs(title=                                                                                  "NFL Offensive Stats 2022 Principal Components") + theme(plot.title = element_text(hjust = 0.5))  
ggsave("figures/NFL_principle_components.png");
