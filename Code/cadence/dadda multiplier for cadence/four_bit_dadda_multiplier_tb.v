`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:37:38 06/14/2019
// Design Name:   four_bit_dadda_multiplier
// Module Name:   F:/summer_internship_2019/dadda_multiplier/four_bit_dadda_multiplier_tb.v
// Project Name:  dadda_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_bit_dadda_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_bit_dadda_multiplier_tb;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	four_bit_dadda_multiplier uut (
		.in1(in1), 
		.in2(in2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 4'd12;
		in2 = 4'd13;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

