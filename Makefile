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
	
report.html: pass_completions.png pass_touchdowns.png 
	R -e "rmarkdown::render(\"Report.Rmd\", output_format=\"html_document\")"