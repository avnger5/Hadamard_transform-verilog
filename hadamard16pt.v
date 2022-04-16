`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:42:45 03/22/2022 
// Design Name: 
// Module Name:    hadamard16pt 
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
module hadamard16pt(clk,start,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15);

input clk;
input start;

input signed [8:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
output signed [8:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15;

wire signed [8:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15;


hadamard4pt in1 (clk,start,x0,x1,x2,x3,p0,p1,p2,p3);
hadamard4pt in2 (clk,start,x4,x5,x6,x7,p4,p5,p6,p7);
hadamard4pt in3 (clk,start,x8,x9,x10,x11,p8,p9,p10,p11);
hadamard4pt in4 (clk,start,x12,x13,x14,x15,p12,p13,p14,p15);

hadamard4pt out1 (clk,start,p0,p4,p8,p12,y0,y4,y8,y12);
hadamard4pt out2 (clk,start,p1,p5,p9,p13,y1,y5,y9,y13);
hadamard4pt out3 (clk,start,p2,p6,p10,p14,y2,y6,y10,y14);
hadamard4pt out4 (clk,start,p3,p7,p11,p15,y3,y7,y11,y15);

endmodule


module hadamard4pt(clk,start,x0,x1,x2,x3,y0,y1,y2,y3);

input clk;
input start;
input signed [8:0] x0,x1,x2,x3;
output signed [8:0] y0,y1,y2,y3;

wire signed [8:0] a0,a1,a2,a3;

addersubtractor1 as1 (clk,start,x0,x1,x2,x3,a0,a1,a2,a3);
addersubtractor2 as2 (clk,start,a0,a1,a2,a3,y0,y1,y2,y3);

endmodule
module addersubtractor1(clk,start,x0,x1,x2,x3,y0,y1,y2,y3);
input clk;
input start;
input signed [8:0] x0,x1,x2,x3;
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

