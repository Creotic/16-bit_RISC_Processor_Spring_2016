`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  integer_datapath.v
 * Project:    Lab 8
 * Designer:   Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.1
 * Rev. Date:  4/5/16
 *
 * Purpose: This program connects a 16-bit register file to the ALU using
 *				structural Verilog and has an external input that controls
 *				the S Address, which affects the output of the ALU.
 *         
 * Notes:	REV UPDATE v1.1 (4/5/16):
 *					Formatted for clearner look.
 *					Added additional comments
 *
 ****************************************************************************/
module integer_datapath(clk, reset, W_en, S_Sel, W_Adr, S_Adr, R_Adr, ALU_OP, DS,
								C, N, Z, Reg_Out, Alu_Out);
	
	// I/O Declarations
	input 		   clk, reset, W_en, S_Sel;
	input  [2:0]   W_Adr, S_Adr, R_Adr;
	input  [3:0]   ALU_OP;
	input  [15:0]  DS;
	
	output			C, N, Z;
	output [15:0]  Reg_Out, Alu_Out;
	
	// Wire declarations
	wire 	 [15:0]  S_Wire, S_out, Reg_Out, Alu_Out;
	
	// Module declarations
	reg_file		  
		reg8x16
			(.clk(clk), .reset(reset), .we(W_en), .W_addr(W_Adr), .R_addr(R_Adr),
			 .S_addr(S_Adr), .W(Alu_Out), .R(Reg_Out), .S(S_Wire));
		
	s_mux
		s_mux1bit
			(.S_Sel(S_Sel), .S_in(S_Wire), .DS(DS), .S_out(S_out));
		
	ALU_16bit
		ALU
			(.R(Reg_Out), .S(S_out), .Alu_Op(ALU_OP), .Y(Alu_Out),
			 .N(N), .Z(Z), .C(C));

endmodule
