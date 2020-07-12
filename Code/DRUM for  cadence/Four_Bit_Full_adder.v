`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:25 06/09/2019 
// Design Name: 
// Module Name:    Four_Bit_Full_adder 
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
module Four_Bit_Full_adder(in1, in2, sum);

input [3:0] in1;
input [3:0] in2 ;
output [4:0] sum ;

wire carry1, carry2, carry3 ;


assign sum[0] = (in1[0] ^ in2[0] ^1'b0 ) ; 
assign carry1 = ((in1[0] &in2[0]) | (in2[0] &1'b0) |(1'b0 &in1[0]));
assign sum[1] = (in1[1] ^ in2[1] ^carry1 ) ; 
assign carry2 = ((in1[1] &in2[1]) | (in2[1] &carry1) |(carry1 &in1[1]));
assign sum[2] = (in1[2] ^ in2[2] ^carry2 ) ; 
assign carry3 = ((in1[2] &in2[2]) | (in2[2] &carry2) |(carry2 &in1[2]));
assign sum[3] = (in1[3] ^ in2[3] ^carry3 ) ; 
assign sum[4] = ((in1[3] &in2[3]) | (in2[3] &carry3) |(carry3 &in1[3]));


endmodule


