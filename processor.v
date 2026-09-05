`timescale 1ns / 1ps


module processor(
    input clk,
    input we,
    input [3:0] address,
    input [19:0] write_data,
    output [7:0] result
);
    // 20-bit instruction from memory
    wire [19:0] instruction;

    // Decoded instruction fields
    wire [3:0] opcode;
    wire [7:0] operand_a;
    wire [7:0] operand_b;

    // Instruction memory
    memory mem (
        .clk(clk),
        .we(we),
        .addr(address),
        .write_data(write_data),
        .instruction(instruction)
    );

    // Instruction extraction
    assign opcode   = instruction[19:16];
    assign operand_a = instruction[15:8];
    assign operand_b = instruction[7:0];

    // CPU / ALU
    cpu alu (
        .opcode(opcode),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(result)
    );
endmodule
