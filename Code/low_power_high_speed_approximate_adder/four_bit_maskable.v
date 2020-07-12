`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:55 05/28/2019 
// Design Name: 
// Module Name:    four_bit_maskable 
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
module four_bit_maskable(A, B, mask, sum);

input [3:0] A;
input [3:0] B;
input [3:0] mask ;
output [3:0] sum ;
output [3:0] carry ;

///////////////////////////// This is the first step and i will simply call the carry maskable adder four times...

one CMHA1(

.A(A[0]) ,
.B(B[0]) ,
.mask(mask[0]) ,
.sum(sum[0]) , // i will have to use this "sum[0]" as the input in lookahead carry adder
.carry(carry[0]) // i will have to use this "carry[0]" as the input in the lookahead carry adder ...

);

/////////////////////////////////// This is the second step and again calling the source..

one CMHA2(

.A(A[1]) ,
.B(B[1]) ,
.mask(mask[1]) ,
.sum(sum[1]) ,  // This is the input1[1] in the lookahead carry adder 
.carry(carry[1]) // this is the input2[1] in the lookahead carry adder...

);


////////////////////////////////////// THis is the third step...........

one CMHA3(

.A(A[2]) ,
.B(B[2]) ,
.mask(mask[2]) ,
.sum(sum[2]) ,
.carry(carry[2])

);


/////////////////////////////////////////////// This is the last stage ............

one CMHA1(

.A(A[3]) ,
.B(B[3]) ,
.mask(mask[3]) ,
.sum(sum[3]) ,
.carry(carry[3])

);



endmodule
