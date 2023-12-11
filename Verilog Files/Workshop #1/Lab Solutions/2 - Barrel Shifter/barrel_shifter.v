module barrel_shifter (data_in, amount, shifted);

     input [7:0] data_in;
     input [2:0] amount;
     output [7:0] shifted;

     wire [7:0] stage_0, stage_1;

     // This entire module can be done using a function, and would even
     // be parametriazable if we did precisely that. So why don't we?
     // This approach is shown to give a better undestanding of how a
     // barrel shifter can be implemented with real hardware
     assign stage_0 = (amount[0]) ? {data_in[0] , data_in[7:1]} : data_in;
     assign stage_1 = (amount[1]) ? {stage_0[1:0] , stage_0[7:2]} : stage_0;
     assign shifted = (amount[2]) ? {stage_1[3:0] , stage_1[7:4]} : stage_1;

endmodule

