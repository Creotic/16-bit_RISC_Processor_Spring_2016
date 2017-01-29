	`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  reg16.v
 * Project:    Lab 8
 * Designer:   Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  3/16/16 
 *
 * Purpose: This is a behavioral model of a 16-bit register. Both 16-bit
 *				outputs DA and DB are controlled by the output enables oeA and oeB
 *         
 * Notes: This module code is provided by Professor Allison.
 *
 ****************************************************************************/
module reg16(clk, reset, ld, oeA, oeB, Din, DA, DB);

	input clk, reset, ld, oeA, oeB;
	input  [15:0] Din;
	output [15:0] DA, DB;
	reg 	 [15:0] Dout;
	
	// behavioral section for writing to register
	always @(posedge clk or posedge reset)
		if(reset)
			Dout <= 16'b0;
		else
			if (ld)
				Dout <= Din;
			else
				Dout <= Dout;
				
	// conditional continuous assignments for reading the register
	assign DA = oeA ? Dout : 16'hz;
	assign DB = oeB ? Dout : 16'hz;

endmodule
