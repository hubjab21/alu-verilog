module ALU_testbench;

reg [7:0] A, B;
reg [3:0] OpCode;
wire [7:0] Result;
wire Carry, Zero, Overflow, Parity;

ALU alu_inst (
    .A(A),
    .B(B),
    .OpCode(OpCode),
    .Result(Result),
    .Carry(Carry),
    .Zero(Zero),
    .Overflow(Overflow),
    .Parity(Parity)
);

initial begin
    $dumpfile("ALU_waveform.vcd");
    $dumpvars(0, alu_inst);
end

initial begin
    A = 8'h12;
    B = 8'h34;
    OpCode = 4'b0000;
    #10;

    A = 8'hFF;
    B = 8'h01;
    OpCode = 4'b0000;
    #10;

    A = 8'h34;
    B = 8'h12;
    OpCode = 4'b0001;
    #10;

    A = 8'h12;
    B = 8'h34;
    OpCode = 4'b0001;
    #10;

    A = 8'hAA;
    B = 8'h55;
    OpCode = 4'b0010;
    #10;

    A = 8'h0F;
    B = 8'hF0;
    OpCode = 4'b0011;
    #10;

    A = 8'hFF;
    B = 8'h0F;
    OpCode = 4'b0100;
    #10;

    A = 8'hFF;
    OpCode = 4'b0101;
    #10;

    A = 8'h01;
    OpCode = 4'b0110;
    #10;

    A = 8'h80;
    OpCode = 4'b0111;
    #10;

    A = 8'h85;
    OpCode = 4'b1000;
    #10;

    A = 8'h85;
    OpCode = 4'b1001;
    #10;

    A = 8'h12;
    B = 8'h12;
    OpCode = 4'b1010;
    #10;

    A = 8'h12;
    B = 8'h34;
    OpCode = 4'b1011;
    #10;

    A = 8'h04;
    B = 8'h03;
    OpCode = 4'b1100;
    #10;

    A = 8'h08;
    B = 8'h02;
    OpCode = 4'b1101;
    #10;

    A = 8'h08;
    B = 8'h00;
    OpCode = 4'b1101;
    #10;

    A = 8'h09;
    B = 8'h04;
    OpCode = 4'b1110;
    #10;

    A = 8'h40;
    OpCode = 4'b1111;
    #10;

    A = 8'hC0;
    OpCode = 4'b1111;
    #10;

    $stop;
end

endmodule
