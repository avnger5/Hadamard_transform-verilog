`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:41 03/22/2022 
// Design Name: 
// Module Name:    hadamard_16pt 
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
module hadamard_16pt(clk,start,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15);

input clk;
input start;

input signed [7:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
output signed [9:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15;

wire signed [9:0] a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7;
wire signed [9:0] c0,c1,c2,c3,d0,d1,d2,d3,e0,e1,e2,e3,f0,f1,f2,f3;

addsub16pt as16(clk,start,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7);
addsub8pt as1 (clk,start,a0,a1,a2,a3,a4,a5,a6,a7,c0,c1,c2,c3,d0,d1,d2,d3);
addsub8pt as2 (clk,start,b0,b1,b2,b3,b4,b5,b6,b7,e0,e1,e2,e3,f0,f1,f2,f3);
hadamard4pt ht1 (clk,start,c0,c1,c2,c3,y0,y1,y2,y3);
hadamard4pt ht2 (clk,start,d0,d1,d2,d3,y4,y5,y6,y7);
hadamard4pt ht3 (clk,start,e0,e1,e2,e3,y8,y9,y10,y11);
hadamard4pt ht4 (clk,start,f0,f1,f2,f3,y12,y13,y14,y15);

endmodule

module addsub16pt(clk,start,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7);
input clk;
input start;

input signed [7:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
output reg signed [9:0] a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7;

always@(posedge clk)
begin
	if(start)
		begin
			a0 <= $signed(x0)+$signed(x8);
			a1 <= $signed(x1)+$signed(x9);
			a2 <= $signed(x2)+$signed(x10);
			a3 <= $signed(x3)+$signed(x11);
			a4 <= $signed(x4)+$signed(x12);
			a5 <= $signed(x5)+$signed(x13);
			a6 <= $signed(x6)+$signed(x14);
			a7 <= $signed(x7)+$signed(x15);
			b0 <= $signed(x0)-$signed(x8);
			b1 <= $signed(x1)-$signed(x9);
			b2 <= $signed(x2)-$signed(x10);
			b3 <= $signed(x3)-$signed(x11);
			b4 <= $signed(x4)-$signed(x12);
			b5 <= $signed(x5)-$signed(x13);
			b6 <= $signed(x6)-$signed(x14);
			b7 <= $signed(x7)-$signed(x15);
		end
end

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
