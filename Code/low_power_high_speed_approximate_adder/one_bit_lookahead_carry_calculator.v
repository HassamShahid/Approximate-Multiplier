`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:40 05/29/2019 
// Design Name: 
// Module Name:    one_bit_lookahead_carry_calculator 
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
module one_bit_lookahead_carry_calculator(A, B, C0, C);

input A; // this will be the carry PROPAGATOR ....
input B;  // this will be the carry GENERATOR..
input C0; // this is the carry of the previous step ....
output C; // this is the or of genertor , & and of C0 and propagator ...

assign C = (B | (A&C0)) ;

endmodule
