`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:01:29 06/15/2019
// Design Name:   eight_bit_dadda_multiplier
// Module Name:   F:/summer_internship_2019/dadda_multiplier/eight_bit_dadda_multiplie_tb.v
// Project Name:  dadda_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eight_bit_dadda_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eight_bit_dadda_multiplie_tb;

	// Inputs
	reg [7:0] in1;
	reg [7:0] in2;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	eight_bit_dadda_multiplier uut (
		.in1(in1), 
		.in2(in2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 8'b11111111;
		in2 = 8'b11111111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

