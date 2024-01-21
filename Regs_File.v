module Regs_File #(parameter regF_width=32 , parameter regF_depth=100)

(
input   wire   [4:0]                   A1,A2,A3,
input   wire                           clk,rst,WE3,
input   wire   [regF_width-1:0]        WD3,
output  reg    [regF_width-1:0]        RD1,RD2

);

reg  [regF_width-1:0]  Reg_File   [regF_depth-1:0];

integer i;

always @(posedge clk or negedge rst)

begin

if(!rst)

begin

for(i=0;i<regF_depth;i=i+1)

begin

Reg_File[i]<='b0;

end

end

else if(WE3)

begin

Reg_File[A3]<=WD3;

end

end

always @(*)

begin

RD1=Reg_File[A1];
RD2=Reg_File[A2];

end




endmodule
