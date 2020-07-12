`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:42:16 05/30/2019
// Design Name:   sixteen_bit_low_power_yet_high_speed_approximate_adder
// Module Name:   F:/summer_internship_2019/low_power_high_speed_approximate_adder/sixteen_bit_low_power_yet_high_speed_approximate_adder_tb.v
// Project Name:  low_power_high_speed_approximate_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sixteen_bit_low_power_yet_high_speed_approximate_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sixteen_bit_low_power_yet_high_speed_approximate_adder_tb;

	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg [2:0] mask;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	sixteen_bit_low_power_yet_high_speed_approximate_adder uut (
		.in1(in1), 
		.in2(in2), 
		.out(out), 
		.mask(mask)
	);

	initial begin
		// Initialize Inputs
		in1 = 16'b1010101010101010;
		in2 = 16'b1100110011001100;
		mask = 3'b011;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

