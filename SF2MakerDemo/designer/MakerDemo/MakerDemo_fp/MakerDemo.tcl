open_project -project {C:\Microsemi_Prj\SF2MakerDemo\designer\MakerDemo\MakerDemo_fp\MakerDemo.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {C:\Microsemi_Prj\SF2MakerDemo\designer\MakerDemo\MakerDemo.map} \
    -header {C:\Microsemi_Prj\SF2MakerDemo\designer\MakerDemo\MakerDemo.hdr} \
    -spm {C:\Microsemi_Prj\SF2MakerDemo\designer\MakerDemo\MakerDemo.spm} \
    -dca {C:\Microsemi_Prj\SF2MakerDemo\designer\MakerDemo\MakerDemo.dca}
export_single_ppd \
    -name {M2S010} \
    -file {C:\Microsemi_Prj\SF2MakerDemo\designer\MakerDemo\MakerDemo.ppd}

save_project
close_project
