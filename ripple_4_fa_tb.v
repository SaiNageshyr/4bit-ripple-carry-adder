`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2023 10:44:07 PM
// Design Name: 
// Module Name: ripple_4_fa_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ripple_4_fa_tb();
reg clk,rst,cin;
reg [3:0]a,b;
wire [3:0]s;
wire cout;

pipe_ripple4_fa m1(.clk(clk),.rst(rst),.a(a),.b(b),.cin(cin),.s(s),.cout(cout));

initial begin
clk=0;
rst=1;
a=0;
b=0;
cin=0;
#10 rst=0;
a=3;
b=1;
#40 cin=1;
#500 $finish;
end
always 
#5 clk=~clk;
endmodule
