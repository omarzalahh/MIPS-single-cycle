module PC_Module (

input    wire   [31:0]   PC_in,
input    wire            clk,rst,
output   reg    [31:0]   PC

);

always @(posedge clk or negedge rst)

begin

if(!rst)

begin

PC<=32'b0;

end

else

begin

PC<=PC_in;

end

end

endmodule
