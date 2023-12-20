module up_down_counter (reset, clk, up_down, count);
     parameter N = 8;

     input reset, clk, up_down;
     output reg [N-1:0] count;

     // When up_down = 1 → count upwards, otherwise
     // we count downwards
     always @(posedge clk or posedge reset) begin
          if (reset) count <= 0;
          else if (up_down) count <= count + 1;
          else count <= count - 1;
     end

endmodule