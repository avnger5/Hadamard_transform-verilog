`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:30:02 03/22/2022
// Design Name:   hadamard_16pt
// Module Name:   C:/Users/hp/Desktop/DSP architecture/Project/hadamard16pt_parta/hadamard_16pt_test.v
// Project Name:  hadamard16pt_parta
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hadamard_16pt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hadamard_16pt_test;

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
	reg signed [7:0] x8;
	reg signed [7:0] x9;
	reg signed [7:0] x10;
	reg signed [7:0] x11;
	reg signed [7:0] x12;
	reg signed [7:0] x13;
	reg signed [7:0] x14;
	reg signed [7:0] x15;

	// Outputs
	wire signed [9:0] y0;
	wire signed [9:0] y1;
	wire signed [9:0] y2;
	wire signed [9:0] y3;
	wire signed [9:0] y4;
	wire signed [9:0] y5;
	wire signed [9:0] y6;
	wire signed [9:0] y7;
	wire signed [9:0] y8;
	wire signed [9:0] y9;
	wire signed [9:0] y10;
	wire signed [9:0] y11;
	wire signed [9:0] y12;
	wire signed [9:0] y13;
	wire signed [9:0] y14;
	wire signed [9:0] y15;

	// Instantiate the Unit Under Test (UUT)
	hadamard_16pt uut (
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
		.x8(x8), 
		.x9(x9), 
		.x10(x10), 
		.x11(x11), 
		.x12(x12), 
		.x13(x13), 
		.x14(x14), 
		.x15(x15), 
		.y0(y0), 
		.y1(y1), 
		.y2(y2), 
		.y3(y3), 
		.y4(y4), 
		.y5(y5), 
		.y6(y6), 
		.y7(y7), 
		.y8(y8), 
		.y9(y9), 
		.y10(y10), 
		.y11(y11), 
		.y12(y12), 
		.y13(y13), 
		.y14(y14), 
		.y15(y15)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 1;
		x0 = 2;
		x1 = -1;
		x2 = 2;
		x3 = -3;
		x4 = 1;
		x5 = -2;
		x6 = 3;
		x7 = 0;
		x8 = 5;
		x9 = 1;
		x10 = -2;
		x11 = -1;
		x12 = 2;
		x13 = 4;
		x14 = 6;
		x15 = -1;


		#100;
		
		x0 = 5;
		x1 = 3;
		x2 = 6;
		x3 = -23;
		x4 = -1;
		x5 = 7;
		x6 = 0;
		x7 = 10;
		x8 = 6;
		x9 = -3;
		x10 = 2;
		x11 = -11;
		x12 = -2;
		x13 = 5;
		x14 = -1;
		x15 = 0;


		#100;
		
		
		x0 = 1;
		x1 = 0;
		x2 = 0;
		x3 = -1;
		x4 = 2;
		x5 = 3;
		x6 = -1;
		x7 = -1;
		x8 = 0;
		x9 = 1;
		x10 = 2;
		x11 = 0;
		x12 = 0;
		x13 = 5;
		x14 = 8;
		x15 = 0;


		#100;
		
		
		x0 = -3;
		x1 = 0;
		x2 = -4;
		x3 = 0;
		x4 = -7;
		x5 = -9;
		x6 = 11;
		x7 = 9;
		x8 = -1;
		x9 = 0;
		x10 = 2;
		x11 = 5;
		x12 = 6;
		x13 = 3;
		x14 = 11;
		x15 = -5;


		#100;
        


	end
	always #10 clk = ~clk;
	
	initial
	begin
	$monitor($time ,"Xin = %d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d \n 		\t Xout= %d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,%d ,",x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15);

	end
      
endmodule

