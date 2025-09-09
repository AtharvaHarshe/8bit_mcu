module top (
    input CLK,
    input RST,
    output [7:0] ACC,
    output [7:0] OUT_PORT
);
    cpu_core mcu (
        .CLK(CLK),
        .RST(RST),
        .ACC_OUT(ACC),
        .OUT_PORT(OUT_PORT)
    );
endmodule
