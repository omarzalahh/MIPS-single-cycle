module ALU_Decoder(

input    wire   [5:0]  Instr,
input    wire   [1:0]  ALU_Op,
output   reg    [2:0]  ALU_Control

);

always@(*)

begin

case(ALU_Op)

2'b00: ALU_Control=3'b010;
2'b01: ALU_Control=3'b100;
2'b10: 
begin

case(Instr)

6'b100000: ALU_Control=3'b010;
6'b100010: ALU_Control=3'b100;
6'b101010: ALU_Control=3'b110;
6'b011100: ALU_Control=3'b101;  

endcase

end

default: ALU_Control=3'b010;

endcase

end

endmodule