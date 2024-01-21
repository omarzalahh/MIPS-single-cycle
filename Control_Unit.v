module Control_Unit (

input    wire   [31:0]    Instr,
input    wire             zero,
output   wire             MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump,PCSrc,
output   wire   [2:0]     ALU_Control

);

wire [1:0] ALU_Op;

assign PCSrc=Branch & zero;

Main_Decoder Mdec(

.Instr(Instr[31:26]),
.MemtoReg(MemtoReg),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.Jump(Jump),
.MemWrite(MemWrite),
.ALU_Op(ALU_Op),
.RegWrite(RegWrite)
);

ALU_Decoder ALU_Dec(

.Instr(Instr[5:0]),
.ALU_Op(ALU_Op),
.ALU_Control(ALU_Control)

);

endmodule

