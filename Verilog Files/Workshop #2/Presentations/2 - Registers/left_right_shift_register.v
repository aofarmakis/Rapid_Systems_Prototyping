module left_right_shift_register (reset, clk, load, left_right, serial_in, reg_out);
     parameter N = 8;

     input reset, clk, load, left_right, serial_in;
     output reg [N-1:0] reg_out;

     // Asynchronous reset bidirectional (why?) SIPO shift
     // register with a load enable signal attached to it
     always @(posedge clk or posedge reset) begin
          if (reset) reg_out <= 0;
          else if (load) begin
              if (left_right) reg_out <= {reg_out[N-2:0], serial_in};
              else reg_out <= {serial_in, reg_out[N-1:1]};
          end
     end

endmodule
