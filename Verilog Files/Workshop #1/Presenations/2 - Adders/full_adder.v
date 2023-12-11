module full_adder (a, b, c_in, carry, sum);
     input a, b, c_in;
     output carry, sum;

     assign carry = (a & b) | (a & c_in) | (b & c_in);
     assign sum = a ^ b ^ c_in;

endmodule