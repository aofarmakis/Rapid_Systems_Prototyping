module one_hot_divisable_by_six (reset, clk, X_in, Y_in, divisable);
     input reset, clk, X_in, Y_in;
     output divisable;

     reg [5:0] state, next;

     always @(posedge clk or posedge reset) begin
          if (reset) begin
               state <= 6'b000001;
          end
          else begin
               state <= next;
          end
     end

     // Combinational always block, so we'll use
     // blocking statements here
     always @(*) begin
          next = 6'bx;
          case (state)
               6'b010000:
               begin
                    if (X_in & Y_in) next = 6'b000001;
                    else next = state << X_in + Y_in;
               end
               6'b100000:
               begin
                    if (X_in & Y_in) next = 6'b000010;
                    else if (X_in | Y_in) next = 6'b000001;
                    else next = state;
               end
               // Heavy use of default case, because 
               // with it we can take full advantage
               // of the symmetry of our FSM's design
               default: next = state << X_in + Y_in;
          endcase
     end

     assign divisable = ~|state[5:1] & state[0];

endmodule