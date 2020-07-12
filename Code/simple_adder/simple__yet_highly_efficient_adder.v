`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:39 05/30/2019 
// Design Name: 
// Module Name:    simple__yet_highly_efficient_adder 
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
module simple__yet_highly_efficient_adder(in1 , in2, sel, sum, cin );

input [3:0] in1;
input [3:0] in2 ;
input [2:0] sel ;
input cin ;

output [4:0] sum ;

wire[2:0] carry ;  // This is the carry out of the sub adder circuit ... 
wire[2:0] carry_pred ; // This will be calculated by the generation which will use the previous stage inputs...
wire[1:0] G;       //These are the generations  of the previous step , that is required in the carry oprediction generator
wire [2:0] C;    // these are the carry out by the MUX ...


////////////////////////////////////// cslling the sub adder circuit for sum and carry[0] generation ...

adder ADDER1(

.in1(in1[0]) ,
.in2(in2[0]) ,
.cin(cin) ,
.sum(sum[0]) ,
.carry(carry[0])     // This is the first carry input to the MUX  ...

);


/////////////////////////


generation previous_step_generation_0(     // yaha se hum "previous step" GEneration uthaenge for carry prediction....

.in1(in1[0]) ,
.in2(in2[0]) ,
.G(G[0]) 

);

//////////////////////

carry_prediction two_input_of_mux(

.in1(in1[0]) ,
.in2(in2[0]) ,
.cin(cin) ,     // beacause iska previous step generation nahi hoga means Cin hi G[i] ha iska for carry[i+1]
.carry(carry_pred[0])

);

///////////////////////////////

two_bit_MUX multiplixer1(

.in1(carry[0]) ,      // output carry of the adder ........
.in2(carry_pred[0]) ,  // output carry from the carry predictor ....
.sel(sel[0]) ,
.out(C[0])      // This is the output carry of the multiplixer and input to the next adder ..... 

);

///////////////////////////////////////////////


adder second_bit(

.in1(in1[1]) ,
.in2(in2[1]) ,
.cin(C[0]) ,    // output of the multiplixer bit will be the input ...
.sum(sum[1]) ,
.carry(carry[1])

);


/////////////////////////



carry_prediction second_input_of_mux1(     // now in this step we will use the G[0] beacuse this will be the previous generation output for this current carry..
 
 // the expression is :-    Ci+1(carry_pred) = (Gi+1 | (Pi+1&Gi)) 
 
.in1(in1[1]) ,
.in2(in2[1]) ,
.cin(G[0]) ,
.carry(carry_pred[1])

);


/////////////////////////////////

two_bit_MUX getting_the_second_carry_output(

.in1(carry[1]) ,
.in2(carry_pred[1]) ,
.sel(sel[1]) ,
.out(C[1])

);


////////////////////////////////

adder third_bit_sum_and_carry(

.in1(in1[2]) ,
.in2(in2[2]) ,
.cin(C[1]) ,    //This is the multiplixer output...
.sum(sum[2]) ,
.carry(carry[2])   // This will be the one input to the MUX 3....

);

//////////////////////////////////////

generation calling_it_for_carry_prediction_second_index(

.in1(in1[1]) ,
.in2(in2[1]) ,
.G(G[1])        // This is the previous step generation for the current step carry_pred[2] ...

);

////////////////////////////////

carry_prediction second_input_for_MUX_3(

.in1(in1[2]) ,
.in2(in2[2]) ,
.cin(G[1]) ,
.carry(carry_pred[2])   // now this carry will be the second input for the mux ...........

);



/////////////////////////////////

two_bit_MUX last_carry_output_by_the_mux(

.in1(carry[2]) ,
.in2(carry_pred[2]) ,
.sel(sel[2]) ,
.out(C[2])      // THis will be the final carry input for the adder ...

);
 

///////////////////////////

adder final_bit_generation(

.in1(in1[3]) ,
.in2(in2[3]) ,
.cin(C[2]) ,
.sum(sum[3]),
.carry(sum[4])

);


endmodule

