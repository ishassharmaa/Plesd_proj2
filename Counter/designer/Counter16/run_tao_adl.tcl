set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_adl {D:\Microsemi\projects\project2\Counter\designer\Counter16\Counter16.adl}
read_afl {D:\Microsemi\projects\project2\Counter\designer\Counter16\Counter16.afl}
map_netlist
read_sdc {D:\Microsemi\projects\project2\Counter\constraint\COUNT16.sdc}
check_constraints {D:\Microsemi\projects\project2\Counter\constraint\placer_sdc_errors.log}
write_sdc -mode layout {D:\Microsemi\projects\project2\Counter\designer\Counter16\place_route.sdc}
