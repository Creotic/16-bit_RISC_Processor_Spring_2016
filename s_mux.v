`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  s_mux.v
 * Project:    Lab 8
 * Designer:   Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.1
 * Rev. Date:  4/5/16
 *
 * Purpose: This program is a 1-bit structural verilog multiplexer.
 *         
 * Notes:	REV UPDATE(4/5/16):
 *					Added comments to the purpose section
 *
 ****************************************************************************/
module s_mux(S_Sel, S_in, DS, S_out);
	
	// I/O Declarations
	input			  S_Sel;
	input  [15:0] S_in, DS;
	output [15:0] S_out;
	
	// Multiplexer
	// If 1, output DS, else, output S_in
	assign S_out = S_Sel ? DS : S_in;

endmodule
