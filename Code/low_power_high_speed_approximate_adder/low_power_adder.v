`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:32 05/29/2019 
// Design Name: 
// Module Name:    low_power_adder 
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
module low_power_adder(in1, in2, mask, out);

input [3:0] in1;
input [3:0] in2 ;
input mask ;
output [3:0] out ;  // This will be calculated by the XOr of the Propagators of the carry maskable adders "[3:0] P" and the carries of the second stage CLA [3:0] C11


wire [3:0] G  ; // output of the sum of the one bit carry maskable adders....... and input to one bit CLA....
wire [3:0] P ;  // output of the carry of the one bit carry maskable adders ... and input to one bit CLA....
wire [3:0] P1 ; // these will be outputs of the "propagation" of the one bit CLA  "STAGE 1"  ...............
wire [3:0] G1 ; // these will be the outputs of the "generation" of the one bit CLA ........
wire [3:0] C1 ; // these will be the current step carry output calculated as (C1 = G1 | (P1&C0)) and will be input to next in stage CLA ....
wire [3:0] C11 ;  // this will be the carry generated by the stage 2 CLA .......
 

///////////// calling the one_bit_maskable_adder for the first generation and propagation...

one calling_one_bit_maskable_FIRST_TIME(

.A(in1[0]) ,
.B(in2[0]) ,
.mask(mask) ,
.sum(P[0]) ,  // This generation is the output of the carry maskable adder but the input for the carry lookahead adder
.carry(G[0])  // that's why we use WIRE datatype for them........

);

///////////////// caling the one bit makable adder again


one calling_one_bit_maskable_SECOND_TIME(

.A(in1[1]) ,
.B(in2[1]) ,
.mask(mask) ,
.sum(P[1]) ,
.carry(G[1])

);

//////////////////////////// calling the one bit maskable adder again.......



one calling_one_bit_maskable_THIRD_TIME(

.A(in1[2]) ,
.B(in2[2]) ,
.mask(mask) ,
.sum(P[2]) ,
.carry(G[2])

);


/////////////////////////////  in this carry maskable adder no masking will happen means accurate results will be taken.


one calling_one_bit_maskable_FOURTH_TIME(

.A(in1[3]) ,
.B(in2[3]) ,
.mask(1'b1) ,  // as per architecture no masking will happen for this step in this step 4.........
.sum(P[3]) ,
.carry(G[3])

);


/////////////////////////////////////// till now , we get all the propagation and generation from the carry maskable adder
//////////// which will work as input for the carry lookahead adder ........


///////////////////////////////////CALLING ONE_BIT_CARRY_LOOKAHEAD_ADDER 1.........



one_bit_lookahead_carry_adder calling_one_bit_cla_FIRST_STAGE_FIRST_TIME(

.A(P[0]) ,  // THIS IS THE SEQUENTIAL STEP THAT THE OUTPUT OF THE ONE BIT MASKABLE IS THE INPUT OF THIS ....
.B(G[0]) ,
.C0(1'b0) ,  // as per the architecture it has to be taken as zero ....

.P(P1[0]) ,   //  these propagation of the CLA is the again input of the one bit CLA .......
.G(G1[0]) ,
.C1(C1[0])   // THIS IS THE OUTPUT "CARRY" COME BY CALCULATION OF cla STAGE 1, cla no. 1 ,  WILL BE SEND TO THE clA STAGE 2... 

);

one_bit_lookahead_carry_calculator CALLING_ONLY_FOR_CARRY_CALCULATION_ONLY_cla_SECOND_STAGE_FIRST_TIME(   

.A(P1[0]) ,  // THIS IS THE SEQUENTIAL STEP THAT THE OUTPUT OF THE ONE BIT MASKABLE IS THE INPUT OF THIS ....
.B(G1[0]) ,
.C0(C1[0]) ,  // YAH STAGE 1 CLA KE "PAHLA" CLA KA CARRY OUT HA JO STAGE 2 KE CLA KE PASS JAA RHA HA FOR CARRY CALCULATION

.C(C11[0])   // OUTPUT WILL BE "CARRY" ONLY AND THIS WILL BE SEND TO THE clA STAGE 1 , CLA2... 

);

//////////////////////////


///////////////////////////////////// calling one bit carry lookahead adder 2 time,...


one_bit_lookahead_carry_adder calling_one_bit_cla_FIRST_STAGE_SECOND_TIME(  // cla 12 means calling first stage second time...

.A(P[1]) ,  // THIS IS THE SEQUENTIAL STEP THAT THE OUTPUT OF THE ONE BIT MASKABLE IS THE INPUT OF THIS ....
.B(G[1]) ,
.C0(C11[0]) ,  // as per the architecture it has to be taken as zero ....
.P(P1[1]) ,
.G(G1[1]) ,
.C1(C1[1]) 

);


/////////////////////////////////////////

one_bit_lookahead_carry_calculator Calling_only_for_carry_calculation_cla_SECOND_STAGE_SECOND_TIME(

.A(P1[1]) ,  
.B(G1[1]) ,
.C0(C1[1]) , 

.C(C11[1]) 

);
 
///////////////////////// 

one_bit_lookahead_carry_adder calling_one_bit_cla_FIRST_STAGE_THIRD_TIME(

.A(P[2]) ,  // THIS IS THE SEQUENTIAL STEP THAT THE OUTPUT OF THE ONE BIT MASKABLE IS THE INPUT OF THIS ....
.B(G[2]) ,
.C0(C11[1]) ,  // as per the architecture it has to be taken as zero ....
.P(P1[2]) ,
.G(G1[2]) ,
.C1(C1[2]) 

);


////////////////////////////////////////////


one_bit_lookahead_carry_calculator CALLING_ONLY_FOR_CARRY_CALCULATION_ONLY_cla_SECOND_STAGE_THIRD_TIME(

.A(P1[2]) ,  // THIS IS THE SEQUENTIAL STEP THAT THE OUTPUT OF THE ONE BIT MASKABLE IS THE INPUT OF THIS ....
.B(G1[2]) ,
.C0(C1[2]) ,  // YAH STAGE 1 CLA KE "PAHLA" CLA KA CARRY OUT HA JO STAGE 2 KE CLA KE PASS JAA RHA HA FOR CARRY CALCULATION

.C(C11[2])   // OUTPUT WILL BE "CARRY" ONLY AND THIS WILL BE SEND TO THE clA STAGE 1 , CLA2... 

);


one_bit_lookahead_carry_adder calling_one_bit_cla_first_stage_FOURTHth_time(  

.A(P[3]) ,  // THIS IS THE SEQUENTIAL STEP THAT THE OUTPUT OF THE ONE BIT MASKABLE IS THE INPUT OF THIS ....
.B(G[3]) ,
.C0(C11[2]) ,  // as per the architecture it has to be taken as zero ....
.P(P1[3]) ,
.G(G1[3]) ,
.C1(C1[3])  

);


one_bit_lookahead_carry_calculator CALLING_ONLY_FOR_CARRY_CALCULATION_ONLY_cla_SECOndstagE_FOURTH_time(  

.A(P1[0]) ,  // THIS IS THE SEQUENTIAL STEP THAT THE OUTPUT OF THE ONE BIT MASKABLE IS THE INPUT OF THIS ....
.B(G1[0]) ,
.C0(C1[3]) ,  // YAH STAGE 1 CLA KE "PAHLA" CLA KA CARRY OUT HA JO STAGE 2 KE CLA KE PASS JAA RHA HA FOR CARRY CALCULATION

.C(C11[3])   // OUTPUT WILL BE "CARRY" ONLY AND THIS WILL BE SEND TO THE clA STAGE 1 , CLA2... 

);



//////////////////////////// Main output first output bit...........

one_bit_xor_gate first_output_bit_LSB(

.A(P[0]) ,
.B(C11[0]) ,
.out(out[0])

);

////////////////////////////////////////

one_bit_xor_gate first_output_bit_2nd_bit(

.A(P[1]) ,
.B(C11[1]) ,
.out(out[1])

);

///////////////////////////

one_bit_xor_gate first_output_bit_3rd_bit(

.A(P[2]) ,
.B(C11[2]) ,
.out(out[2])

);


///////////////////////

one_bit_xor_gate first_output_bit_MSB(

.A(P[3]) ,
.B(C11[3]) ,
.out(out[3])

);


endmodule
