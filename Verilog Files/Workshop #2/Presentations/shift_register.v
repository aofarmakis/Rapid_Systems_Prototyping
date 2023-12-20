module shift_register (reset, clk, load, serial_in, reg_out, serial_out);
     parameter N = 8;

     input reset, clk, load, serial_in;
     output reg [N-1:0] reg_out;
     output serial_out;

     // Asynchronous reset shift register with
     // a load enable signal attached to it
     always @(posedge clk or posedge reset) begin
          if (reset) reg_out <= 0;
          else if (load) reg_out <= {serial_in, reg_out[N-1:1]};
     end

     assign serial_out = reg_out[0];

endmodule