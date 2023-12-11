module half_adder (a, b, carry, sum);
     input a, b;
     output carry, sum;

     assign carry = a & b;
     assign sum = a ^ b;

endmodule

