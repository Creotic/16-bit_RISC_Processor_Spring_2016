`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  led_controller.v
 * Project:    Lab 8
 * Designers:  Nolan Mey & Paul Ruiz
 * Email:      nolanmey365@yahoo.com
 * Rev. No.:   Version 1.1
 * Rev. Date:  3/14/2016
 *
 * Purpose:	This generates signals for the anodes inputs to be displayed onto
 *				the seven segment displays. It also creates the mux select signals
 *				for muxing the address and data nibbles.
 *         
 * Notes:	This file was generated using a template provided by Professor
 *				Allison. The template was the Mealy FSM Boiler Plate #2.
 *				
 *				UPDATE REV 1.1 (3/14/2016):
 *					Fixed case statement bug that caused signals to be removed
 *
 ****************************************************************************/
module led_controller(clk_in, reset, seg_sel, AN);

	input 			  clk_in, reset;
	output reg [1:0] seg_sel;
	output reg [3:0] AN;
	
	// **********************
	//  state register and
	// next_state variables
	// **********************
	reg [1:0] 		  present_state, next_state;
	
	// *************************************************************************
	// Next State Combinational Logic
	// (next state values can change anytime but will only be "clocked" below)
	// *************************************************************************
	always @(present_state) begin
		case(present_state)
			2'b00 : next_state = 2'b01;
			2'b01 : next_state = 2'b10;
			2'b10 : next_state = 2'b11;
			2'b11 : next_state = 2'b00;
			default : next_state = 2'b00;
		endcase
	end
	
	// *****************************************
	// State Register Logic (Sequential Logic)
	// *****************************************
	always @(posedge clk_in or posedge reset) begin
		if (reset == 1'b1)
			present_state = 2'b00;
		else
			present_state = next_state;
	end
	
	// ******************************************************************
	//	Output Combinational Logic
	//	(output variables can change whenever an input or state changes)
	// ******************************************************************
	always @(present_state) begin
		// Originally set to 00 case statements, causing removed signals
		// Fixed as of 3/14/2016 REV 1.1
		case(present_state)
			2'b00 : {AN, seg_sel} = 6'b1110_00;
			2'b01 : {AN, seg_sel} = 6'b1101_01;
			2'b10 : {AN, seg_sel} = 6'b1011_10;
			2'b11 : {AN, seg_sel} = 6'b0111_11;
			default : {AN, seg_sel} = 6'b0000_00;
		endcase
	end

endmodule
