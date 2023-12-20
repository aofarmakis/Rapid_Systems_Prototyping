module binary_counter_parallel_load (reset, clk, load, parallel_in, count);
     parameter N = 8;

     input reset, clk, load;
     input [N-1:0] parallel_in;
     output reg [N-1:0] count;

     always @(posedge clk or posedge reset) begin
          if (reset) count <= 0;
          else if (load) count <= parallel_in;
          else count <= count + 1;
     end

endmodule