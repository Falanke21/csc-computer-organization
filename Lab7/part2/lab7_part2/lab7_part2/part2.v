// Part 2 skeleton

module part2
	(
		CLOCK_50,						//	On Board 50 MHz
		// Your inputs and outputs here
        KEY,
        SW,
		// The ports below are for the VGA output.  Do not change.
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B   						//	VGA Blue[9:0]
	);

	input			CLOCK_50;				//	50 MHz
	input   [9:0]   SW;
	input   [3:0]   KEY;

	// Declare your inputs and outputs here
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]

	wire resetn;
	assign resetn = KEY[0];

	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn;

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "black.mif";

	// Put your code here. Your code should produce signals x,y,colour and writeEn/plot
	// for the VGA controller, in addition to any other functionality your design may require.

    // Instansiate datapath
	// datapath d0(...);

    // Instansiate FSM control
    // control c0(...);

endmodule

module fsm (clock, resetn, go, x_enable, ld_x, ld_y, ld_color, writeEn);
	input clk, resetn, go, x_enable;
	output reg ld_x, ld_y, ld_color, writeEn;

	reg [1:0] current_state, next_state;

	localparam  S_LOAD        = 2'd0,
							S_LOAD_WAIT   = 2'd1,
							S_LOAD_Y			= 2'd2,
							S_PLOT        = 2'd3;

	always @ ( * ) begin
		case (current_state)
			S_LOAD_X: next_state = x_enable ? S_LOAD_X_WAIT : S_LOAD_X;
			S_LOAD_X_WAIT: next_state = x_enable ? S_LOAD_X_WAIT : S_LOAD_Y;
			S_LOAD_Y: next_state = go ? S_PLOT : S_LOAD_Y;
			S_PLOT: next_state = go ? S_PLOT : S_LOAD_X;
			default: next_state = S_LOAD_X;
		endcase
	end

	always @ ( * ) begin
		ld_x = 0;
		ld_color = 0;
	 	ld_y = 0;
		writeEn = 0;

		case (current_state)
			S_LOAD_X: begin
				ld_x = 1'b1;
			end
			S_LOAD_Y: begin
				ld_y = 1'b1;
				ld_color = 1'b1;
			end
			S_PLOT: begin
				writeEn: 1'b1;
			end

		endcase
	end

	// current_state registers
	always@(posedge clock)
	begin:
			if(!resetn)
					current_state <= S_LOAD_X;
			else
					current_state <= next_state;
	end // state_FFS

endmodule // fsm

module datapath (clock, data_in, ld_x, ld_y, ld_color, color_in, resetn,
								x_out, y_out, color_out);
	input clock, ld_x, resetn, ld_x, ld_y, ld_color;
	input [6:0] data_in;
	input [2:0] color_in;
	output reg [7:0] x_out;
	output reg [6:0] y_out;
	output reg [2:0] color_out;

	always @ ( posedge clock) begin
		if (!resetn) begin
			x_out <= 8'd0;
			y_out <= 7'd0;
			color_out <= 3'd0;
		end
		else begin
			if (ld_x)
				x_out <= {0, data_in};
			if (ld_y)
				y_out <= data_in;
			if (ld_color)
				color_out <= color_in;
		end
	end

	//TODO ADD COUNTER 

endmodule // datapath
