module MIPS_Top (

input   wire   [31:0]     Instr,
input   wire              clk,rst,
input   wire   [31:0]     RD,
output  wire   [31:0]     PC,ALUResult,WD,
output  wire              MemWrite

);

wire             MemtoReg,Branch,ALUSrc,RegDst,RegWrite,Jump,zero,PCSrc;
wire   [2:0]     ALU_Control;

Data_Path UDP (

.Instr(Instr),
.clk(clk),
.rst(rst),
.RD(RD),
.MemtoReg(MemtoReg),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.Jump(Jump),
.zero(zero),
.ALU_Control(ALU_Control),
.PC(PC),
.ALUResult(ALUResult),
.WD(WD),
.PCSrc(PCSrc)

);

Control_Unit UCU (

.Instr(Instr),
.MemtoReg(MemtoReg),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.Jump(Jump),
.MemWrite(MemWrite),
.ALU_Control(ALU_Control),
.PCSrc(PCSrc),
.zero(zero)
);

endmodule