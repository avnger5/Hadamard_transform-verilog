`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:46:57 03/23/2022
// Design Name:   Linear_systolic_hadamard4pt
// Module Name:   C:/Users/hp/Desktop/DSP architecture/Project/Linearsystolic/hadamard_linear_test.v
// Project Name:  Linearsystolic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Linear_systolic_hadamard4pt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hadamard_linear_test;

	// Inputs
	reg clk;
	reg start;

	reg signed [8:0] x0;
	reg signed [8:0] x1;
	reg signed [8:0] x2;
	reg signed [8:0] x3;

	// Outputs
	wire signed [11:0] y0;

	// Instantiate the Unit Under Test (UUT)
	Linear_systolic_hadamard4pt uut (
		.clk(clk), 
		.start(start), 
		.x0(x0), 
		.x1(x1), 
		.x2(x2), 
		.x3(x3), 
		.y0(y0)
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
		
		start = 0;
		#20
		x0 = -1;
		x1 = 6;
		x2 = 2;
		x3 = 4;
		

		start = 1;

		#200;
		
		start = 0;
		#20
		x0 = 5;
		x1 = -3;
		x2 = 1;
		x3 = 0;
		
		start = 1;
		
		#200;
		
		start = 0;
		#20
		x0 = -2;
		x1 = -3;
		x2 = -1;
		x3 = -5;
		
		start = 1;

		

	end
	
	always #10 clk = ~clk;
	
	initial
		begin
			$monitor($time," X0 = %d ,X1 = %d ,X2 = %d ,X3 = %d ,  Y = %d  ",x0,x1,x2,x3,y0);
		end
			
endmodule

