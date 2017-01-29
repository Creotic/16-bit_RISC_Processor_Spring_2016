`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  hex_to_7seg.v
 * Project:    Lab 8
 * Designer:   Nolan Mey
 * Email:      nolanmey365@yahoo.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  3/1/2016
 *
 * Purpose: This is a seven-segment display (SSD) that displays hex values.
 *				Takes in a 4-bit input and outputs hex values 0-9, A-F.
 *				Default will display a "-". SSD diagram with variables shown here:
 *					 -a
 *				 f| 	|b
 *					 -g
 *				 e|   |c
 *					 -d
 *						 
 * Notes:	The SSD case statement variables are ordered in reverse, meaning
 *				it's concatenated from G to A, not A to G.
 *
 ****************************************************************************/
module hex_to_7seg(hex, A, B, C, D, E, F, G);

	// I/O Declarations
	input [3:0] hex;
	output reg A, B, C, D, E, F, G;

	// always block
	always @(hex) begin
		case (hex)
			4'b0000 : {G, F, E, D, C, B, A} = 7'b1000000; // 0
			4'b0001 : {G, F, E, D, C, B, A} = 7'b1111001; // 1
			4'b0010 : {G, F, E, D, C, B, A} = 7'b0100100; // 2
			4'b0011 : {G, F, E, D, C, B, A} = 7'b0110000; // 3
			4'b0100 : {G, F, E, D, C, B, A} = 7'b0011001; // 4
			4'b0101 : {G, F, E, D, C, B, A} = 7'b0010010; // 5
			4'b0110 : {G, F, E, D, C, B, A} = 7'b0000010; // 6
			4'b0111 : {G, F, E, D, C, B, A} = 7'b1111000; // 7
			4'b1000 : {G, F, E, D, C, B, A} = 7'b0000000; // 8
			4'b1001 : {G, F, E, D, C, B, A} = 7'b0010000; // 9
			4'b1010 : {G, F, E, D, C, B, A} = 7'b0001000; // A
			4'b1011 : {G, F, E, D, C, B, A} = 7'b0000011; // b
			4'b1100 : {G, F, E, D, C, B, A} = 7'b1000110; // C
			4'b1101 : {G, F, E, D, C, B, A} = 7'b0100001; // d
			4'b1110 : {G, F, E, D, C, B, A} = 7'b0000110; // E
			4'b1111 : {G, F, E, D, C, B, A} = 7'b0001110; // F
			default : {G, F, E, D, C, B, A} = 7'b0111111; // -
		endcase; //endcase
	end // always

endmodule
