`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:53 05/28/2019 
// Design Name: 
// Module Name:    one_bit_lookahead_carry_adder 
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
module one_bit_lookahead_carry_adder(A, B, C0, P, G, C1);

input A;
input B;
input C0 ;  // initially for the main model in first look ahead adder it will be ZERO.
output P;
output G ;
output C1;

assign P = A ^B ;
assign G = A &B ;
assign C1 = (G | (P&C0)) ;

endmodule
