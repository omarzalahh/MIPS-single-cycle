module Shift_Left_Twice #(parameter Input_Width=32, parameter Output_Width=32)

(

input    wire   [Input_Width-1:0]  In,
output   reg    [Output_Width-1:0]  Out

);

always @(*)

begin

Out=(In<<2);

end

endmodule

