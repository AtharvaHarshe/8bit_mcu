module cpu_core (
    input wire CLK,
    input wire RST,
    output reg [7:0] ACC_OUT,
    output reg [7:0] OUT_PORT
);

    // Registers
    reg [7:0] PC;
    reg [7:0] ACC;
    reg halt;

    // Program and Data memory
    reg [7:0] prog_mem [0:255];
    reg [7:0] data_mem [0:255];

    reg [7:0] IR;   // Instruction register
    wire [3:0] opcode  = IR[7:4];
    wire [3:0] operand = IR[3:0];

    // Instruction opcodes
    localparam LOAD  = 4'b0001,
               ADD   = 4'b0010,
               STORE = 4'b0110,
               HALT  = 4'b1111;

    // Program initialization
    initial begin : INIT_PROG
        // Program
        prog_mem[0] = {LOAD,  4'd2};   // LOAD  data_mem[2] -> ACC
        prog_mem[1] = {ADD,   4'd3};   // ADD   data_mem[3] -> ACC
        prog_mem[2] = {STORE, 4'd0};   // STORE ACC -> OUT_PORT
        prog_mem[3] = {HALT,  4'd0};   // HALT

        // Data
        data_mem[2] = 8'd5;
        data_mem[3] = 8'd7;
    end

    // Main CPU process
    always @(posedge CLK or posedge RST) begin
    if (RST) begin
        PC       <= 0;
        ACC      <= 0;
        OUT_PORT <= 0;
        halt     <= 0;
        IR       <= 0;
    end else if (!halt) begin
        IR <= prog_mem[PC];   // Fetch (loads IR with current instruction)

        case (IR[7:4])        // Execute *previously fetched* instruction
            LOAD:  ACC <= data_mem[IR[3:0]];
            ADD:   ACC <= ACC + data_mem[IR[3:0]];
            STORE: OUT_PORT <= ACC;
            HALT:  halt <= 1;
        endcase

        PC <= PC + 1; // Next instruction
    end

    ACC_OUT <= ACC;
end


endmodule
