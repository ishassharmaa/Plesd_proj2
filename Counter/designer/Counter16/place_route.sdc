# Microsemi Corp.
# Date: 2023-Oct-18 13:22:20
# This file was generated based on the following SDC source files:
#   D:/Microsemi/projects/project2/Counter/constraint/COUNT16.sdc
#

create_clock -name {clk} -period 5.714 -waveform {0 2.857 } [ get_ports { clk } ]
set_input_delay 1 -min  -clock { clk } [ get_ports { en rst } ]
set_input_delay 2 -max  -clock { clk } [ get_ports { en rst } ]
set_output_delay -2.5  -clock { clk } [ all_outputs ]
