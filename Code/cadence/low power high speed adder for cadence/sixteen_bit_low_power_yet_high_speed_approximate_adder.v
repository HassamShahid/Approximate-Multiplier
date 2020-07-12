`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:13 05/30/2019 
// Design Name: 
// Module Name:    sixteen_bit_low_power_yet_high_speed_approximate_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sixteen_bit_low_power_yet_high_speed_approximate_adder(in1, in2, out, mask );

input [15:0] in1 ;
input [15:0] in2 ;
input [2:0] mask ;    // One thing we have to keep in the mind that mask signal will 
							//	remain of 3 bits either it is a 16 bit adder or 4 bit adder or will be 32 bit adder..
							// so changes will be made as per that requirement in the previous low bit adder that you made ..
							// like while making 16 bit adder changes in 4 bit adder should be made....
output [15:0] out ;


low_power_adder adder_1(

.in1(in1[3:0]) ,
.in2(in2[3:0]) ,
.mask (mask[0]) ,
.out(out[3:0])

);


low_power_adder adder_2(

.in1(in1[7:4]),
.in2(in2[7:4]) ,
.mask(mask[1]) ,
.out(out[7:4])

);


low_power_adder adder_3(

.in1(in1[11:8]) ,
.in2(in2[11:8]) ,
.mask(mask[2]) ,
.out(out[11:8])

);

low_power_adder adder_4(

.in1(in1[15:12]) ,
.in2(in2[15:12]) ,
.mask(1'b1) ,
.out(out[15:12])

);

endmodule
