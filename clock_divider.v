`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2022 16:29:32
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(clk,clk_out);

input wire clk;
reg[27:0] counter;
always@(posedge clk)
begin
if (counter == 125000000 - 1)
counter <= 0;
else
counter <= counter + 1;
end

output reg  clk_out;
always@(posedge clk)
begin
if (counter <= 62500000)
clk_out  <= 1;
else
clk_out <= 0;
end




endmodule
