`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:24:20 03/22/2022
// Design Name:   Hadamard4ptsystolic2d
// Module Name:   C:/Users/hp/Desktop/DSP architecture/Project/systolic2d/systolic2d_test.v
// Project Name:  systolic2d
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Hadamard4ptsystolic2d
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module systolic2d_test;

	// Inputs
	reg clk;
	reg start;
	reg signed [8:0] x0;
	reg signed [8:0] x1;
	reg signed [8:0] x2;
	reg signed [8:0] x3;

	// Outputs
	wire signed [8:0] y0;
	wire signed [8:0] y1;
	wire signed [8:0] y2;
	wire signed [8:0] y3;

	// Instantiate the Unit Under Test (UUT)
	Hadamard4ptsystolic2d uut (
		.clk(clk), 
		.start(start), 
		.x0(x0), 
		.x1(x1), 
		.x2(x2), 
		.x3(x3), 
		.y0(y0), 
		.y1(y1), 
		.y2(y2), 
		.y3(y3)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 1;
		x0 = 3;
		x1 = 4;
		x2 = -2;
		x3 = 1;

		#200;
		
		x0 = -1;
		x1 = 6;
		x2 = 2;
		x3 = 4;

		#200;

		x0 = 5;
		x1 = -3;
		x2 = 1;
		x3 = 0;

		#200;

		
		x0 = -2;
		x1 = -3;
		x2 = -1;
		x3 = -5;

		#200;
	end
	always #10 clk = ~clk;
      
	initial
	begin
		$monitor($time,"x0 =%d , x1=%d , x2 =%d , x3 =%d ,\n  y0 =%d , y1 = %d , y2 =%d , y3 =%d ",x0,x1,x2,x3,y0,y1,y2,y3);
	end
endmodule

