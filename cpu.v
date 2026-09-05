`timescale 1ns / 1ps

module cpu(
    input [3:0] opcode,
    input [7:0] operand_a,
    input [7:0] operand_b,
    output reg [7:0] result
);
    always @(*) begin

        case (opcode)

            4'b0000: result = operand_a + operand_b; // ADD

            4'b0001: result = operand_a - operand_b; // SUB

            4'b0010: result = operand_a & operand_b; // AND

            4'b0011: result = operand_a | operand_b; // OR

            4'b0100: result = operand_a ^ operand_b; // XOR

            4'b0101: result = operand_a * operand_b; // MUL

            default: result = 8'b0;

        endcase

    end
endmodule
