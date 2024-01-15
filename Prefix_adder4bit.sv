`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2024 21:52:27
// Design Name: 
// Module Name: Prefix_adder4bit
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


module Prefix_adder4bit(
input logic[3:0]a,b,input cin,output logic [3:0]sum,output logic Carry
    );
    logic[3:0]g,p;
    logic[3:0] c;
    logic[1:0]gb1,pb1;
    logic[1:0]gb2,pb2;
    
    
    gen_prop GP0(a[0],b[0],g[0],p[0]);
    gen_prop GP1(a[1],b[1],g[1],p[1]);
    gen_prop GP2(a[2],b[2],g[2],p[2]);
    gen_prop GP3(a[3],b[3],g[3],p[3]);
    
    GP_block GPB1_0(g[0],cin,p[0],0,gb1[0],pb1[0]); // C0
    GP_block GPB1_2(g[2],g[1],p[2],p[1],gb1[1],pb1[1]);
    
    GP_block GPB2_1(gb1[1],gb1[0],pb1[1],pb1[0],gb2[0],pb2[0]); //C2
    GP_block GPB2_2(g[1],gb1[0],p[1],pb1[0],gb2[1],pb2[1]); //C1
    
    sum_prefix S1(a[0],b[0],cin,sum[0]);
    sum_prefix S2(a[1],b[1],gb1[0],sum[1]);
    sum_prefix S3(a[2],b[2],gb2[1],sum[2]);
    sum_prefix S4(a[3],b[3],gb2[0],sum[3]);
    
    assign Carry = (a[3] & gb2[0]) | (b[3] & gb2[0]) | (a[3] & b[3]);
    
endmodule
