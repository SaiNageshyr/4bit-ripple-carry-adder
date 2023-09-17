`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2023 06:50:36 PM
// Design Name: 
// Module Name: pipe_ripple4_fa
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


module pipe_ripple4_fa(
    input clk,rst,cin,
    input [3:0]a,b,
    output  [3:0]s,
    output  cout
    );
    wire [3:0]a_d,a_db,b_d,b_db;
    wire cin_d,cin_db;
    wire cout_d, cout_db;
    wire [3:0]s_d,sb;
    genvar i,k;
    generate
    for(i=0;i<4;i=i+1) begin
        d_ff m1(.clk(clk),.reset(rst),.d(a[i]),.q(a_d[i]),.qb(a_db[i]));  
        d_ff m2(.clk(clk),.reset(rst),.d(b[i]),.q(b_d[i]),.qb(b_db[i]));  
        d_ff m3(.clk(clk),.reset(rst),.d(s_d[i]),.q(s[i]),.qb(sb[i]));       
    end
    endgenerate
    d_ff m4(.clk(clk),.reset(rst),.d(cin),.q(cin_d),.qb(cin_db));
    
    ripple_4_fa m5(.a(a_d),.b(b_d),.cin(cin_d),.s(s_d),.cout(cout_d));
    
    d_ff m6(.clk(clk),.reset(rst),.d(cout_d),.q(cout),.qb(cout_db));

endmodule
