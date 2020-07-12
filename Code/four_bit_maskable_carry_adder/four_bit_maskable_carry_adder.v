`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:27:43 05/23/2019 
// Design Name: 
// Module Name:    four_bit_maskable_carry_adder 
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
module four_bit_maskable_carry_adder(
    input [3:0] a,
    input [3:0] b,
    input [3:0] mask,
    output [4:0] sum
    );

// HERE 4 BIT MASKABLE CARRY ADDER WILL REQUIRE 1 HALF ADDER AND 3 FULL ADDERS AND BASED ON THE VALUE OF THE MASKP SIGNAL
// WE WILL DECIDE THAT WE WILL HAVE TO DO THE ACCURATE CALCULATION OR APPROXIMATE CALCULATION .....

wire carry1 ;
wire carry2 ;
wire carry 3;


// This one is for the half adder when we have taken the FIRST MASK INPUT....

if(mask[0] == 0)
begin
		approximate_half_adder HA1(
		
		.a(a[0]);
		.b(b[0]);
		.sum(sum[0]);
		.cout(carry1) ;
		);
end

else
begin
		ha HA1(
		
		.a(a[0]);
		.b(b[0]) ;
		.sum(sum[0]) ;
		.carry(carry1);
		);
end


// This one is for Second stage and here i have three conditions and for FULL ADDER i will use ....

if(mask[1]==0 && carry1==0) // Means this will work as like a approximate half adder/.....
begin
	
	approximate_half_adder 	FA1(
	
	.a(a[1]);
	.b(b[1]);
	.sum(sum[1]);
	.cout(carry2);
	
	);	
end


else if(mask[1]==0) // This is a dilemma case where the value of carry is not defined 
begin
	
	approximate_full_adder FA1(
	
	.a(a[1]);
	.b(b[1]);
	.cin(carry1);
	.sum(sum[1]);
	.cout(carry2);
	
	);

end

else 
begin	
	
	fulladder(
	
	.a(a[1]);
	.b(b[1]);
	.cin(carry1);
	.sum(sum[1]);
	.carry(carry2);
	
	);

end



// This one is for Third stage and here i have three conditions and for FULL ADDER 2 i will use ....

if(mask[2]==0 && carry2==0) // Means this will work as like a approximate half adder/.....
begin
	
	approximate_half_adder 	FA1(
	
	.a(a[2]);
	.b(b[2]);
	.sum(sum[2]);
	.cout(carry3);
	
	);	
end


else if(mask[2]==0) // This is a dilemma case where the value of carry is not defined 
begin
	
	approximate_full_adder FA1(
	
	.a(a[2]);
	.b(b[2]);
	.cin(carry2);
	.sum(sum[2]);
	.cout(carry3);
	
	);

end

else 
begin	
	
	fulladder(
	
	.a(a[2]);
	.b(b[2]);
	.cin(carry2);
	.sum(sum[2]);
	.carry(carry3);
	
	);

end


// This one is for Fourth stage and here i have three conditions and for FULL ADDER 3 i will use ....

if(mask[3]==0 && carry3==0) // Means this will work as like a approximate half adder/.....
begin
	
	approximate_half_adder 	FA1(
	
	.a(a[3]);
	.b(b[3]);
	.sum(sum[3]);
	.cout(sum[4]);
	
	);	
end


else if(mask[1]==0) // This is a dilemma case where the value of carry is not defined 
begin
	
	approximate_full_adder FA1(
	
	.a(a[3]);
	.b(b[3]);
	.cin(carry3);
	.sum(sum[3]);
	.cout(sum[4]);
	
	);

end

else 
begin	
	
	fulladder(
	
	.a(a[3]);
	.b(b[3]);
	.cin(carry3);
	.sum(sum[3]);
	.carry(sum[4]);
	
	);

end



endmodule



