module multimode_shift_register (reset, clk, load, mode, parallel_in, reg_out);
     parameter N = 8;

     input [N-1:0] parallel_in;
     input [1:0] mode;
     input reset, clk, load;
     output reg [N-1:0] reg_out;

     // Register with circular shift and parallel loading capabilities
     always @(posedge clk or posedge reset) begin
          if (reset) reg_out <= 0;
          else if (load) begin
               if (mode == 2'b11) reg_out <= parallel_in;
               else if (mode == 2'b10) reg_out <= {reg_out[N-2:0], reg_out[N-1]}; 
               else if (mode == 2'b01) reg_out <= {reg_out[0], reg_out[N-1:1]};
          end
     end

endmodule
