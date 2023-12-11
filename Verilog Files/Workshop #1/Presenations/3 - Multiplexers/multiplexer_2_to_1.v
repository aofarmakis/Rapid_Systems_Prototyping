module multiplexer_2_to_1 (a, b, sel, y);
     parameter N = 8;

     input [N-1:0] a, b;
     input sel;
     output [N-1:0] mux_out;
     
     assign y = (select) ? b : a;
     
endmodule

