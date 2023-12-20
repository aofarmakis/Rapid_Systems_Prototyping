module pattern_recognizer_mealy (reset, clk, string_in, seen);
     // Gray-code approach for state encoding. The fewer bits that switch, we have 
     // lower power consumption and less noise due to only one bit switching, while
     // also using the least amount of bits needed for the amount of states we have.
     localparam [1:0] S0 = 2'b00, S1 = 2'b01, S2 = 2'b11, S3 = 2'b10;

     input reset, clk, string_in;
     output seen;

     reg [1:0] state, next;

     // Sequential always block for the state register
     always @(posedge clk or posedge reset) begin
          if (reset) begin
               state <= 2'b00;
          end
          else begin
               state <= next;
          end
     end

     // Combinational always block, so we'll use
     // blocking statements here
     always @(*) begin
          next = 2'bx;
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
                    if (string_in) begin
                         seen = 1'b1;
                         next = S1;
                    end
                    else next = S0;
               end
          endcase
     end

endmodule