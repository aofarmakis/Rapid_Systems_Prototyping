module pipo_register (reset, clk, load, parallel_in, reg_out);
     parameter N = 8;

     input reset, clk, load;
     input [N-1:0] parallel_in;
     output reg [N-1:0] reg_out;

     // Asynchronous reset PIPO (Parallel-in, Parallel-Out)
     // register with a load enable signal attached to it
     always @(posedge clk or posedge reset) begin
          if (reset) reg_out <= 0;
          else if (load) reg_out <= parallel_in;
     end

endmodule
