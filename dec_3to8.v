`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  dec_3to8.v
 * Project:    Lab 8
 * Designer:   Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  3/16/16
 *
 * Purpose: Uses a 4-bit input to select a single bit which would enable
 *				a load or output enable function on its respective registers.
 *         
 * Notes:
 *
 ****************************************************************************/
module dec_3to8(in, en, Y);

	/* Inputs
	in		4-bit input that outputs a value to the selected bit in binary
	en		Enable bit that is required to output a value to selected bit
	*/

	input					en;
	input			[2:0]	in;
	output reg	[7:0]	Y;
	
	/* Logic
	Given a 3-bit binary value, the decoder will output a 1 to the
	bit determined by it as long as value en is set to 1. Otherwise,
	the decoder will output 0 to all bits.*/
	
	always @ (*) begin
		case ({in, en})
			4'b000_1 : Y = 8'b0000_0001;
			4'b001_1 : Y = 8'b0000_0010;
			4'b010_1 : Y = 8'b0000_0100;
			4'b011_1 : Y = 8'b0000_1000;
			4'b100_1 : Y = 8'b0001_0000;
			4'b101_1 : Y = 8'b0010_0000;
			4'b110_1 : Y = 8'b0100_0000;
			4'b111_1 : Y = 8'b1000_0000;
			default  : Y = 8'b0000_0000;
		endcase
	end	
endmodule

