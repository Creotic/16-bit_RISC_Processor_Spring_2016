`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  ram1.v
 * Project:    Lab 8
 * Designer:   Nolan Mey
 * Email:      nolanmey365@yahoo.com
 * Rev. No.:   Version 1.2
 * Rev. Date:  5/2/2016
 *
 * Purpose:	This stores 256 16-bit values.
 *         
 * Notes: This was copied from the Verilog Instantiation Template file created
 *			 in Coregen with the COE file provided by Professor Allison.
 *
 *			 REV UPDATE v1.2 (5/2/2016)
 *			 	Changed the Coregen file with the lab 8 files provided by
 *			 	Professor Allison.
 *
 ****************************************************************************/
module ram1(
    input clk,
    input we,
    input [7:0] addr,
    input [15:0] din,
    output [15:0] dout
    );

	//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
	ram_256x16 dut (
	  .clka(clk), // input clka
	  .wea(we), // input [0 : 0] wea
	  .addra(addr), // input [7 : 0] addra
	  .dina(din), // input [15 : 0] dina
	  .douta(dout) // output [15 : 0] douta
	);
	// INST_TAG_END ------ End INSTANTIATION Template ---------

endmodule
