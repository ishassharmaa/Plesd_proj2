read_sdc -scenario "timing_analysis" -netlist "optimized" -pin_separator "/" -ignore_errors {D:/Microsemi/projects/project2/Shifter/designer/Shifter/timing_analysis.sdc}
set_options -analysis_scenario "timing_analysis" 
save
