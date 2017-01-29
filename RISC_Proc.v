`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  RISC_Proc.v
 * Project:    Lab 8
 * Designers:  Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.2
 * Rev. Date:  5/5/2016
 *
 * Purpose:	This program wires the control unit and execution unit together
 *				to make the RISC processor.
 *         
 * Notes: REV UPDATE v1.2 (5/5/2016):
 *				Fixed wiring errors
 *				Fixed bit sizes of W_Adr, R_Adr, and S_Adr
 *
 ****************************************************************************/
module RISC_Proc(clk, reset, mw_en, D_in, Address, status, D_out);

	// I/O Declarations
	input 		  clk, reset;
	input  [15:0] D_in;
	
	output		  mw_en;
	output [7:0]  status;
	output [15:0] Address, D_out;
	
	// Wire Declarations
	wire		   rw_en, adr_sel, s_sel, pc_sel, pc_ld, pc_inc, ir_ld;
	wire			N, Z, C;
	wire [2:0]  W_Adr, R_Adr, S_Adr;
	wire [3:0]	Alu_Op;
	wire [15:0] IR;

	// Module Declarations
	exec_unit
		EU
			(.clk(clk), .reset(reset), .adr_sel(adr_sel), .s_sel(s_sel), .pc_sel(pc_sel),
			 .pc_ld(pc_ld), .pc_inc(pc_inc), .W_en(rw_en), .ir_ld(ir_ld),
			 .W_Adr(W_Adr), .R_Adr(R_Adr), .S_Adr(S_Adr), .ALU_OP(Alu_Op),
			 .DS(D_in), .C(C), .N(N), .Z(Z), .Address(Address), .D_out(D_out), .IR(IR));
					  
	control_unit
		CU
			(.clk(clk), .reset(reset), .IR(IR), .N(N), .Z(Z), .C(C),
			 .W_Adr(W_Adr), .R_Adr(R_Adr), .S_Adr(S_Adr),
			 .adr_sel(adr_sel), .s_sel(s_sel),
			 .pc_ld(pc_ld), .pc_inc(pc_inc), .pc_sel(pc_sel), .ir_ld(ir_ld),
			 .mw_en(mw_en), .rw_en(rw_en), .alu_op(Alu_Op),
			 .status(status));

endmodule
