`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:51:15 03/22/2022
// Design Name:   Hadamard_8points
// Module Name:   C:/Users/hp/Desktop/DSP architecture/Project/Hadamardtransform_8x/ht8pt_test.v
// Project Name:  Hadamardtransform_8x
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Hadamard_8points
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ht8pt_test;

	// Inputs
	reg clk;
	reg start;
	reg signed [7:0] x0;
	reg signed [7:0] x1;
	reg signed [7:0] x2;
	reg signed [7:0] x3;
	reg signed [7:0] x4;
	reg signed [7:0] x5;
	reg signed [7:0] x6;
	reg signed [7:0] x7;

	// Outputs
	wire signed [9:0] y0;
	wire signed [9:0] y1;
	wire signed [9:0] y2;
	wire signed [9:0] y3;
	wire signed [9:0] y4;
	wire signed [9:0] y5;
	wire signed [9:0] y6;
	wire signed [9:0] y7;

	// Instantiate the Unit Under Test (UUT)
	Hadamard_8points uut (
		.clk(clk), 
		.start(start), 
		.x0(x0), 
		.x1(x1), 
		.x2(x2), 
		.x3(x3), 
		.x4(x4), 
		.x5(x5), 
		.x6(x6), 
		.x7(x7), 
		.y0(y0), 
		.y1(y1), 
		.y2(y2), 
		.y3(y3), 
		.y4(y4), 
		.y5(y5), 
		.y6(y6), 
		.y7(y7)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 1;
		x0 = 3;
		x1 = 7;
		x2 = 2;
		x3 = 0;
		x4 = 1;
		x5 = 0;
		x6 = 6;
		x7 = 3;

		#100;
		
		x0 = 2;
		x1 = 4;
		x2 = -1;
		x3 = 7;
		x4 = -2;
		x5 = 9;
		x6 = -7;
		x7 = 5;

		#100;
		
		
		x0 = -1;
		x1 = 0;
		x2 = -2;
		x3 = 0;
		x4 = 0;
		x5 = -2;
		x6 = -1;
		x7 = 4;

		#100;
		
		
		x0 = 2;
		x1 = -2;
		x2 = 1;
		x3 = -1;
		x4 = -3;
		x5 = 0;
		x6 = 1;
		x7 = -1;

		#100;


	end
	
	always #10 clk = ~clk;
	
	initial
	begin
		$monitor($time," X =    %d, %d, %d, %d , %d, %d, %d, %d \n           Y =   %d, %d, %d, %d , %d, %d, %d, %d  ",x0,x1,x2,x3,x4,x5,x6,x7,y0,y1,y2,y3,y4,y5,y6,y7);
	end
      
endmodule

