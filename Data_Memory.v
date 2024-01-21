module Data_Memory
#(parameter Dmem_width=32 , parameter Dmem_depth=100)

(

input    wire    [31:0]                 A,
input    wire    [Dmem_width-1:0]       WD,
input    wire                           clk,rst,WE,
output   reg     [Dmem_width-1:0]       RD,   
output   reg     [15:0]                 test_value

);

reg  [Dmem_width-1:0]  Dmem   [Dmem_depth-1:0];

integer i;

always @(posedge clk or negedge rst)

begin

if(!rst)

begin

for(i=0;i<Dmem_depth;i=i+1)

begin

Dmem[i]<='b0;

end

end

else if(WE)

begin

Dmem[A]<=WD;

end

end

always @(*)

begin

RD=Dmem[A];
test_value=Dmem[0][15:0];

end

endmodule




