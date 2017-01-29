`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  top_level_lab8.v
 * Project:    Lab 8
 * Designer:   Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.3
 * Rev. Date:  5/5/2016
 *
 * Purpose:	This program 
 *         
 * Notes: REV UPDATE v1.1(5/2/2016)
 *				Fixed port mapping errors
 *			 REV UPDATE v1.2(5/4/2016)
 *				Added always block for counter
 *			 REV UPDATE v1.3(5/5/2016)
 *				Added mux selects for display and the memory dump wire
 *
 ****************************************************************************/
module top_level_lab8(clk, reset, step, rp_step, dump_mem, ad_sel,
							 status, A, B, C, D, E, F, G, AN);

	// I/O Declarations
	input 		 clk, reset, step, rp_step, ad_sel, dump_mem;
	
	output 		 A, B, C, D, E, F, G;
	output [3:0] AN;
	output [7:0] status;
	
	// Reg/Wire Declarations
	reg  [15:0] counter;
	
	wire 			step_out, rp_step_out, mw_en;
	wire [15:0] Address, mem_wire, r_wire, D_in, dump_wire, ad_wire, seg; 
	
	// always block
	always @(posedge step_out or posedge reset) begin
		if(reset == 1'b1)
			counter = 16'b0;
		else
			counter = counter + 16'b1;
	end
	
	// Module Declarations
	clk_div
		c_div
			(.clk_in(clk), .reset(reset), .clk_out(clk_out));
	
	debounce
			db1(.clk_in(clk_out), .reset(reset), .D_in(step), .D_out(step_out)),
			db2(.clk_in(clk_out), .reset(reset), .D_in(rp_step), .D_out(rp_step_out));
	
	RISC_Proc
		RP
			(.clk(rp_step_out), .reset(reset), .mw_en(mw_en), .D_in(mem_wire), 
			 .Address(Address), .status(status), .D_out(r_wire));
	
	ram1
		RAM
			(.clk(clk), .we(mw_en), .addr(dump_wire), .din(r_wire), .dout(mem_wire));
	
	display_controller
		disp_ctrl
			(.clk(clk), .reset(reset), .seg(seg),
			 .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .AN(AN));
			 
	// 2 to 1 muxes
	assign dump_wire = dump_mem ? counter : Address;
	assign seg = ad_sel ? dump_wire : mem_wire;

endmodule
