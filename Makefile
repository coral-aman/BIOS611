.PHONY: clean 

clean:
	rm derived_data/*
	rm logs/*
	rm figures/*
	
nfl_offensive_stats_subset.csv: source_data/nfl_offensive_stats.csv read_in_data.R 
	Rscript read_in_data.R
	
pass_completions.png: derived_data/nfl_offensive_stats_subset.csv CompletePasses_ByTeam.R
	Rscript CompletePasses_ByTeam.R

pass_touchdowns.png: derived_data/nfl_offensive_stats_subset.csv CompletePasses_ByTeam.R
	Rscript PassingTouchdowns_ByTeam.R