module half_adder_one_assign (a, b, carry, sum);
     input a, b;
     output carry, sum;

     // Concatenate to use one assign!
     assign {carry, sum} = a + b;

endmodule

