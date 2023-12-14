library(tidyverse)
numeric_data <- read_csv("derived_data/numeric_offensivestats_subset.csv", col_names = T)
pca_result <- prcomp(numeric_data)
pcs <- pca_result$x[,1:56] %>% as_tibble(name_repair="simple")
ggplot(pcs, aes(PC1, PC2)) + geom_point(aes(color=numeric_data$pass_yds)) + 
theme(plot.title = element_text(size = 10)) + xlim(10,50) + ylim(0, 100) + 
labs(title="NFL Offensive Stats 2022 Principal Components for Total Passing Yards") + theme(plot.title = element_text(hjust = 0.5)) 
ggsave("figures/NFL_principle_components_pass_yds.png")
