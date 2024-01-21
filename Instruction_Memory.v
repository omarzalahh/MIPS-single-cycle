module Instruction_Memory
#(parameter Imem_width=32 , parameter Imem_depth=100)

(

input    wire    [31:0]   PC,
output   reg     [31:0]   Instr   

);

reg [Imem_width-1:0] Instr_Mem [Imem_depth-1:0];

always @(*)

begin

Instr=Instr_Mem[PC>>2];

end

initial 

begin

$readmemh("Program 2_Machine Code.txt",Instr_Mem);

end

endmodule