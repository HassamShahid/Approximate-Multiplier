`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:03 05/28/2019 
// Design Name: 
// Module Name:    mask_of_one_bit 
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
module mask_of_one_bit(A, B, mask, sum, carry);

input A;
input B;
input mask ;
output sum; // This sum and carry of this carry maskable adder will be the direct input in the LOOKAHEAD CARRY ADDER(LCA) 
					//as the PROPAGATION OF LCA..

output carry ; //This is also a direct input in LCA as a GENERATION OF LCA .......

if(mask == 1'b0)  // this input needs some approximation as mask = 0..........
begin
	
	assign sum = A|B ;
	assign carry = 0 ;

end

else  // this input need correctness  so accurate output will  be produced ......
begin
	
	assign sum = A ^B ;
	assign carry = A &B ;

end

endmodule
