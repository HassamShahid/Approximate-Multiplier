`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:53:31 05/23/2019 
// Design Name: 
// Module Name:    fulladder 
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
module fulladder(
    input [0:0] a,
    input [0:0] b ,
    input [0:0] cin,
    output [0:0] sum,
    output [0:0] carry
    );

assign sum = (a ^b ^cin);
assign carry = (a&b | b&cin | cin&a) ;

endmodule
