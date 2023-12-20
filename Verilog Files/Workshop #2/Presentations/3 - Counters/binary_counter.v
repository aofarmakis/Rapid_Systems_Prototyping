module binary_counter (reset, clk, count); 
     parameter N = 8; 
 
     input reset, clk; 
     output reg [N-1:0] count; 
  
     always @(posedge clk or posedge reset) begin 
          if (reset) count <= 0; 
          else count <= count + 1; 
     end 
 
endmodule