`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  led_clk.v
 * Project:    Lab 8
 * Designers:  Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  3/1/2016
 *
 * Purpose: Clock divider that slows down the Nexys 3 built-in hardware clock
 *				(100 MHz) to a 250 Hz clock.
 *         
 * Notes: Uses an incremental counter following the formula
 *			 ((Incoming Frequency / Outgoing Frequency) / 2)
 *			
 ****************************************************************************/
module led_clk(clk_in, reset, clk_out);

	// IO Declarations
	input 	  clk_in, reset;
	output reg clk_out;
	integer 	  i;
	
	//***************************************************************
	//	The following verilog code will "divide" an incoming clock
	//	by the 32-bit decimal value specified in the "if condition"
	//
	//	The value of the counter that counts the incoming clock ticks
	// is equal to [ (Incoming Freq / Outgoing Freq) / 2 ]
	//***************************************************************

	always @(posedge clk_in or posedge reset) begin
		if (reset == 1'b1) begin
			i = 0;
			clk_out = 0;
		end
		// got a clock, so increment the counter and
		// test to see if half a period has elapsed
		else begin
			i = i + 1;
			if (i >= 200000) begin // set at 200000 for the Nexys 3 100MHz clock
				clk_out = ~clk_out;
				i = 0;
			end // if
		end // else
	end // always

endmodule
