`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:46 05/27/2019 
// Design Name: 
// Module Name:    booth 
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
module booth(A_in, M, Q_in, Z);

input [3:0] A_in ;
input [3:0] M;
input [4:0] Q_in ;
output [7:0] Z ;

wire [3:0] A_out1;
wire [4:0] Q_out1 ;

wire [3:0] A_out2;
wire [4:0] Q_out2 ;

wire [3:0] A_out3;
wire [4:0] Q_out3 ;

wire [3:0] A_out4;
wire [4:0] Q_out4 ;
//////////////////////

booth_multipliers 4(

.A_in(4'b0000) ,
.M(M) ;
.Q_in({Qin,1'b0}) , /// curly braces dene ka yah matlab ha "CONCATENATION" ............. means till 4 to 1 inputs
							/// hum dene but last wala yah apne aap le lega ie= 0 in first step...
.A_out(A_out1),
.Q_out(Q_out1)
);


//////////////////////////////////

booth_multipliers 3(

.A_in(A_out1) ,
.M(M) ;
.Q_in(Q_out1) , /// curly braces dene ka yah matlab ha "CONCATENATION" ............. means till 4 to 1 inputs
							/// hum dene but last wala yah apne aap le lega ie= 0 in first step...
.A_out(A_out2),
.Q_out(Q_out2)
);

/////////////////////////////////


booth_multipliers 2(

.A_in(A_out2) ,
.M(M) ;
.Q_in(Q_out2) , /// curly braces dene ka yah matlab ha "CONCATENATION" ............. means till 4 to 1 inputs
							/// hum dene but last wala yah apne aap le lega ie= 0 in first step...
.A_out(A_out3),
.Q_out(Q_out3)
);


////////////////////////////////////////////

booth_multipliers 4(

.A_in(A_out3) ,
.M(M) ;
.Q_in(Q_out3) , /// curly braces dene ka yah matlab ha "CONCATENATION" ............. means till 4 to 1 inputs
							/// hum dene but last wala yah apne aap le lega ie= 0 in first step...
.A_out(A_out4),
.Q_out(Q_out4)
);


assign Z = {A_out4, Q_out4[4:1]} ;
endmodule
