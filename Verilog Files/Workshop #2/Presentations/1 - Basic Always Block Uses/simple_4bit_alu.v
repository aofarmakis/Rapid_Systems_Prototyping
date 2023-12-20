module simple_4bit_alu (a, b, opcode, carry, zero, alu_out);
     input [3:0] a, b;
     input [1:0] opcode;
     output reg [3:0] alu_out;
     output reg carry;
     output zero;

     // Notice that “carry” and “alu_out” are reg types!
     always @(a or b or opcode) begin    // Could be done as “@(*)” as well
          case (opcode)     // Functionally equivalent to tenary (sort of, more on that soon)
               2'b00: {carry, alu_out} = $signed(a) + $signed(b);
               2'b01: {carry, alu_out} = $signed(a) - $signed(b);
               2'b10: alu_out = a & b;
               2'b11: alu_out = a | b;
          endcase
     end

     assign zero = (alu_out == 0);     // Notice that “zero” is a wire type!

endmodule