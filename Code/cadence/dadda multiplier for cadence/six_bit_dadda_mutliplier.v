`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:35 06/14/2019 
// Design Name: 
// Module Name:    six_bit_dadda_mutliplier 
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
module six_bit_dadda_mutliplier(in1, in2, out);

input [5:0] in1; 
input [5:0] in2;
output [11:0] out ;


integer i ;
reg [5:0] temp0 , temp1, temp2, temp3, temp4, temp5 ;


always @(in1 or in2)
begin

	for(i=0; i<=5; i=i+1)
	begin
	
		temp0[i] <= (in1[i] &in2[0]);
		temp1[i] <= (in1[i] &in2[1]) ;
		temp2[i] <= (in1[i] &in2[2]) ;
		temp3[i] <= (in1[i] &in2[3]) ;
		temp4[i] <= (in1[i] &in2[4]) ;
		temp5[i] <= (in1[i] &in2[5]) ;
		
	end

end


wire s11, c11, c12, s12, c13, s13, s14, c14, s15, c15, s16, c16, s17, c17,s18,c18,s19,c19, s21, c21, c22, s22, c23, s23, s24, c24, s25, c25, s26, c26, s27,s28,c28,s29,c29, s210,c210; 
wire s31, c31, c32, s32, c33, s33, s34, c34, s35, c35, s36, c36, s37,s38,c38,s39,c39, s310,c310 ;
wire s41, c41, c42, s42, c43, s43, s44, c44, s45, c45, s46, c46, s47,s48,c48,s49,c49, s410,c410 ;
wire s51, c51, c52, s52, c53, s53, s54, c54, s55, c55, s56, c56, s57,s58,c58,s59,c59, s510,c510 ;
wire s61, c61, c62, s62, c63, s63, s64, c64, s65, c65, s66, c66, s67,s68,c68,s69,c69, s610,c610,s611,c611 ;
wire s71, c71, c72, s72, c73, s73, s74, c74, s75, c75, s76, c76, s77,c77,s78,c78,s79,c79, s710,c710,s711,c711 ;

//////////////////////////////////////////////////////////////////////////


half_adder call11(

.in1({temp0[4], temp1[3]}),
.sum(s11) ,
.cout(c11)

);

full_adder call12(

.in1({temp0[5], c11, temp1[4]}),
.sum(s12) ,
.cout(c12)

);

half_adder call13(

.in1({temp2[3], temp3[2]}),
.sum(s13) ,
.cout(c13)

);

full_adder call14(

.in1({c12, c13, temp1[5]}),
.sum(s14) ,
.cout(c14)

);

half_adder call15(

.in1({temp2[4] , temp3[3]}),
.sum(s15),
.cout(c15)

);

full_adder call16(

.in1({temp2[5], c14, c15}) ,
.sum(s16) ,
.cout(c16)

);


//////////////////////////////////////////////////////////////////////////////

half_adder call21(

.in1({temp0[3], temp1[2]}),
.sum(s21),
.cout(c21)

);


full_adder call22(

.in1({c21, s11, temp2[2]}),
.sum(s22),
.cout(c22)

);

full_adder call23(

.in1({c22, s12, s13}),
.sum(s23),
.cout(c23)

);

full_adder call24(

.in1({c23, s14, s15}),
.sum(s24),
.cout(c24)

);

full_adder call25(

.in1({c24, s16, temp3[4]}),
.sum(s25),
.cout(c25)

);

full_adder call26(

.in1({c25, c16, temp3[5]}),
.sum(s26),
.cout(c26)

);


///////////////////////////////////////////////////////////////


half_adder call31(

.in1({temp0[2], temp1[1]}),
.sum(s31),
.cout(c31)

);


full_adder call32(

.in1({c31, s21, temp2[1]}),
.sum(s32),
.cout(c32)

);

full_adder call33(

.in1({c32, s22, temp3[1]}),
.sum(s33),
.cout(c33)

);

full_adder call34(

.in1({c33, s23, temp4[1]}),
.sum(s34),
.cout(c34)

);

full_adder call35(

.in1({c34, s24, temp4[2]}),
.sum(s35),
.cout(c35)

);

full_adder call36(

.in1({c35, s25, temp4[3]}),
.sum(s36),
.cout(c36)

);

full_adder call37(

.in1({c36, s26, temp4[4]}),
.sum(s37),
.cout(c37)

);

full_adder call38(

.in1({c37, temp4[5], c26}),
.sum(s38),
.cout(c38)

);

////////////////////////////////////////////////////////////



assign out[0] = temp0[0] ;

half_adder call41(

.in1({temp1[0], temp0[1]}),
.sum(out[1]),
.cout(c41)

);

full_adder call42(

.in1({c41, s31, temp2[0]}),
.sum(out[2]) ,
.cout(c42)

);

full_adder call43(

.in1({c42, s32, temp3[0]}),
.sum(out[3]),
.cout(c43)

);

full_adder call44(

.in1({c43, s33, temp4[0]}),
.sum(out[4]),
.cout(c44)

);

full_adder call45(

.in1({c44, s34, temp5[0]}),
.sum(out[5]),
.cout(c45)

);

full_adder call46(

.in1({c45, s35, temp5[1]}),
.sum(out[6]),
.cout(c46)

);


full_adder call47(

.in1({c46, s36, temp5[2]}),
.sum(out[7]),
.cout(c47)

);

full_adder call48(

.in1({c47, s37, temp5[3]}),
.sum(out[8]),
.cout(c48)

);

full_adder call49(

.in1({c48, s38, temp5[4]}),
.sum(out[9]),
.cout(c49)

);

full_adder call410(

.in1({c49 , temp5[5], c38}),
.sum(out[10]),
.cout(out[11])

);


endmodule
