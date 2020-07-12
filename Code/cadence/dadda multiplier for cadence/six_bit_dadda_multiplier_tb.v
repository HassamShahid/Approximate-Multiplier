`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:35:49 06/14/2019
// Design Name:   six_bit_dadda_mutliplier
// Module Name:   F:/summer_internship_2019/dadda_multiplier/six_bit_dadda_multiplier_tb.v
// Project Name:  dadda_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: six_bit_dadda_mutliplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module six_bit_dadda_multiplier_tb;

	// Inputs
	reg [5:0] in1;
	reg [5:0] in2;

	// Outputs
	wire [11:0] out;

	// Instantiate the Unit Under Test (UUT)
	six_bit_dadda_mutliplier uut (
		.in1(in1), 
		.in2(in2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 6'd63;
		in2 = 6'd51;

		// Wait 100 ns for global reset to finish
		#100
		
		in1 = 6'd55;
		in2 = 6'd51 ;
		#100
		
		in1 = 6'd22 ;
		in2 = 6'd33 ;
		#100 
		
		in1 = 6'd33 ;
		in2 = 6'd24 ;
         
		// Add stimulus here

	end
      
endmodule

