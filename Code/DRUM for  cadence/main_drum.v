`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:00:10 06/09/2019 
// Design Name: 
// Module Name:    main_drum 
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




// HERE BOTH THE OPERANDS ARE OF (n = 8) BITS BUT WE WILL CONVERT INTO (k = 4) BITS AND THEN FIND THE APPROXIMATE MULTIPLICATION RESULTS

module main_drum(in1, in2, out);

input [7:0] in1;    // This is the accurate 8- bit input .....(OPERAND -> 1)
input [7:0] in2;    // This is the accurate 8- bit input ......(OPERAND -> 2)
output [15:0] out  ; // This is the approximated multiplicated after it into 4 bits each and then getting the 8-bit multiplication but ultimately we will compare this it with actual multiplication which is supposed to be of 16-bits ....


wire [3:0] approximated_in1 ;  // 4-bit approximated value of the OPERAND-1 ....
wire [3:0] approximated_in2 ;  // 4-bit approximated value of the OPERAND - 2 ...

integer temp ;

wire [7:0] temp1 ;

//assign temp1 = 16'b0000000000000000 ;

////////////////////////////////

// This will select the K bits as per the rule of the DRUM from the given N bits ....


Leading_One_Detector call1 (

.in1(in1) ,
.out(approximated_in1)

);



Leading_One_Detector call2(

.in1(in2) ,
.out(approximated_in2)

);


Four_Bit_Multiplication call3(


.in1(approximated_in1) ,
.in2(approximated_in2) ,
.out(temp1)

);


Barrel_shifter call4(

.in1(temp1) , 
.out(out)


);

// After having this multiplication

//assign out  = temp1 ;

//assign out  = {4'b0000 , temp1, 4'b0000} ;

endmodule
