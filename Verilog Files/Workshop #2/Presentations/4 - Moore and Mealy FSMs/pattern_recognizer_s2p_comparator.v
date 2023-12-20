module pattern_recognizer_s2p_comparator (reset, clk, string_in, seen);
     input reset, clk, string_in;
     output seen;

     reg [3:0] serial_to_parallel;

     // A simple shift register...
     always @(posedge clk or posedge reset) begin
          if (reset) serial_to_parallel <= 4'b0000;
          else serial_to_parallel <= {serial_to_parallel[2:0], string_in};
     end

     // ...and a comparator!
     assign seen = (serial_to_parallel == 4'b1101);

endmodule