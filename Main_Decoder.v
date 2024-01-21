module Main_Decoder(

input    wire   [5:0]   Instr,
output   reg            MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump,
output   reg   [1:0]    ALU_Op

);

always @(*)

begin

case(Instr)

6'b100011:
 begin
 Jump=1'b0;
 ALU_Op=2'b00;
 MemWrite=1'b0;
 RegWrite=1'b0;
 RegDst=1'b0;
 ALUSrc=1'b1;
 MemtoReg=1'b1;
 Branch=1'b0;
 
 end
 
6'b101011:
 begin
 Jump=1'b0;
 ALU_Op=2'b00;
 MemWrite=1'b1;
 RegWrite=1'b0;
 RegDst=1'b0;
 ALUSrc=1'b1;
 MemtoReg=1'b1;
 Branch=1'b0;
 
 end
 
 6'b0:
 begin
 Jump=1'b0;
 ALU_Op=2'b10;
 MemWrite=1'b0;
 RegWrite=1'b1;
 RegDst=1'b1;
 ALUSrc=1'b0;
 MemtoReg=1'b0;
 Branch=1'b0;
 
 end
 
 6'b001000:
 begin
 Jump=1'b0;
 ALU_Op=2'b00;
 MemWrite=1'b0;
 RegWrite=1'b1;
 RegDst=1'b0;
 ALUSrc=1'b1;
 MemtoReg=1'b0;
 Branch=1'b0;
 
 end
 
 6'b000100:
 begin
 Jump=1'b0;
 ALU_Op=2'b01;
 MemWrite=1'b0;
 RegWrite=1'b0;
 RegDst=1'b0;
 ALUSrc=1'b0;
 MemtoReg=1'b0;
 Branch=1'b1;
 
 end
 
 6'b000010:
 begin
 Jump=1'b1;
 ALU_Op=2'b00;
 MemWrite=1'b0;
 RegWrite=1'b0;
 RegDst=1'b0;
 ALUSrc=1'b0;
 MemtoReg=1'b0;
 Branch=1'b0;
 
 end
 
 default:
 begin
 Jump=1'b0;
 ALU_Op=2'b00;
 MemWrite=1'b0;
 RegWrite=1'b0;
 RegDst=1'b0;
 ALUSrc=1'b0;
 MemtoReg=1'b0;
 Branch=1'b0;
 
 end
 
endcase 
 
end

endmodule





