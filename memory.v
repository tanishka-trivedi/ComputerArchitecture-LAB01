`timescale 1ns / 1ps

module memory(
    input clk,
    input we,
    input [3:0] addr,
    input [19:0] write_data,
    output [19:0] instruction
);
    reg [19:0] mem [0:15];

    // Initialize memory
    initial begin
        mem[0] = {4'b0000, 8'd10, 8'd20};  // ADD 10,20
        mem[1] = {4'b0001, 8'd30, 8'd5};   // SUB 30,5
        mem[2] = {4'b0010, 8'd15, 8'd7};   // AND 15,7
        mem[3] = {4'b0011, 8'd12, 8'd3};   // OR 12,3
        mem[4] = {4'b0100, 8'd10, 8'd5};   // XOR 10,5
        mem[5] = {4'b0101, 8'd6, 8'd7};    // MUL 6,7

        // Remaining memory locations
        mem[6]  = 20'b0;
        mem[7]  = 20'b0;
        mem[8]  = 20'b0;
        mem[9]  = 20'b0;
        mem[10] = 20'b0;
        mem[11] = 20'b0;
        mem[12] = 20'b0;
        mem[13] = 20'b0;
        mem[14] = 20'b0;
        mem[15] = 20'b0;
    end
    
    // Synchronous write
    always @(posedge clk) begin
        if (we)
            mem[addr] <= write_data;
    end

    // Combinational read
    assign instruction = mem[addr];
endmodule
