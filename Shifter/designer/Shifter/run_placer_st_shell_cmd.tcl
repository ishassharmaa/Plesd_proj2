read_sdc -scenario "place_and_route" -netlist "optimized" -pin_separator "/" -ignore_errors {D:/Microsemi/projects/project2/Shifter/designer/Shifter/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {D:\Microsemi\projects\project2\Shifter\designer\Shifter\Shifter_layout_combinational_loops.xml}
report -type slack {D:\Microsemi\projects\project2\Shifter\designer\Shifter\pinslacks.txt}
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {D:\Microsemi\projects\project2\Shifter\designer\Shifter\Shifter_place_and_route_constraint_coverage.xml}]
set reportfile {D:\Microsemi\projects\project2\Shifter\designer\Shifter\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp