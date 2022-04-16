`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:05:25 03/21/2022
// Design Name:   hadamard4pt
// Module Name:   C:/Users/hp/Desktop/DSP architecture/Project/forward_pipeline/haramard4pt_test.v
// Project Name:  forward_pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hadamard4pt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module haramard4pt_test;

	// Inputs
	reg clk;
	reg start;
	reg signed [7:0] x0;
	reg signed [7:0] x1;
	reg signed [7:0] x2;
	reg signed [7:0] x3;

	// Outputs
	wire signed [9:0] y0;
	wire signed [9:0] y1;
	wire signed [9:0] y2;
	wire signed [9:0] y3;

	// Instantiate the Unit Under Test (UUT)
	hadamard4pt uut (
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

	initial 
	begin
		$monitor("time =%d, X0= %d, X1=%d , X2=%d , X3=%d\n Y0= %d, Y1=%d , Y2=%d , Y3=%d",$time,x0,x1,x2,x3,y0,y1,y2,y3);
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		start =1;
		x0 = 3;
		x1 = 4;
		x2 = -2;
		x3 = 1;
		
		#100
	
		
		x0 = 5;
		x1 = -3;
		x2 = 1;
		x3 = 0;
		
		#100
		
		x0 = -1;
		x1 = 6;
		x2 = 2;
		x3 = 4;
		

		#100
		
		x0 = -2;
		x1 =-3;
		x2 = -1;
		x3 = -5;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #10 clk = ~clk;
      
endmodule

