`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:06:00 05/27/2019 
// Design Name: 
// Module Name:    booth_multiplier 
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
module booth_multipliers(A_in, Q_in, Q_out, A_out, M);  // (-7*6) = -42  then (-M = 0111) and (M = 1000+1 = 1001) 

input [3:0] A_in ; // A_in = 0000 .....This is accumulator
input [3:0] M;  // here (-M = 0111) ....This is multiplicand  and this is also a INPUT SO that's why of M
input [4:0] Q_in ; // Q_in[4:1] = 0110 and Q_in[0] = 0 ......This is Quotient ie; "Multiplier" .....
output [3:0] A_out; 
output [4:0] Q_out ;

reg [3:0] A_out ; // yah solve karne ke lia ha.... baad ma inhe A_out ke equal kar dunga...
reg [4:0] Q_out ; // "    "       "   "  "  "         "  '   "

wire [3:0] A_sum = ( A_in + M ) ;  //  this is for the case when Q_in[1] = 1 and Q_in[0] = 0 , 2's complement of M is used here....
wire [3:0] A_sub = ( A_in + ~M + 1 ) ;  // this is for the case when Q_in[1] = 0 and Q_in[0] = 1,, jaha simply sum use hoga means real value of M should be used ...


always@( A_in,  Q_in, M, A_sum, A_sub)
	
	case(Q_in[1:0])
	
	// simple arithematic right shift will be done
	
	2'b00,2'b11:begin
					
						A_out = {A_in[3], A_in[3:1]};  // This statement simply used for arithematic right shift that 3rd index
																	// in this accumulator will stay in its position and rest will be shifted..
						
						Q_out = {A_in[0], Q_in[3:1]}; // This statement is very useful because this shows that the quotient part 3rd index will contain Ain ka 0th index and Qin ka 0th index is got ignored... 
					end
	// A = A-M in Q_in[1] = 1 and Q_in[0] = 0 so (-M = 0111) entered value			
	
	2'b10 :     begin // Condition of substraction means  2's complement of M will be used here ( A_in = A_in - M ) ........
					
					A_out = {A_sum[3] , A_sum[3:1]}; // A_sum islia naam rakha bcuz simple M ki entered valule se sum karna ha.... 
					Q_out = {A_sum[0], Q_in[4:1]};
					end
	
	// A = A+M here Q_in[1] = 0 and Q_in[0] = 1 means 2's complement of M will be used in this...
	
	2'b01 :     begin // Condition when addition occurs ie; Qin[1] = 0 and Q_in[0] = 1 and addition will occur...
					
					A_out  = {A_sub[3] , A_sub[3:1]};  // A_sub is holding real signed entered value of M ....
					Q_out = {A_sub[0], Q_in[3:1]};
					end
					
				endcase

endmodule
