`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  addr_mux.v
 * Project:    Lab 8
 * Designers:  Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 * Rev. No.:   Version 1.1
 * Rev. Date:  4/5/2016
 *
 * Purpose:	The address mux is a 4-1 mux with a 2 bit select input that sends
 *				address and data low and high nibbles
 *         
 * Notes:	REV UPDATE (4/5/2016):
 *					Formatted spacing, renamed ports for clarity. (d0, d1, d2, d3)
 *
 ****************************************************************************/
module addr_mux(seg_sel, d0, d1, d2, d3, Y);

	// I/O Declarations
	input 	  [1:0] seg_sel;
	input 	  [3:0] d0, d1, d2, d3;
	output reg [3:0] Y;
	
	always @(seg_sel, d0, d1, d2, d3) begin
		case (seg_sel)
			2'b00   : Y = d0;
			2'b01   : Y = d1;
			2'b10   : Y = d2;
			2'b11   : Y = d3;
			default : Y = 4'b0;
		endcase // case
	end // always

endmodule
