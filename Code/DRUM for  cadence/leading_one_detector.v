`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:36:32 06/09/2019 
// Design Name: 
// Module Name:    test 
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

// Here i am converting an " 8-bit " operand into " 4-bit "  so Msb of the desired is LOD of the given
 
module Leading_One_Detector(in1, out);

input [7:0] in1 ;
output [3:0] out ;




integer i = 7 ;   // starting the loop from the MSB for finding the LEADING ONE ....

//integer k_bits = 4 ;    // number of approximated bits .... 
//integer index = 3 ;     // as it is a four bit number so [3:0] will be the distribution ... so starting that's why = 3 ...
//integer temp ;
 
//integer j;

// assign count = 0 ;

always @(in1)
begin

	while(in1[i] != 1'b1)   // first leading one from the LSB ...
	begin
		
		i = i - 1 ;

	end // end of while ......
 
end // end of always .........



/*		GENERALISE THIS PROGRAM FOR SOME BITS ......


assign temp = i;     // temp will store the position of the LEADING ONE ....

for(j=0; j<(k_bits - 1); j=j+1)
begin

	assign out[index] = in1[temp] ;
	assign index = index - 1 ;            // as the approximated value will start filling from the MSB side .....
	assign temp = temp - 1  ;                   // now we need the consecutive bits after the LEADING ONE on the LSB side ....

end

assign out[k_bits-1] = 1'b1 ;


 */



assign out[3] = in1[i] ;
assign out[2] = in1[i-1] ;
assign out[1] = in1[i-2] ;
assign out[0] = 1'b1 ;






endmodule
