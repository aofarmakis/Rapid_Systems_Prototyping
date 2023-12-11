module ALU (A, B, opcode, ALU_Result, flags);
     parameter N = 8;

     input [N-1:0] A, B;
     input [2:0] opcode;
     output [1:0] flags;
     output [N-1:0] ALU_Result;

     wire carry, zero;

     // --------------------------------------------------- //
     // Instructions list for ALU:
     // --------------------------
     // Opcode 0: Addition
     // Opcode 1: Subtraction
     // Opcode 2: Logical AND
     // Opcode 3: Logical NOR
     // Opcode 4: Logical XOR
     // Opcode 5: Circular shift right of A by B positions
     // Opcode 6: Number of 1's within both A and B
     // Opcode 7: Absolute value of B
     // --------------------------------------------------- //

     // This is purely for function practice.
     // In reality, you'd use the built-in "$countones(__)"
     // function 11 out of 10 times you wanted to do this.
     function [N-1:0] ONES;
          input [N-1:0] x;
          reg [$clog2(N)-1:0] count;
          integer i;
          begin
               count = 0;
               for (i=0; i < N; i=i+1 )
                    count = count + x[i];
               ONES = count;
          end
     endfunction

     // Clear definition of absolute value. You can do
     // tenary operations within tenary operations, but
     // I want to avoid any possible confusion here.
     assign absolute = (B[N-1] == 1'b1) ? -$signed(B) : B;

     assign {carry, ALU_Result} = (opcode == 3’d0) ? $signed(A) + $signed(B) :
                                  (opcode == 3’d1) ? $signed(A) - $signed(B) :
                                  (opcode == 3’d2) ? A & B :
                                  (opcode == 3’d3) ? ~(A | B) :
                                  (opcode == 3’d4) ? A ^ B :
                                  (opcode == 3’d5) ? A >> B[$clog2(N)-1:0] | A << (N-B[$clog2(N)-1:0]) :
                                  (opcode == 3’d6) ? ONES(A) + ONES(B) : absolute;

     assign zero = (y == 0);
     assign flags = {carry, zero};

endmodule

