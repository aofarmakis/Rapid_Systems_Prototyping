module d_ff (reset, clk, d, q);
     input reset, clk, d;
     output reg q;

     always @(posedge clk or negedge reset) begin
          if (!reset) q <= 0;  // Reset D FF on negative edge (this is asynchronous!!!)
          else q <= d;         // It’s asynchronous because it’s in the sensitivity list
     end

endmodule