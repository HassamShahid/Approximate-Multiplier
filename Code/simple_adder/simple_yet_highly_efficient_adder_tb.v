`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:04:05 05/31/2019
// Design Name:   simple__yet_highly_efficient_adder
// Module Name:   F:/summer_internship_2019/simple_adder/simple_yet_highly_efficient_adder_tb.v
// Project Name:  simple_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: simple__yet_highly_efficient_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simple_yet_highly_efficient_adder_tb;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;
	reg [2:0] sel;
	reg cin;

	// Outputs
	wire [4:0] sum;

	// Instantiate the Unit Under Test (UUT)
	simple__yet_highly_efficient_adder uut (
		.in1(in1), 
		.in2(in2), 
		.sel(sel), 
		.sum(sum), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		in1 = 4'b0111;
		in2 = 4'b1101;
		sel = 3'b111;
		cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

