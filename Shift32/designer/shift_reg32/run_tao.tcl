set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_verilog -mode verilog_2k {D:\Microsemi\projects\project2\Shift32\hdl\shift_reg32.v}
set_top_level {shift_reg32}
map_netlist
check_constraints {D:\Microsemi\projects\project2\Shift32\constraint\synthesis_sdc_errors.log}
write_fdc {D:\Microsemi\projects\project2\Shift32\designer\shift_reg32\synthesis.fdc}
