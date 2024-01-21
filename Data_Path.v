module Data_Path (

input   wire   [31:0]     Instr,
input   wire              clk,rst,PCSrc,
input   wire   [31:0]     RD,
input   wire              MemtoReg,Branch,ALUSrc,RegDst,RegWrite,Jump,
input   wire   [2:0]      ALU_Control,
output  wire   [31:0]     PC,ALUResult,WD,
output  wire              zero 

);

wire [4:0]    t1;
wire [31:0]   t2,t3,t5,t6,t8,t9,t10,t11,t12;
wire [27:0]   t7;

Regs_File UReg_File (

.A1(Instr[25:21]),
.A2(Instr[20:16]),
.A3(t1),
.WD3(t2),
.clk(clk),
.rst(rst),
.WE3(RegWrite),
.RD1(t3),
.RD2(WD)

);

Sign_Extend USign_Extend (

.Instr(Instr[15:0]),
.SignImm(t5)

);

Shift_Left_Twice SL1 (

.In(t5),
.Out(t6)

);

Shift_Left_Twice #(.Input_Width(28),.Output_Width(28)) SL2 (

.In({2'b00,Instr[25:0]}),
.Out(t7)

);

Adder A1(

.A(t6),
.B(t8),
.C(t9)

);

Adder A2 (

.A(PC),
.B(32'b100),
.C(t8)

);

PC_Module UPC (

.PC_in(t10),
.PC(PC),
.clk(clk),
.rst(rst)

);

ALU UALU (

.srcA(t3),
.srcB(t11),
.ALUControl(ALU_Control),
.ALUResult(ALUResult),
.zero(zero)

);

MUX UM1 (

.IN1(WD),
.IN2(t5),
.out(t11),
.sel(ALUSrc)

);

MUX #(.In_Width(5)) UM2 (

.IN1(Instr[20:16]),
.IN2(Instr[15:11]),
.out(t1),
.sel(RegDst)

);

wire  [31:0] PCJump;

assign PCJump={t8[31:28],t7}; 

MUX UM3 (

.IN1(t12),
.IN2(PCJump),
.out(t10),
.sel(Jump)

);



MUX UM4 (

.IN1(t8),
.IN2(t9),
.out(t12),
.sel(PCSrc)

);

MUX UM5 (

.IN1(ALUResult),
.IN2(RD),
.out(t2),
.sel(MemtoReg)

);


endmodule
