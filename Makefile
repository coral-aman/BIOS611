.PHONY: clean 

clean:
	rm -r ./derived_data/*
	rm -r ./figures/*
	rm -f report.html
	
nfl_offensive_stats_subset.csv: source_data/nfl_offensive_stats.csv read_in_data.R 
	Rscript read_in_data.R
	
pass_completions.png: nfl_offensive_stats_subset.csv CompletePasses_ByTeam.R
	Rscript CompletePasses_ByTeam.R

pass_touchdowns.png: derived_data/nfl_offensive_stats_subset.csv CompletePasses_ByTeam.R
	Rscript PassingTouchdowns_ByTeam.R
	
numeric_offensivestats_subset.csv: source_data/nfl_offensive_stats.csv NumericSubset.R
	Rscript NumericSubset.R
	
NFL_explained_variance.png: derived_data/numeric_offensivestats_subset.csv Dimensionality_Reduction.R
	Rscript Dimensionality_Reduction.R

NFL_principle_components.png: derived_data/numeric_offensivestats_subset.csv PrincipalComponents.R
	Rscript PrincipalComponents.R

NFL_principle_components_pass_yds.png: derived_data/numeric_offensivestats_subset.csv PCA_PassYds.R
	Rscript PCA_PassYds.R
	
Clustering_PassingYards.png: derived_data/numeric_offensivestats_subset.csv clustering.R
	Rscript clustering.R

Clustering_RushingYards.png: derived_data/numeric_offensivestats_subset.csv Clustering_RushYds.R
	Rscript Clustering_RushYds.R
	
regression_PassTd_PassYds.png: derived_data/nfl_offensive_stats_subset.csv Regression.R
	Rscript Regression.R
	
report.html: pass_completions.png pass_touchdowns.png regression_PassTd_PassYds.png pass_touchdowns.png
	R -e "rmarkdown::render(\"Report.Rmd\", output_format=\"html_document\")"