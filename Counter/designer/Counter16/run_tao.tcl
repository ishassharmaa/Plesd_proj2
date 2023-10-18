set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_verilog -mode system_verilog {D:\Microsemi\projects\project2\Counter\hdl\Counter16.v}
set_top_level {Counter16}
map_netlist
check_constraints {D:\Microsemi\projects\project2\Counter\constraint\synthesis_sdc_errors.log}
write_fdc {D:\Microsemi\projects\project2\Counter\designer\Counter16\synthesis.fdc}
