`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:02:54 06/09/2019
// Design Name:   main_drum
// Module Name:   F:/summer_internship_2019/DRUM/main_drum_tb.v
// Project Name:  DRUM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_drum
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_drum_tb;

	// Inputs
	reg [7:0] in1;
	reg [7:0] in2;
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	main_drum uut (
		.in1(in1), 
		.in2(in2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 8'b01100010;
		in2 = 8'b10100010;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

