set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_verilog -mode system_verilog {D:\Microsemi\projects\project2\Shifter\hdl\Shifter.v}
set_top_level {Shifter}
map_netlist
check_constraints {D:\Microsemi\projects\project2\Shifter\constraint\synthesis_sdc_errors.log}
write_fdc {D:\Microsemi\projects\project2\Shifter\designer\Shifter\synthesis.fdc}
