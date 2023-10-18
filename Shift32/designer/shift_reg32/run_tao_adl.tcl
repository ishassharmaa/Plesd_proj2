set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_adl {D:\Microsemi\projects\project2\Shift32\designer\shift_reg32\shift_reg32.adl}
read_afl {D:\Microsemi\projects\project2\Shift32\designer\shift_reg32\shift_reg32.afl}
map_netlist
read_sdc {D:\Microsemi\projects\project2\Shift32\constraint\user.sdc}
check_constraints {D:\Microsemi\projects\project2\Shift32\constraint\placer_sdc_errors.log}
write_sdc -mode layout {D:\Microsemi\projects\project2\Shift32\designer\shift_reg32\place_route.sdc}
