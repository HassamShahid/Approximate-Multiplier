`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:56 05/28/2019 
// Design Name: 
// Module Name:    one_bit_LCA 
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
module one_bit_LCA(A, B, C0, C1, SUM);

input A;
input B;
input C0 ;
output SUM ;  // The inputs of this LCA is the output of the carry_maskable_adder so these inputs le lia
output C1 ;					// call that function of one bit cafrry maskable adder/..... 

wire P ;
wire G ;

one LCA1(

.sum(A),  // carry maskable one bit ka "sum" (output) will be the input A in the LCA one bit...
.carry(B)  // carry maskable one bit ka "carry" (output) will be the input B in the LCA one bit..........

);

assign P = A ^B ;
assign G = A &B ;

assign SUM = (P ^C0) ;
assign C1 = (G | P&C0)  ;

endmodule
