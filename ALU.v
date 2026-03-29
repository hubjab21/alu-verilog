module ALU (
    input [7:0] A,
    input [7:0] B,
    input [3:0] OpCode,
    output reg [7:0] Result,
    output reg Carry,
    output reg Zero,
    output reg Overflow,
    output reg Parity
);

always @(*) begin
    Carry = 0;
    Zero = 0;
    Overflow = 0;
    Parity = 0;

    case (OpCode)
        4'b0000: Result = A + B;
        4'b0001: Result = A - B;
        4'b0010: Result = A & B;
        4'b0011: Result = A | B;
        4'b0100: Result = A ^ B;
        4'b0101: Result = ~A;
        4'b0110: Result = A << 1;
        4'b0111: Result = A >> 1;
        4'b1000: Result = {A[6:0], 1'b0};
        4'b1001: Result = {1'b0, A[7:1]};
        4'b1010: Result = (A == B) ? 8'b1 : 8'b0;
        4'b1011: Result = (A < B) ? 8'b1 : 8'b0;
        4'b1100: Result = A * B;
        4'b1101: Result = A / B;
        4'b1110: Result = A % B;
        4'b1111: Result = (A < 8'h80) ? (A << 1) : (A >> 1);
        default: Result = 8'b00000000;
    endcase

    Carry = (OpCode == 4'b0000) && (A + B > 8'hFF);
    Zero = (Result == 8'b0);
    Overflow = (OpCode == 4'b0000) && ((A[7] == B[7]) && (Result[7] != A[7]));
    Parity = ~(^Result);
end

endmodule
