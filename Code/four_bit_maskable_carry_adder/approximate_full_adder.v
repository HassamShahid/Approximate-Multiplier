`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:27 05/23/2019 
// Design Name: 
// Module Name:    approximate_full_adder 
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
module approximate_full_adder(

input a,
input b,
input cin,
output sum,
output cout
);


assign sum = a|b|cin ;
assign cout = 0;


endmodule
