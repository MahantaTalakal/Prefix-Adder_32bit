`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2024 22:47:42
// Design Name: 
// Module Name: Prefix_adder4bit_tb
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


module Prefix_adder4bit_tb();
logic[3:0]a,b,sum;
logic cin,carry;

Prefix_adder4bit dut(a,b,cin,sum,carry);

initial begin
a=4'b1010;
b=4'b1100;
cin=0;

#10 a=4'b0011;
b=4'b1100;
cin=1;

#10 a=4'b0000;
b=4'b1111;
cin=1;

#100;
$finish;
end
endmodule
