`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:44 06/09/2019 
// Design Name: 
// Module Name:    Four_Bit_Multiplication 
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
module Four_Bit_Multiplication(in1, in2, out);

input [3:0] in1;
input [3:0] in2 ;
output [7:0] out;     // This will be the approximated sum of the converted "K" bits from the given "n" bits ....


wire [3:0] temp1 ;   // Partial product 1 ...................
wire [3:0] temp2 ;
wire [3:0] temp3 ;
wire [3:0] temp4 ;

wire [4:0] preout1 ;
wire [4:0] preout2 ;
wire [4:0] preout3 ;

wire [3:0] postout1 ;
wire [3:0] postout2 ;

////////////////////////////////////////////


and(temp1[0], in2[0] ,in1[0]);
and(temp1[1], in2[1] ,in1[0]);
and(temp1[2], in2[2] ,in1[0]);
and(temp1[3], in2[3] ,in1[0]);
and(temp2[0], in2[0] ,in1[1]);
and(temp2[1], in2[1] ,in1[1]);
and(temp2[2], in2[2] ,in1[1]);
and(temp2[3], in2[3] ,in1[1]);
and(temp3[0], in2[0] ,in1[2]);
and(temp3[1], in2[1] ,in1[2]);
and(temp3[2], in2[2] ,in1[2]);
and(temp3[3], in2[3] ,in1[2]);
and(temp4[0], in2[0] ,in1[3]);
and(temp4[1], in2[1] ,in1[3]);
and(temp4[2], in2[2] ,in1[3]);
and(temp4[3], in2[3] ,in1[3]);



/////////////////////////////////////////////////


assign out[0] = temp1[0] ;

Four_Bit_Full_adder call1(


.in1({1'b0,temp1[3:1]}),
.in2(temp2) ,
.sum(preout1)

);

assign out[1] = preout1[0] ;
assign postout1 = preout1[4:1] ;


Four_Bit_Full_adder call2(

.in1(temp3) ,
.in2(postout1),
.sum(preout2)

);

assign out[2] = preout2[0] ;
assign postout2 = preout2[4:1] ;



Four_Bit_Full_adder call3(

.in1(temp4) ,
.in2(postout2) ,
.sum(out[7:3])

);


endmodule
