`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:05 03/22/2022 
// Design Name: 
// Module Name:    Hadamard_8points 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Hadamard_8points(clk,start,x0,x1,x2,x3,x4,x5,x6,x7,y0,y1,y2,y3,y4,y5,y6,y7);

input clk;
input start;

input signed [7:0] x0,x1,x2,x3,x4,x5,x6,x7;
output signed [9:0] y0,y1,y2,y3,y4,y5,y6,y7;

wire signed [9:0] a0,a1,a2,a3,b0,b1,b2,b3;

addsub8pt as1 (clk,start,x0,x1,x2,x3,x4,x5,x6,x7,a0,a1,a2,a3,b0,b1,b2,b3);
hadamard4pt ht1 (clk,start,a0,a1,a2,a3,y0,y1,y2,y3);
hadamard4pt ht2 (clk,start,b0,b1,b2,b3,y4,y5,y6,y7);

endmodule

module addsub8pt(clk,start,x0,x1,x2,x3,x4,x5,x6,x7,a0,a1,a2,a3,b0,b1,b2,b3);
input clk;
input start;
input signed [7:0] x0,x1,x2,x3,x4,x5,x6,x7;
output reg signed [8:0] a0,a1,a2,a3,b0,b1,b2,b3;

always@(posedge clk)
begin
	if(start)
		begin
			a0 <= $signed(x0)+$signed(x4);
			a1 <= $signed(x1)+$signed(x5);
			a2 <= $signed(x2)+$signed(x6);
			a3 <= $signed(x3)+$signed(x7);
			b0 <= $signed(x0)-$signed(x4);
			b1 <= $signed(x1)-$signed(x5);
			b2 <= $signed(x2)-$signed(x6);
			b3 <= $signed(x3)-$signed(x7);
		end
end
endmodule
module hadamard4pt(clk,start,x0,x1,x2,x3,y0,y1,y2,y3);

input clk;
input start;
input signed [7:0] x0,x1,x2,x3;
output signed [9:0] y0,y1,y2,y3;

wire signed [8:0] a0,a1,a2,a3;

addersubtractor1 as1 (clk,start,x0,x1,x2,x3,a0,a1,a2,a3);
addersubtractor2 as2 (clk,start,a0,a1,a2,a3,y0,y1,y2,y3);

endmodule
module addersubtractor1(clk,start,x0,x1,x2,x3,y0,y1,y2,y3);
input clk;
input start;
input signed [7:0] x0,x1,x2,x3;
output reg signed [8:0] y0,y1,y2,y3;

always@(posedge clk)
begin
	if(start)
		begin
			y0 <= $signed(x0)+$signed(x1);
			y1 <= $signed(x2)+$signed(x3);
			y2 <= $signed(x0)-$signed(x1);
			y3 <= $signed(x2)-$signed(x3);
		end
end

endmodule


module addersubtractor2(clk,start,x0,x1,x2,x3,y0,y1,y2,y3);
input clk;
input start;
input signed [8:0] x0,x1,x2,x3;
output reg signed [9:0] y0,y1,y2,y3;

always@(posedge clk)
begin
	if(start)
		begin
			y0 <= $signed(x0)+$signed(x1);
			y1 <= $signed(x2)+$signed(x3);
			y2 <= $signed(x0)-$signed(x1);
			y3 <= $signed(x2)-$signed(x3);
		end
end

endmodule
