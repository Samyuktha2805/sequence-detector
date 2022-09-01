`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2022 16:27:45
// Design Name: 
// Module Name: sequence_detector
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


module sequence_detector(z, rst, clke, w);
      input rst,clke,w;
      output  reg z;
      parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9;
      reg [3:0] ps, ns;
      
      clock_divider cc1(.clk_out(clke));
      always @(posedge clke)
      if (rst) ps<=s0;
      else     ps<=ns;
      
      always @(w,ps)
      case(ps) 
         s0 :   begin
                z=w ? 0:0;
                ns=w ? s2:s1;
                end
         s1 :  begin
               z=w ? 0:0;
               ns=w ? s2:s3;
               end
         s3 :  begin
               z=w ? 0:0;
               ns=w ? s2:s4;
               end
         s4 :  begin
               z=w ? 0:1;
               ns=w ? s2:s5;
               end
         s5 : begin 
              z=w ? 0:1;
              ns=w ? s2:s5;
              end
         s2 : begin
              z=w ? 0:0;
              ns=w ? s6:s1;
              end
         s6 : begin
              z=w ? 0:0;
              ns=w ? s7:s1;
              end
         s7 : begin 
              z=w ? 1:0;
              ns=w ? s8:s1;
              end
         s8 : begin
              z=w ? 1:0;
              ns=w ? s8:s1;
              end
         default : begin
              z=w ? 0:0;
              ns=w ? s0:s0;
              end


endcase
endmodule
