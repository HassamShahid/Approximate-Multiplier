`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:02 05/23/2019 
// Design Name: 
// Module Name:    approximateadder 
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
module approximate_half_adder(
    input  a,
    input  b,
    output  sum,
    output  cout
    );

assign sum = a | b ;
assign cout = 0 ; 

endmodule
