`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  ALU_16bit.v
 * Project:    Lab 8
 * Designer:   Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  3/29/16
 *
 * Purpose: This is a 16-bit ALU that performs manipulations on 16-bit
 *				integers. There are 4 "Op" inputs that performs up to 16 basic
 *				operations. Only 13 of 16 "Op" inputs are used.
 *
 *				The ALU Status flags represent the Y output being:
 *					N - Negaative
 *					Z - Zero
 *					C - Carry Out
 *         
 * Notes:	This 16-bit ALU template was provided by Professor Allison.
 *
 ****************************************************************************/
module ALU_16bit(R, S, Alu_Op, Y, N, Z, C);

	input			[15:0] R, S;
	input  		[3:0]  Alu_Op;
	output reg	[15:0] Y;
	output reg  		 N, Z, C;
	
	always @( R or S or Alu_Op) begin
		case (Alu_Op)
			4'b0000 : {C,Y} = {1'b0, S};		// pass S
			4'b0001 : {C,Y} = {1'b0, R};		// pass R
			4'b0010 : {C,Y} = S + 1;			// increment S
			4'b0011 : {C,Y} = S - 1;			// decrement S
			4'b0100 : {C,Y} = R + S;			// add
			4'b0101 : {C,Y} = R - S;			// subtract
			4'b0110 : begin						// right shift S (logic)
							C = S[0];
							Y = S >> 1;
						 end
			4'b0111 : begin						// left shift S (logic)
							C = S[15];
							Y = S << 1;
						 end
			4'b1000 : {C,Y} = {1'b0,R & S};	// logic and
			4'b1001 : {C,Y} = {1'b0,R | S};	// logic or
			4'b1010 : {C,Y} = {1'b0,R ^ S};	// logic xor
			4'b1011 : {C,Y} = {1'b0,~S};		// logic not S (1's comp)
			4'b1100 : {C,Y} = 0-S;				// negate S		(2's comp)
			default : {C,Y} = {1'b0,S};		// pass S for default
		endcase
		
		// handle last two status flags
		N = Y[15];
		if (Y == 16'b0)
			Z = 1'b1;
		else
			Z = 1'b0;
		
	end	// end always

endmodule
