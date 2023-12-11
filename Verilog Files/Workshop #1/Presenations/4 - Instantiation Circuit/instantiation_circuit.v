module instantiation_circuit (a, b, c, sel, y);
     parameter N = 3;

     input [2:0] a, b, c;
     input sel;
     output [2:0] y;

     wire [2:0] rtl_out, add_out;
     wire c_in;

     // We could use a generate for loop here of course, but let's
     // not complicate things for now. We're instantiating using
     // an ordered list (my personal favorite). Why? Less is more!
     example_combinational_rtl rtl_0 (a[0], b[0], c[0], rtl_out[0]);
     example_combinational_rtl rtl_1 (a[1], b[1], c[1], rtl_out[1]);
     example_combinational_rtl rtl_2 (a[2], b[2], c[2], rtl_out[2]);

     // Making a majority function that we can call later. Yes,
     // functions are synthesizable (more on that later), and
     // they can be quite helpful, though this use below is trivial
     function MAJ;
          input I1, I2, I3;
               begin
                    MAJ = (I1 & I2) | (I1 & I3) | (I2 & I3);
               end
     endfunction

     // Calling the MAJ function we defined previously
     assign c_in = MAJ(c[2], c[1], c[0]);

     // Instantiating our 3-bit adder, and using our new c_in
     // that we made with our function call earlier
     scalable_size_adder #(N) adder (a, b, c_in, add_out);

     // Our final output multiplexed from the two previous
     // sub-circuits that we instantiated above. Keep in mind
     // that ALL OF THIS is parallel, i.e. it all runs at the
     // exact same time!
     assign y = (sel) ? add_out : rtl_out;

endmodule
