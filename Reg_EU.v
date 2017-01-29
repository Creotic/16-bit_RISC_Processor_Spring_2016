`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  Reg_EU.v
 * Project:    Lab 8
 * Designer:   Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.1
 * Rev. Date:  4/19/16
 *
 * Purpose: This is a generic 16 bit register where D is loaded into Q
 *				or Q is incremented by 1 bit.
 *         
 * Notes:	REV UPDATE v1.1 (4/19/2016)
 *					Fixed sizing issue on port D, originally was 1-bit, now
 *					corrected to 16 bits.
 *
 ****************************************************************************/
module Reg_EU(clk, reset, ld, inc, D, Q);
	
	// I/O Declarations
	input  	  			clk, reset, ld, inc;
	input		  [15:0] D;
	
	output reg [15:0] Q;

	always @(posedge clk, posedge reset)
		if(reset)
			Q <= 16'b0;
		else
			case ({ld, inc})
				2'b01 : Q <= Q + 16'b1;
				2'b10 : Q <= D;
				default: Q <= Q;
			endcase

endmodule
