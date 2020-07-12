`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:34 05/29/2019
// Design Name:   low_power_adder
// Module Name:   F:/summer_internship_2019/low_power_high_speed_approximate_adder/low_power_adder_tb.v
// Project Name:  low_power_high_speed_approximate_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: low_power_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module low_power_adder_tb;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;
	reg [2:0] mask;

	// Outputs
	
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	low_power_adder uut (
		.in1(in1), 
		.in2(in2), 
		.mask(mask), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 4'b1010;
		in2 = 4'b1100;
		mask = 3'b111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

