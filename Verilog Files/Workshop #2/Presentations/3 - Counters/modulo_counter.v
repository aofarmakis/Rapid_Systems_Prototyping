module modulo_counter (reset, clk, count, modulo);
     parameter N = 8;
     parameter MODULO = 159;

     input reset, clk;
     output reg [N-1:0] count;
     output modulo;

     assign modulo = (count == MODULO);

     // We also want to reset (synchronously here!)
     // when we reach the desired modulus
     always @(posedge clk or posedge reset) begin
          if (reset) count <= 0;
          else if (modulo) count <= 0;
          else count <= count + 1;
     end

endmodule