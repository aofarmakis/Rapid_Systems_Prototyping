module full_adder_one_assign (a, b, c_in, carry, sum);
     input a, b, c_in;
     output carry, sum;

     // Concatenate to use one assign!
     assign {carry, sum} = a + b + c_in;

endmodule

