`timescale 1ns/1ps
module tb_top;

    reg CLK;
    reg RST;
    wire [7:0] ACC;
    wire [7:0] OUT_PORT;

    top uut (
        .CLK(CLK),
        .RST(RST),
        .ACC(ACC),
        .OUT_PORT(OUT_PORT)
    );

    // Clock generation
    initial CLK = 0;
    always #5 CLK = ~CLK; // 100 MHz

    // Monitor signals
    initial begin
        $monitor("Time=%0t | PC=%0d | ACC=%0d | OUT_PORT=%0d",
                 $time, uut.mcu.PC, ACC, OUT_PORT);
    end

    // Stimulus
    initial begin
        RST = 1;
        #20;
        RST = 0;

        #200; // Run long enough to hit HALT
        $finish;
    end

endmodule
