`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:42 05/30/2019 
// Design Name: 
// Module Name:    two_bit_MUX 
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
module two_bit_MUX(in1, in2, sel, out);

input in1 ;
input in2 ;
input sel ;
output reg out ;

always@(in1 or in2 or sel)
begin
	
	case(sel)
	1'b0 : begin
			
			out = in1 ;
			
			end
	
	1'b1 : begin
				
			out = in2 ;
			
			end
	endcase
end

endmodule
