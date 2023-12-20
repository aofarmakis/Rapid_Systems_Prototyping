module non_overlapping_mealy_pattern_recognizer (reset, clk, enable, shift_in, detection);
     localparam [1:0] IDLE = 2'b00, SEEN0 = 2'b01, SEEN1 = 2'b10;

     input reset, clk, enable, shift_in;
     output detection;

     reg [1:0] state, next;
     reg seen;

     always @(posedge clk or posedge reset) begin
          if (reset) begin
               state <= IDLE;
          end
          else if (enable) begin
               state <= next;
          end
     end

     // States:
     // IDLE: Default state
     // SEEN0: Pattern begins with a 0
     // SEEN1: Pattern begins with a 1
     always @(*) begin
          next = 2'bx;
          seen = 1'b0;
          case (state)
               IDLE:
               begin
                    if (shift_in) next = SEEN1;
                    else next = SEEN0;
               end
               SEEN0:
               begin
                    if (shift_in) begin
                         next = IDLE;
                         seen = 1'b1;
                    end
                    else next = SEEN0;
               end
               SEEN1:
               begin
                    if (shift_in) next = SEEN1;
                    else begin
                         next = IDLE;
                         seen = 1'b1;
                    end
               end
               default: next = IDLE;
          endcase  
     end

     assign detection = seen;

endmodule