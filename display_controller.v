`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  display_controller.v
 * Project:    Lab 8
 * Designers:  Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 * Rev. No.:   Version 1.1
 * Rev. Date:  4/5/2016
 *
 * Purpose:	This program displays a 16-bit output to the 4 7-Segment Displays
 *				(SSD).
 *         
 * Notes:	REV UPDATE (4/5/2016):
 *					Added additional comments.
 *					Revamped formatting and converted ports to dot notation style.
 *
 ****************************************************************************/
module display_controller(clk, reset, seg, A, B, C, D, E, F, G, AN);
	
	// I/O Declarations
	input			  clk, reset;
	input  [15:0] seg;
	output		  A, B, C, D, E, F, G;
	output [3:0]  AN;
	
	wire			  clk_out;
	wire	 [1:0]  seg_sel;
	wire	 [3:0]  hex;
	
	// Module Declarations
	led_clk
		l_clk
			(.clk_in(clk), .reset(reset), .clk_out(clk_out));
			
	led_controller
		l_ctlr
			(.clk_in(clk_out), .reset(reset), .seg_sel(seg_sel), .AN(AN));
			
	addr_mux
		mux
			(.seg_sel(seg_sel), .d0(seg[3:0]),   .d1(seg[7:4]),
			 .d2(seg[11:8]),    .d3(seg[15:12]), .Y(hex));
			 
	hex_to_7seg
		SSD
			(.hex(hex), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G));
	
endmodule
