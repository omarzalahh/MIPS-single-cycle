module 	Final_TOP (

input    wire              clk,rst,
output   wire   [15:0]     test_value

);

wire   [31:0]    PC,ALUResult,WD,RD,Instr;
wire             MemWrite;

MIPS_Top UMips_Top (

.Instr(Instr),
.clk(clk),
.rst(rst),
.RD(RD),
.PC(PC),
.MemWrite(MemWrite),
.ALUResult(ALUResult),
.WD(WD)

);

Data_Memory UDataMem (

.A(ALUResult),
.WD(WD),
.clk(clk),
.rst(rst),
.WE(MemWrite),
.RD(RD),
.test_value(test_value)

);

Instruction_Memory UInistM (

.PC(PC),
.Instr(Instr)

);

endmodule