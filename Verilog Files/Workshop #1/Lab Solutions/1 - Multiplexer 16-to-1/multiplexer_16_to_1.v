module multiplexer_16_to_1 (a0, a1, a2, a3, b0, b1, b2, b3, c0, c1, c2, c3, d0, d1, d2, d3, select, mux_out);
     parameter N = 8;

     input [N-1:0] a0, a1, a2, a3, b0, b1, b2, b3, c0, c1, c2, c3, d0, d1, d2, d3;
     input [3:0] select;
     output [N-1:0] mux_out;
     
     wire [N-1:0] mux4_a, mux4_b, mux4_c, mux4_d;
     
     // Applying a port connection based on the ordered list appearance of signals.
     // Port connection by name is also possible, but I hate writing more.
     multiplexer_4_to_1 #(N) mux_4a_instance (a0, a1, a2, a3, select[1:0], mux4_a);
     multiplexer_4_to_1 #(N) mux_4b_instance (b0, b1, b2, b3, select[1:0], mux4_b);
     multiplexer_4_to_1 #(N) mux_4c_instance (c0, c1, c2, c3, select[1:0], mux4_c);
     multiplexer_4_to_1 #(N) mux_4d_instance (d0, d1, d2, d3, select[1:0], mux4_d);
     multiplexer_4_to_1 #(N) mux_final_instance (mux4_a, mux4_b, mux4_c, mux4_d, select[3:2], mux_out);
     
endmodule

