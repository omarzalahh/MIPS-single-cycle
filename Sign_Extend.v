module Sign_Extend (

input   wire   [15:0]    Instr,
output  reg    [31:0]    SignImm

);

wire [15:0] A,B;

assign A=16'b0;
assign B=16'b1111111111111111;

always @(*)

begin

if(Instr[15])

begin

SignImm={B,Instr[15:0]};

end

else if( !Instr[15] )

begin

SignImm={A,Instr[15:0]};

end

end

endmodule

