set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_adl {D:\Microsemi\projects\project2\Shifter\designer\Shifter\Shifter.adl}
read_afl {D:\Microsemi\projects\project2\Shifter\designer\Shifter\Shifter.afl}
map_netlist
read_sdc {D:\Microsemi\projects\project2\Shifter\constraint\user.sdc}
check_constraints {D:\Microsemi\projects\project2\Shifter\constraint\timing_sdc_errors.log}
write_sdc -mode smarttime {D:\Microsemi\projects\project2\Shifter\designer\Shifter\timing_analysis.sdc}
