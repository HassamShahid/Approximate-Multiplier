`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:22 05/28/2019 
// Design Name: 
// Module Name:    four_bit_CLA 
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
module four_bit_CLA(A, B, P, G, C0);

input [3:0] A;
input [3:0] B;
input C0;
  
output [4:0] P ;
output [3:0] G ;
 
reg [3:0] C1;


////////////////////////////////////// This is the first step when a[0] and b[0] will produce the GENERATION and PROPAGATION

one_bit_lookahead_carry_adder cla1(

.A(A[0]) , // "This A[0] of four bit LCA is the A of one bit LCA is the output sum of carry maskable one bit adder.."
.B(B[0]) ,
.C0(C0) ,
.P(P[0]) , /// this is equal to (G0 ^ P0) ;
.G(G[0]) ,  /// this is the currently generated carry and this is equal to (CO & P0 | G0) .... ( G0 = A[0] & B[0] ) 
.C1(C1[0])

);

///////////////////////////////////////// This is for the second step...


one_bit_lookahead_carry_adder cla2(

.A(A[1]) ,
.B(B[1]) ,
.C0(C1[0]) ,
.P(P[1]) ,
.G(G[1]), /// this is equal to (G0 ^ P0) ;
.C1(C1[1])  /// this is the currently generated carry and this is equal to (CO & P0 | G0) .... ( G0 = A[0] & B[0] ) 

);

////////////////////////////////// This is for third step...............


one_bit_lookahead_carry_adder cla3(

.A(A[2]) ,
.B(B[2]) ,
.C0(C1[1]) ,
.P(P[2]) ,
.G(G[2]) ,
.C1(C1[2])  /// this is the currently generated carry and this is equal to (CO & P0 | G0) .... ( G0 = A[0] & B[0] ) 

);

/////////////////////////////// This is for the Fourth and final step..............


one_bit_lookahead_carry_adder cla4(

.A(A[3]) ,
.B(B[3]) ,
.C0(C1[2]) ,
.P(P[3]) , /// this is equal to (G0 ^ P0) ;
.G(G[3]),
.C1(C1[3])  /// this is the currently generated carry and this is equal to (CO & P0 | G0) .... ( G0 = A[0] & B[0] ) 

);


endmodule
