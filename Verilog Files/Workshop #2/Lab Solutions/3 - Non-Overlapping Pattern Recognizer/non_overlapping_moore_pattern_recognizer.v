module non_overlapping_moore_pattern_recognizer (reset, clk, shift_in, detection);
     localparam [1:0] IDLE = 2'b00, SEEN0 = 2'b01, SEEN1 = 2'b10, DETECTED = 2'b11;

     input reset, clk, shift_in;
     output detection;

     reg [1:0] state, next;

     always @(posedge clk or posedge reset) begin
          if (reset) begin
               state <= IDLE;
          end
          else begin
               state <= next;
          end
     end

     // States:
     // IDLE: Default state
     // SEEN0: Pattern begins with a 0
     // SEEN1: Pattern begins with a 1
     // DETECTED: One of the two patterns "01" or "10" was detected.

     always @(*) begin
          next = 2'bx;
          case (state)
               IDLE:
               begin
                    if (shift_in) next = SEEN1;
                    else next = SEEN0;
               end
               SEEN0:
               begin
                    if (shift_in) next = DETECTED;
                    else next = SEEN0;
               end
               SEEN1:
               begin
                    if (shift_in) next = SEEN1;
                    else next = DETECTED;
               end
               DETECTED:
               begin
                    next = IDLE;
               end
          endcase  
     end

     assign detection = &state;

endmodule

