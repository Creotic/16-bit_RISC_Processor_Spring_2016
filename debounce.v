`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  debounce.v
 * Project:    Lab 8
 * Designers:  Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 *					paul.ruiz@student.csulb.edu
 * Rev. No.:   Version 1.2
 * Rev. Date:  3/1/2016
 *
 * Purpose: The debounce module creates a one-shot pulse from the step button.
 *				When the button is pushed, the value is set to 1 so long as the
 *				button is pushed. 
 *         
 * Notes:	This module uses a template provided by the Xilinx ISE program.
 *
 ****************************************************************************/
module debounce(clk_in, reset, D_in, D_out);

	// I/O Declarations
	input clk_in, reset, D_in;
	output wire D_out;

	// Register of 10 bits
	reg q9, q8, q7, q6, q5, q4, q3, q2, q1, q0;

	always @ (posedge clk_in or posedge reset)
		if (reset == 1'b1)
			// Initialization to 0 when the reset button is pushed.
			{q9, q7, q6, q5, q4, q3, q2, q1, q0} <= 10'b0;
		else begin
			// Shift in the new sample that's on the D_in input
			//	then q0, q1, and so forth up until q9.
			// There will be 10 samples saved in the register
			q9 <= q8; q8 <= q7; q7 <= q6; q6 <= q5; q5 <= q4;
			q4 <= q3; q3 <= q2; q2 <= q1; q1 <= q0; q0 <= D_in;
		end
		
	// Creates the debounced, one-shot pulse.
	// Stablization of input is determined by
	// reading an input long enough for the register
	// to shift in the values of the input to 
	// q0, q1, q2, ..., q9.
	// If all bits are 1 except q9, a one-shot pulse
	// will be released.
	
	// The not (!) is what creates a one-shot.
	//	This happens because after q8 is read as 1
	// q9 is still set to 0, the not (!) sets q9 to 1
	// which assigns D_out to a value of 1
	// This prevents the reading of multiple inputs
	// of the button and creates the one-shot pulse.
	assign D_out = !q9 & q8 & q7 & q6 & q5 &
						 q4 & q3 & q2 & q1 & q0;

endmodule
