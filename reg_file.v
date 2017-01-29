`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  reg_file.v
 * Project:    Lab 8
 * Designer:   Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  3/16/2016
 *
 * Purpose: Creates an 8x16 register where a user can write values to
 *				memory and output those values to a bus selected by the user.
 *						 
 * Notes:	
 *
 ****************************************************************************/
module reg_file (clk, reset, we, W_addr, R_addr, S_addr, W, R, S);

	/* Inputs
	clk		Modified clock pulse that dictates the processing speed
	reset		Bit value that triggers a soft reset when the value changes
	we			Bit that enables use of a decoder that takes in W Address
	W_addr	16 bit value that determines which register loads a value
	R_addr	16 bit value that determines which register outputs to bus R
	S_addr	16 bit value that determines which register outputs to bus S
	W			16 bit value that determines vales stored on the registers	*/

	input					clk, reset, we;
	input		[2:0]		W_addr, R_addr, S_addr;
	input		[15:0]	W;
	output	[15:0]	R;
	output	[15:0]	S;
	
	wire		[7:0]	load, enA, enB;

	//					 in      en  Y[8:0]
	dec_3to8	W_dec	(W_addr, we, load),
				R_dec	(R_addr, 1'b1, enA),
				S_dec	(S_addr, 1'b1, enB);

	//					 clk  reset  ld       oea     oeb     in DA DB
	reg16		r0		(clk, reset, load[0], enA[0], enB[0], W, R, S),
				r1		(clk, reset, load[1], enA[1], enB[1], W, R, S),
				r2		(clk, reset, load[2], enA[2], enB[2], W, R, S),
				r3		(clk, reset, load[3], enA[3], enB[3], W, R, S),
				r4		(clk, reset, load[4], enA[4], enB[4], W, R, S),
				r5		(clk, reset, load[5], enA[5], enB[5], W, R, S),
				r6		(clk, reset, load[6], enA[6], enB[6], W, R, S),
				r7		(clk, reset, load[7], enA[7], enB[7], W, R, S);

endmodule
