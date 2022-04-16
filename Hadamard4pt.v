`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:37 03/21/2022 
// Design Name: 
// Module Name:    Hadamard4pt 
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


module Hadamard4pt(clk,start,x0,x1,x2,x3,y0,y1,y2,y3);

input signed [7:0] x0,x1,x2,x3;
input clk;
input start;
output signed [8:0] y0,y1,y2,y3;
wire signed [8:0] p0,p1,p2,p3;
wire signed [7:0] x00,x01,x02,x03;

//wire signed [4:0] p1,p2,p3,p4;


	adder4 am (x0,x1,x2,x3,p0,p1,clk,start,x00,x01,x02,x03);
	sub4 sm (x00,x01,x02,x03,p2,p3,clk,start);
	asblock as1(p0,p1,y0,y2,clk,start);
	asblock as2(p2,p3,y1,y3,clk,start);

endmodule



module adder4(x0,x1,x2,x3,p0,p1,clk,start,x00,x01,x02,x03);
input clk;
input start;
input signed [7:0] x0,x1,x2,x3;
output reg signed [7:0] x00,x01,x02,x03;
output reg signed [8:0] p0,p1;
always@(posedge clk)
begin
	x00 <= x0;
	x01 <= x1;
	x02 <= x2;
	x03 <= x3;
	if(start)
	begin
		p0 <= $signed(x0) + $signed(x1);
		p1 <= $signed(x2) + $signed(x3);
	end
end
endmodule

module sub4(x0,x1,x2,x3,p0,p1,clk,start);
input clk;
input start;
input signed [7:0] x0,x1,x2,x3;
output reg signed [8:0] p0,p1;
always@(posedge clk)
begin
	if(start)
	begin
		p0 <= $signed(x0) - $signed(x1);
		p1 <= $signed(x2) - $signed(x3);
	end
end
endmodule

module asblock(p0,p1,y0,y1,clk,start);
input clk;
input start;
input signed [8:0] p0,p1;
output reg signed [8:0] y0,y1;
always@(posedge clk)
begin
	if(start)
	begin
		y0 <= $signed(p0) + $signed(p1);
		y1 <= $signed(p0) - $signed(p1);
	end
end
endmodule




