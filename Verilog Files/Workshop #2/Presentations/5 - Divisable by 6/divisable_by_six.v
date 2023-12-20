module divisable_by_six (reset, clk, X_in, Y_in, divisable);
     input reset, clk, X_in, Y_in;
     output divisable;

     reg [2:0] state, next;

     always @(posedge clk or posedge reset) begin
          if (reset) begin
               state <= 3'b000;
          end
          else begin
               state <= next;
          end
     end

     // Combinational always block, so we'll use
     // blocking statements here
     always @(*) begin
          next = 3'bx;
          case (state)
               3'b100:
               begin
                    if (X_in & Y_in) next = 3'b000;
                    else next = state + X_in + Y_in;
               end
               3'b101:
               begin
                    if (X_in & Y_in) next = 3'b001;
                    else if (X_in | Y_in) next = 3'b000;
                    else next = state;
               end
               // Heavy use of default case, because 
               // with it we can take full advantage
               // of the symmetry of our FSM's design
               default: next = state + X_in + Y_in;
          endcase
     end

     assign divisable = ~|state;

endmodule