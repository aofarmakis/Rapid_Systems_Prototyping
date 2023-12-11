module example_combinational_gate_level (a, b, c, y);
     input a, b, c;     // 1-bit (wire implied) inputs a, b, c
     output y;          // 1-bit (wire implied) output y

     wire g1, g2, g3;   // Temporary gate outputs are written as wires

     // The outputs of each gate
     // are always written first
     not (g1, b);
     nor (g2, a, b);
     and (g3, g1, c);
     xor (y, g2, g3);
     
endmodule

