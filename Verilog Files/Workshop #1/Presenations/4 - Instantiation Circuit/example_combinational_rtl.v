module example_combinational_rtl (a, b, c, y);
     input a, b, c;     // 1-bit (wire implied) inputs a, b, c
     output y;          // 1-bit (wire implied) output y

     // A single "assign" will do the trick!
     assign y = (~(a | b)) ^ ((~b) & c);
     
endmodule

