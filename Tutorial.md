# LEDs Blink on PYNQ-Z2 Board
  
In this repository, I would like to introduce how to create an application on FPGA PYNQ-Z2 Board - Blink LEDs.  

# Make project  
First, let's make a new project from scratch.  

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/395825bb-be4a-4100-8f43-2aa42a2b0409)  

Then we will name the project and its path  

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/3cc58206-2aa7-46e3-b312-2d2ab0aec06d)  

Click on the next button  

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/6333e99b-5cf3-44cc-9593-d97500f6ab0e)    

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/6abbe258-f7d0-4194-be64-d06aa74543bb)  

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/e865ce87-1a9a-4e4b-a6fa-f5b464e2101e)  

Search PYNQ board from the Search table:  

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/7c103890-1019-4bfc-861a-6fc01fd77c5e)

# Coding
Click to add Source

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/5e15ae14-603e-48fd-9b61-0e48b07d2350)  

Then make a new design source  

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/43f96ec9-ed59-4d5f-a642-73aa7baf3c7a)  

Make a new file name "top.v" and add it to the project folder

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/50798295-900b-4d94-b545-7ef0b7d3c3d7)  

Then make a new Constant file name "io.xdc" 

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/740b0cb8-940e-4b14-bf3c-da6b3c992551)  

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/51bacee9-0559-4aba-9a39-dbdc0d351a64)

Copy this code from "Blink_4_led/Blink_4_led.srcs/sources_1/new/top.v" to file "top.v"

```
`timescale 1ns / 1ps 

module led_blink(
    input sysclk,
    output [3:0] led 
    );  
    
// led 0 
reg data = 1'b1;
reg [32:0] counter;
reg [32:0] count;
reg state;
reg toggle;

assign led[0] = data;   // static value of led 
assign led[1] = state;  // blinker    
assign led[2] = ~state; // blinker
assign led[3] = toggle; // 50% brightness
        
always @ (posedge sysclk) 
begin
    counter <= counter + 1;
    count <= count + 1;

    //led 1,2
    state <= count[23];

    //led 3
    toggle <= ~toggle;
    
end

endmodule
```

and this code to "io.xdc" from "Blink_4_led/Blink_4_led.srcs/constrs_1/new/IO.xdc"

```

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
```

let's create our Clocking wizard. Open the IP Catalog, and search for Clocking wizard   

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/02310ef3-1315-4580-92e0-412da45059c5)

Save to IP Source

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/2d98145f-4fb5-444d-9ebe-c53c76776662)

# Make Bitstream
To upload the code, click to generate bitstream

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/2c6e46be-9f13-45c6-8620-49fd10445f12) 

Open Hardware  Manager  

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/1598e1e8-0632-4d7e-8c41-00de8f86a9d9)

# Program
When Bitstream Generation successful, program device:

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/61153ef4-a752-4b11-a49d-d6b11f1f83ca)

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/768d64ba-a556-45f5-a15d-015dc60fe2ec)

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/84fee85b-8bce-4d58-bc51-773faeb3e234)

![image](https://github.com/HocJ2me/LED-Blink-Verilog-PYNQ-Z2/assets/45262669/25451751-6811-4ac2-951a-dd9006cd22e7)


The and
