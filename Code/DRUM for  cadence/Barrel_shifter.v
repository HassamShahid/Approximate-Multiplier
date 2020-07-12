`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:29:17 06/09/2019 
// Design Name: 
// Module Name:    Barrel_shifter 
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
module Barrel_shifter(in1, out);

input [7:0] in1 ; 
output [15:0] out ;


// Here as the input is of the 8- bit so we were allowed to shift the output of the approximated multiplication by the log(8) bits ie ; = 3 bits....

assign out = (in1 << 3) ;





endmodule
