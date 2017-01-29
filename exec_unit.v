`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  exec_unit.v
 * Project:    Lab 8
 * Designers:  Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.2
 * Rev. Date:  5/3/2016
 *
 * Purpose: Connects the Integer Datapath with two 16-bit registers that
 *				creates a CPU execution unit. A muxes are used to select whether
 *				to select the register or program counter, sign extension,
 *				and selecting between the data in the register or the program counter
 *         
 * Notes:	REV UPDATE v1.1 (4/19/2016)
 *					Fixed port wiring issues, removed redundant ports.
 *					Revised naming conventions to clear up confusion.
 *					reg_W_en changed to W_en for clarification on the integer datapah.
 *
 *				REV_UPDATE v1.2 (5/3/2016)
 *					Updated description and changed wires to fit specifications.
 *
 ****************************************************************************/
module exec_unit(clk, reset, adr_sel, s_sel, pc_sel, pc_ld, pc_inc, W_en, ir_ld,
					  W_Adr, R_Adr, S_Adr, ALU_OP, DS, C, N, Z, Address, D_out, IR);
	
	// I/O Declarations
	input 		   clk, reset, adr_sel, s_sel, pc_sel, pc_ld, pc_inc, W_en, ir_ld;
	input  [2:0]	W_Adr, R_Adr, S_Adr;
	input  [3:0]	ALU_OP;
	input  [15:0]  DS;
	
	output			C, N, Z;
	output [15:0]  Address, D_out, IR;
	
	// Wire declarations
	wire 	 [15:0]  IR, Address, D_out, Reg_out, PC_out, sign_ext, PC_add, PC_in;
	
	// Module declarations
	integer_datapath
		ID (.clk(clk), .reset(reset), .W_en(W_en), .S_Sel(s_sel), .W_Adr(W_Adr),
			 .S_Adr(S_Adr), .R_Adr(R_Adr), .ALU_OP(ALU_OP), .DS(DS),
			 .C(C), .N(N), .Z(Z), .Reg_Out(Reg_out), .Alu_Out(D_out));
	
	Reg_EU
		PC (.clk(clk), .reset(reset), .ld(pc_ld), .inc(pc_inc), .D(PC_in), .Q(PC_out)),
		IR_EU (.clk(clk), .reset(reset), .ld(ir_ld), .inc(1'b0), .D(DS), .Q(IR));
		
	// 2-1 mux
	assign Address = adr_sel ? Reg_out : PC_out;
	
	// sign extension
	assign sign_ext = {{8{IR[7]}}, IR[7:0]};
	
	// increment program counter
	assign PC_add = PC_out + sign_ext;
	
	// 2-1 mux select
	assign PC_in = pc_sel ? D_out : PC_add;
	
endmodule
