module scalable_size_adder (a, b, c_in, carry, sum);
     parameter N = 8;     // To make a, b and sum the size we want easily (here 8-bits)

     input [N-1:0] a, b;
     input c_in;
     output [N-1:0] sum;
     output carry;

     // Concatenate to use one assign!
     assign {carry, sum} = a + b + c_in;

endmodule

