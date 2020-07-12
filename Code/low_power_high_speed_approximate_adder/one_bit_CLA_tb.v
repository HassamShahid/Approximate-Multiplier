`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:47:28 05/28/2019
// Design Name:   one_bit_LCA
// Module Name:   F:/summer_internship_2019/low_power_high_speed_approximate_adder/one_bit_CLA_tb.v
// Project Name:  low_power_high_speed_approximate_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one_bit_LCA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module one_bit_CLA_tb;

	// Inputs
	reg A;
	reg B;
	reg C0;

	// Outputs
	wire C1;
	wire SUM;

	// Instantiate the Unit Under Test (UUT)
	one_bit_LCA uut (
		.A(A), 
		.B(B), 
		.C0(C0), 
		.C1(C1), 
		.SUM(SUM)
	);

	initial begin
		// Initialize Inputs
		A = 1;
		B = 1;
		C0 = 1;

		// Wait 100 ns for global reset to finish
		#100
		
		A = 1;
		B = 1;
		C0 = 0;
		
		#100
		
		A = 1;
		B = 0;
		C0 = 0;
		
		#100 
		
		A = 0;
		B = 1;
		C0 = 1;

			#100;
			
			$finish ;
        
		// Add stimulus here

	end
      
endmodule

