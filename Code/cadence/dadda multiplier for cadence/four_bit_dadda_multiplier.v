`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:41 06/14/2019 
// Design Name: 
// Module Name:    four_bit_dadda_multiplier 
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
module four_bit_dadda_multiplier(in1, in2, out);

input [3:0] in1;
input [3:0] in2;
output [7:0] out ;

integer i ;

reg [3:0] temp0, temp1 , temp2, temp3 ;


wire s11, c11, c12, s12, c13, s13, s14, c14, s15, c15, s16, c16, s17, c17,s18,c18,s19,c19, s21, c21, c22, s22, c23, s23, s24, c24, s25, c25, s26, c26, s27,s28,c28,s29,c29, s210,c210; 
wire s31, c31, c32, s32, c33, s33, s34, c34, s35, c35, s36, c36, s37,s38,c38,s39,c39, s310,c310 ;
wire s41, c41, c42, s42, c43, s43, s44, c44, s45, c45, s46, c46, s47,s48,c48,s49,c49, s410,c410 ;
wire s51, c51, c52, s52, c53, s53, s54, c54, s55, c55, s56, c56, s57,s58,c58,s59,c59, s510,c510 ;
wire s61, c61, c62, s62, c63, s63, s64, c64, s65, c65, s66, c66, s67,s68,c68,s69,c69, s610,c610,s611,c611 ;
wire s71, c71, c72, s72, c73, s73, s74, c74, s75, c75, s76, c76, s77,c77,s78,c78,s79,c79, s710,c710,s711,c711 ;



always @(in1 or in2)
begin

for(i=0; i<=3; i= i+1)
begin

	temp0[i] <= (in1[i] &in2[0] ) ;
	temp1[i] <= (in1[i] &in2[1] ) ;
	temp2[i] <= (in1[i] &in2[2] ) ;
	temp3[i] <= (in1[i] &in2[3] ) ;
	
end
end


half_adder call11(

.in1({temp0[3], temp1[2]}),
.sum(s11) ,
.cout(c11)

);


half_adder call12(

.in1({temp1[3], temp2[2]}),
.sum(s12) ,
.cout(c12)

);


////////////////////////////////////////////////////


half_adder call21(

.in1({temp0[2], temp1[1]}),
.sum(s21), 
.cout(c21)

);


full_adder call22(

.in1({s11, temp2[1], temp3[0]}),
.sum(s22) ,
.cout(c22)

);


full_adder call23(

.in1({s12, c11, temp3[1]}),
.sum(s23),
.cout(c23)

);


full_adder call24(

.in1({temp2[3], temp3[2], c12}),
.sum(s24),
.cout(c24)

);

///////////////////////////////////////////////////


assign out[0] = temp0[0] ;

half_adder call31(

.in1({temp0[1], temp1[0]}),
.sum(out[1]) ,
.cout(c31)

);

full_adder call32(

.in1({temp2[0], s21, c31}) ,
.sum(out[2]),
.cout(c32)

);

full_adder call33(

.in1({s22, c21, c32}),
.sum(out[3]),
.cout(c33)

);

full_adder call34(

.in1({s23, c22, c33}),
.sum(out[4]),
.cout(c34)

);


full_adder call35(

.in1({s24, c23, c34}),
.sum(out[5]) ,
.cout(c35)

);


full_adder call36(

.in1({temp3[3], c24, c35}),
.sum(out[6]) ,
.cout(out[7])

);






endmodule
