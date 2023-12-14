library(tidyverse)
numeric_data <- read_csv("derived_data/numeric_offensivestats_subset.csv", col_names = T)
pca_result <- prcomp(numeric_data)
ggplot(pcs, aes(PC1, PC2)) + geom_point(aes(color=numeric_data$pass_yds)) + xlim(-50,50) + ylim(0, 200) + labs(title=                                                                                       "NFL Offensive Stats 2022 Principal Components for Total Passing Yards") + theme(plot.title = element_text(hjust = 0.5)) 
ggsave("figures/NFL_principle_components_pass_yds.png");
