module johnson_ring_counter (reset, clk, reg_out);
     parameter N = 8;

     input reset, clk;
     output reg [N-1:0] reg_out;

     // Feeding back the complement of the least-significant bit
     always @(posedge clk or posedge reset) begin
          if (reset) reg_out <= 0;
          else reg_out <= {~reg_out[0], reg_out[N-1:1]};
     end

endmodule
