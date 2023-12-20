module lfsr (reset, clk, lfsr_reg);
     // Initial value to start from
     localparam [1:6] seed = 6'b110101;

     input reset, clk;
     output reg [1:6] lfsr_reg;

     wire xor_feedback;

     // Type 1 Linear-Feedback Shift Register (LFSR)
     // Characteristic polynomial: P(x) = x^6 + x^5 + 1
     // This particular LFSR is of "maximal length", meaning
     // it will go through all (2^N)-1 states (except 0s state)
     assign xor_feedback = lfsr_reg[6] ^ lfsr_reg[5];

     always @(posedge clk or posedge reset) begin
          if (reset) lfsr_reg <= seed;
          else lfsr_reg <= {xor_feedback, lfsr_reg[1:5]};
     end

endmodule
