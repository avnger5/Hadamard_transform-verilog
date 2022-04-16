`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:08:38 03/21/2022
// Design Name:   Hadamard4pt_datapath
// Module Name:   C:/Users/hp/Desktop/DSP architecture/Project/TransversePipeline/traverse_test.v
// Project Name:  TransversePipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Hadamard4pt_datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module traverse_test;

	// Inputs
	reg start;
	reg clk;
	reg signed [7:0] x0;
	reg signed [7:0] x1;
	reg signed [7:0] x2;
	reg signed [7:0] x3;

	// Outputs
	wire signed [8:0] y0;
	wire signed [8:0] y1;
	wire signed [8:0] y2;
	wire signed [8:0] y3;

	// Instantiate the Unit Under Test (UUT)
	Hadamard4pt uut (
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
		start = 1'b1;
		x0 = 3;
		x1 = 4;
		x2 = -2;
		x3 = 1;

		#100;
        
		x0 = -1;
		x1 = 6;
		x2 = 2;
		x3 = 4;

		#100;
		
		x0 = 5;
		x1 = -3;
		x2 = 1;
		x3 = 0;

		#100;
		
		x0 = -2;
		x1 = -3;
		x2 = -1;
		x3 = -5;

		#100;
		

	end
	
	always #10 clk = ~clk;
	
	initial 
	begin
		$monitor("time =%d, X0= %d, X1=%d , X2=%d , X3=%d\n Y0= %d, Y1=%d , Y2=%d , Y3=%d",$time,x0,x1,x2,x3,y0,y1,y2,y3);
	end
      
endmodule

