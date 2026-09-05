`timescale 1ns / 1ps

module tb_processor;

    reg clk;
    reg we;
    reg [3:0] address;
    reg [19:0] write_data;

    wire [7:0] result;

    // Instantiate processor
    processor uut (
        .clk(clk),
        .we(we),
        .address(address),
        .write_data(write_data),
        .result(result)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        we = 0;
        address = 0;
        write_data = 0;

        $display("==============================================");
        $display("        CPU INSTRUCTION MEMORY TEST");
        $display("==============================================");
        $display("Address | Operation | Expected | Result");
        $display("----------------------------------------------");

        // Address 0: ADD 10,20 = 30
        address = 0;
        #10;
        if (result == 30)
            $display("   0    | ADD 10,20 |    30    |   %d PASS", result);
        else
            $display("   0    | ADD 10,20 |    30    |   %d FAIL", result);

        // Address 1: SUB 30,5 = 25
        address = 1;
        #10;
        if (result == 25)
            $display("   1    | SUB 30,5  |    25    |   %d PASS", result);
        else
            $display("   1    | SUB 30,5  |    25    |   %d FAIL", result);

        // Address 2: AND 15,7 = 7
        address = 2;
        #10;
        if (result == 7)
            $display("   2    | AND 15,7  |     7    |   %d PASS", result);
        else
            $display("   2    | AND 15,7  |     7    |   %d FAIL", result);

        // Address 3: OR 12,3 = 15
        address = 3;
        #10;
        if (result == 15)
            $display("   3    | OR 12,3   |    15    |   %d PASS", result);
        else
            $display("   3    | OR 12,3   |    15    |   %d FAIL", result);

        // Address 4: XOR 10,5 = 15
        address = 4;
        #10;
        if (result == 15)
            $display("   4    | XOR 10,5  |    15    |   %d PASS", result);
        else
            $display("   4    | XOR 10,5  |    15    |   %d FAIL", result);

        // Address 5: MUL 6,7 = 42
        address = 5;
        #10;
        if (result == 42)
            $display("   5    | MUL 6,7   |    42    |   %d PASS", result);
        else
            $display("   5    | MUL 6,7   |    42    |   %d FAIL", result);

        $display("----------------------------------------------");
        $display("           ALL TESTS COMPLETED");
        $display("==============================================");

        $finish;

    end

endmodule
