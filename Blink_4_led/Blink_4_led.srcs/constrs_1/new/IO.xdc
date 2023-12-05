
## Clock signal 125 MHz

set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports sysclk]

##Switches

set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {sw[0]}]
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {sw[1]}]

##RGB LEDs

set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports led4_b]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports led4_g]
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports led4_r]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports led5_b]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports led5_g]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports led5_r]

##LEDs

set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {led[3]}]

##Buttons

set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {btn[0]}]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports {btn[1]}]
set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports {btn[2]}]
set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports {btn[3]}]

create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports sysclk]
