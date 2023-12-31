.PHONY: clean 

clean:
	rm -r ./derived_data/*
	rm -r ./figures/*
	rm -f report.html
	
nfl_offensive_stats_subset.csv: source_data/nfl_offensive_stats.csv read_in_data.R 
	Rscript read_in_data.R
	
pass_completions.png: nfl_offensive_stats_subset.csv CompletePasses_ByTeam.R
	Rscript CompletePasses_ByTeam.R

pass_touchdowns.png: nfl_offensive_stats_subset.csv CompletePasses_ByTeam.R
	Rscript PassingTouchdowns_ByTeam.R
	
numeric_offensivestats_subset.csv: source_data/nfl_offensive_stats.csv NumericSubset.R
	Rscript NumericSubset.R
	
NFL_explained_variance.png: numeric_offensivestats_subset.csv Dimensionality_Reduction.R
	Rscript Dimensionality_Reduction.R

NFL_principle_components.png: numeric_offensivestats_subset.csv PrincipalComponents.R
	Rscript PrincipalComponents.R

NFL_principle_components_pass_yds.png: numeric_offensivestats_subset.csv PCA_PassYds.R
	Rscript PCA_PassYds.R
	
Clustering_PassingYards.png: numeric_offensivestats_subset.csv clustering.R
	Rscript clustering.R

Clustering_RushingYards.png: numeric_offensivestats_subset.csv Clustering_RushYds.R
	Rscript Clustering_RushYds.R
	
regression_PassTd_PassYds.png: nfl_offensive_stats_subset.csv Regression.R
	Rscript Regression.R
	
RecYds_Targetsl.png: nfl_offensive_stats_subset.csv RecYds_Targets.R
	Rscript RecYds_Targets.R
	
report.html: nfl_offensive_stats_subset.csv Clustering_PassingYards.png Clustering_RushingYards.png NFL_principle_components_pass_yds.png numeric_offensivestats_subset.csv pass_completions.png pass_touchdowns.png regression_PassTd_PassYds.png NFL_explained_variance.png NFL_principle_components.png RecYds_Targetsl.png 
	R -e "rmarkdown::render(\"Report.Rmd\", output_format=\"html_document\")"