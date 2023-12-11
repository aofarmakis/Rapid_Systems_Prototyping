module multiplexer_4_to_1 (a, b, c, d, sel, y);
     parameter N = 8;

     input [N-1:0] a, b, c, d;
     input [1:0] sel;
     output [N-1:0] y;
     
     // Last option is the default option
     // No need to write default explicitly
     assign y = (sel == 2’b00) ? a :
                (sel == 2’b01) ? b :
                (sel == 2’b10) ? c : d;
endmodule

