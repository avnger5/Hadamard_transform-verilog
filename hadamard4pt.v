`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:01 03/21/2022 
// Design Name: 
// Module Name:    hadamard4pt 
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