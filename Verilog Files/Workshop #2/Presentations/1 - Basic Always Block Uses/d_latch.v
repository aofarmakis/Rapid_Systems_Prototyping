module d_latch (reset, clk, d, q); 
     input reset, clk, d; 
     output reg q; 
 
     always @(clk) begin 
          if (reset) q <= 0;   // Reset D latch when reset=1, synchronized with the clk! 
          else q <= d;         // Notice that the reset is NOT in the sensitivity list!
     end 
 
endmodule