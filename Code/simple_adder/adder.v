`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:06 05/30/2019 
// Design Name: 
// Module Name:    adder 
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
module adder(in1, in2, cin, sum, carry);

input in1 ;
input in2 ;
input cin ;
output sum ;
output carry ;

reg G ;
reg P ;

always@(in1 or in2 or cin)
begin
	
	assign P = (in1 ^ in2 ) ;
	assign G = (in1 & in2 ) ;

end


assign sum = (P ^ cin) ;
assign carry = (G | P&cin) ;

endmodule
