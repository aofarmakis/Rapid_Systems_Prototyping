module pattern_recognizer_moore (reset, clk, string_in, seen);
     // One-hot style approach for state encoding. It has low power consumption as usually
     // only two bits will ever switch from state to state. They are very good for speed,
     // and particularly good for FPGA-based implementations due to the CLB architectures.
     // However, they use more flip-flops, and thus more space and have more illegal states.
     localparam [3:0] S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0100, S4 = 4'b1000;

     input reset, clk, string_in;
     output seen;

     reg [3:0] state, next;

     // Sequential always block for the state register
     always @(posedge clk or posedge reset) begin
          if (reset) begin
               state <= 4'b0000;
          end
          else begin
               state <= next;
          end
     end

     // Combinational always block, so we'll use
     // blocking statements here
     always @(*) begin
          next = 4'bx;
          seen = 1'b0;
          case (state)
               S0:
               begin
                    if (string_in) next = S1;
                    else next = S0;
               end
               S1:
               begin
                    if (string_in) next = S2;
                    else next = S0;
               end
               S2:
               begin
                    if (!string_in) next = S3;
                    else next = S2;
               end
               S3:
               begin
                    if (string_in) next = S4;
                    else next = S0;
               end
               S4:
               begin
                    seen = 1'b1;
                    if (string_in) next = S1;
                    else next = S0;
               end
               default: next = state;
          endcase
     end

endmodule