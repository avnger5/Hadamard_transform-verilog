`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:58 03/22/2022 
// Design Name: 
// Module Name:    Hadamard4ptsystolic2d 
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
module Hadamard4ptsystolic2d(clk,start,x0,x1,x2,x3,y0,y1,y2,y3);

input signed [8:0] x0,x1,x2,x3;
input clk;
input start;
output signed [8:0] y0,y1,y2,y3;
wire signed [8:0] temp[0:4][0:4];
//wire signed [8:0] px0,py0,px1,py1,py2,px10,py10,px11,py11,py12;

addercell ac11 (clk,start,x0,x1,temp[0][0],temp[0][1]);
addercell ac12 (clk,start,temp[0][0],x2,temp[0][2],temp[0][3]);
addercell ac13 (clk,start,temp[0][2],x3,y0,temp[0][4]);

subcell ac21 (clk,start,x0,temp[0][1],temp[1][0],temp[1][1]);
addercell ac22 (clk,start,temp[1][0],temp[0][3],temp[1][2],temp[1][3]);
subcell ac23 (clk,start,temp[1][2],temp[0][4],y1,temp[1][4]);

addercell ac31 (clk,start,x0,temp[1][1],temp[2][0],temp[2][1]);
subcell ac32 (clk,start,temp[2][0],temp[1][3],temp[2][2],temp[2][3]);
subcell ac33 (clk,start,temp[2][2],temp[1][4],y2,temp[2][4]);

subcell ac41 (clk,start,x0,temp[2][1],temp[3][0],temp[3][1]);
subcell ac42 (clk,start,temp[3][0],temp[2][3],temp[3][2],temp[3][3]);
addercell ac43 (clk,start,temp[3][2],temp[2][4],y3,temp[3][4]);

endmodule

module addercell(clk,start,xin,yin,xout,yout);

input signed [8:0] xin,yin;
input clk;
input start;
output reg signed [8:0] yout,xout;

always@(posedge clk)
begin
	if(start)
		begin
			xout <= $signed(xin) + $signed(yin);
			yout <= $signed(yin);			
		end
end

endmodule

module subcell(clk,start,xin,yin,xout,yout);
input signed [8:0] xin,yin;
input clk;
input start;
output reg signed [8:0] yout,xout;

always@(posedge clk)
begin
	if(start)
		begin
			xout <= $signed(xin) - $signed(yin);
			yout <= $signed(yin);
		end
end

endmodule

