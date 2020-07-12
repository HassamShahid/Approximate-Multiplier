`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:42:00 05/23/2019 
// Design Name: 
// Module Name:    four_bit_ripple_carry_adder 
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
module four_bit_ripple_carry_adder(
    input [3:0] a,
    input [3:0] b,
	 input cin , // This will be the first carry input that i will give .
    output reg [3:0] sum,
    output reg [0:0] carry
    );

	wire c[3:1] ; // These are the carry that will be the output of first and input of second.....
	
	
	// Here strategy is , whenever any two of the 
always @(a or b or cin)
begin

if((a[0]&b[0]&cin==1'b1)) // condition when all three (a,b,c) are one then sum=1 and carry=1
begin
sum[0] = 1;
c[1] = 1 ;
end

else if((a[0]&b[0]==1)|(a[0]&cin==1)|(b[0]&cin==1)) // when any two of them are one then sum=0 and carry=1
begin
sum[0] = 0;
c[1] = 1;
end

else if(a[0]|b[0]|cin==1) // when any one of them is one. then sum=1 and carry==0;
begin
sum[0] = 1;
c[1] = 0 ;
end

else
begin
sum[0] = 0;
c[1] = 0;
end

// This one is now for 2nd Full adder..........

if((a[1]&b[1]&c[1]==1'b1))
begin
sum[1] = 1;
c[2] = 1 ;
end

else if((a[1]&b[1]==1)|(a[1]&c[1]==1)|(b[1]&c[1]==1))
begin
sum[1] = 0;
c[2] = 1;
end

else if(a[1]|b[1]|c[1]==1)
begin
sum[1] = 1;
c[2] = 0 ;
end

else
begin
sum[1] = 0;
c[2] = 0;
end

// This one is for 3rd FULL ADDER.....

if((a[2]&b[2]&c[2]==1'b1))
begin
sum[2] = 1;
c[3] = 1 ;
end

else if((a[2]&b[2]==1)|(a[2]&c[2]==1)|(b[2]&c[2]==1))
begin
sum[2] = 0;
c[3] = 1;
end

else if(a[2]|b[2]|c[2]==1)
begin
sum[2] = 1;
c[3] = 0 ;
end

else
begin
sum[2] = 0;
c[3] = 0;
end

// This is for the LAST full adder........

if((a[3]&b[3]&c[3]==1'b1))
begin
sum[3] = 1;
carry = 1 ;
end

else if((a[3]&b[3]==1)|(a[3]&c[3]==1)|(b[3]&c[3]==1))
begin
sum[3] = 0;
carry = 1;
end

else if(a[3]|b[3]|c[3]==1)
begin
sum[3] = 1;
carry = 0 ;
end

else
begin
sum[3] = 0;
carry = 0;
end

end
endmodule
