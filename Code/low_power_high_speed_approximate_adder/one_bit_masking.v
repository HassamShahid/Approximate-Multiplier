`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:02 05/28/2019 
// Design Name: 
// Module Name:    one 
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
module one(A , B, sum, carry , mask);

input A;
input B;
input mask;
output reg sum ;
output reg carry ;

always @(A or B or mask)
begin
case(mask)

	1'b0: begin
		sum = (A |B) ;
		carry = 1'b0 ;	
			end

	1'b1: begin
		sum = (A ^B) ;
	   carry = (A &B)  ;
			end
		
	endcase
	
end

endmodule
