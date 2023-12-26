module lfsr_load_and_nor (reset, clk, load, parallel_in, lfsr_reg);
     input reset, clk, load;
     input [5:0] parallel_in;
     output reg [1:6] lfsr_reg;

     wire xor_feedback, nor_feedback, feedback;

     // Type 1 Linear-Feedback Shift Register (LFSR)
     // Characteristic polynomial: P(x) = x^6 + x^5 + 1
     // XOR and NOR feedbacks will never be active at the
     // same time, so you can OR them with no problem
     assign xor_feedback = lfsr_reg[6] ^ lfsr_reg[5];
     assign nor_feedback = ~|lfsr_reg;
     assign feedback = xor_feedback | nor_feedback;

     // [5:0] maps to [1:6] just fine AND in the order it should,
     // so you could omit the vector declaration if you wished to
     always @(posedge clk or posedge reset) begin
          if (reset) lfsr_reg <= 0;
          else if (load) lfsr_reg[6:1] <= parallel_in[5:0];
          else lfsr_reg <= {feedback, lfsr_reg[1:5]};
     end

endmodule
