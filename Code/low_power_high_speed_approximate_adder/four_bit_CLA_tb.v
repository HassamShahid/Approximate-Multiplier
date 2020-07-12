`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:54:37 05/28/2019
// Design Name:   four_bit_CLA
// Module Name:   F:/summer_internship_2019/low_power_high_speed_approximate_adder/four_bit_CLA_tb.v
// Project Name:  low_power_high_speed_approximate_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_bit_CLA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_bit_CLA_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg C0;

	// Outputs
	wire [4:0] SUM;

	// Instantiate the Unit Under Test (UUT)
	four_bit_CLA uut (
		.A(A), 
		.B(B), 
		.SUM(SUM), 
		.C0(C0)
	);

	initial begin
		// Initialize Inputs
		A = 4'b1010;
		B = 4'b1011;
		C0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

