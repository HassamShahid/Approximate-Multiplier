`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:39:28 05/30/2019 
// Design Name: 
// Module Name:    carry_prediction 
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
module carry_prediction(in1, in2, cin, carry);

input in1;
input in2;
input cin;
output carry ;

wire P;
wire G ;   // this is the present step "generation" ..............

assign P = in1 ^in2 ;
assign G = in1 &in2 ;

assign carry = (G | (P&cin)) ;     // when we will call this then cin will be the previous step carry ...

endmodule
