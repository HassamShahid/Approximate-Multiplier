`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:57:10 05/23/2019 
// Design Name: 
// Module Name:    ripple_carry_adder_4_bit 
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
module ripple_carry_adder_4_bit(
    input [0:0] a,
    input [3:0] a,
    input [3:0] b,
    input [0:0] cin,
    output [3:0] sum,
    output [0:0] cout
    );
 
 wire carry0;
 wire carry1;
 wire carry2; 


fulladder FA1(    // This is function call to full adder another file.... remember name should be identical of that file 
						// to whom we are calling .......
	.a(a[0]);
	.b(b[0]);
	.cin(cin);
	.sum(sum[0]);
	.carry(carry0);
);

fulladder FA2(

	.a(a[1]);
	.b(b[1]);
	.cin(carry0);
	.sum(sum[1]);
	.carry(carry1);
);

fulladder FA3(

	.a(a[2]);
	.b(b[2]);
	.cin(carry1);
	.sum(sum[2]);
	.carry(carry2);
);

fulladder FA4(
	
	.a(a[3]);
	.b(b[3]);
	.cin(carry2);
	.sum(sum[3]);
	.carry(cout);
);

endmodule
