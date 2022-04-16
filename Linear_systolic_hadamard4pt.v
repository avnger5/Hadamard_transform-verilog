`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:18 03/22/2022 
// Design Name: 
// Module Name:    Linear_systolic_hadamard4pt 
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
module Linear_systolic_hadamard4pt(clk,start,x0,x1,x2,x3,y0);

input clk;
input start;
input signed [8:0] x0,x1,x2,x3;
output reg signed [11:0] y0;

reg signed [9:0] p1;
reg signed [10:0] p2;
reg tag1,tag2,tag3;
reg [1:0] t;

initial
begin
tag2=1'b0;
tag1=1'b1;
end

always@(posedge clk)
begin
	if(start)
	begin
	if(1)
		begin
			tag1 <= ~tag1;
		end
	if(tag1)
		begin
			tag2 <= ~tag2;
		end
	
	tag3 <= tag2^tag1;
	end
	if(start)
		begin
			if(tag1)
				begin
					p1 <= x0 + x1;
				end
			else
				begin
					p1 <= x0 - x1 ;
				end
		end
	else
		begin
			y0 <= 1'b0;
		end
		
	if(start)
		begin
			if(tag2)
				begin
					p2 <= p1 + x2;
				end
			else
				begin
					p2 <= p1 - x2;
				end
		end
	else
		begin
			y0 <= 1'b0;
		end
		
	if(start)
		begin
			if(tag3)
				begin
					y0 <= p2 + x3;
				end
			else
				begin
					y0 <= p2 - x3;
				end
		end
	else
		begin
			y0 <= 1'b0;
		end
	if(!start)
	begin
		tag2<=1'b0;
		tag1<=1'b1;
	end
end

endmodule
