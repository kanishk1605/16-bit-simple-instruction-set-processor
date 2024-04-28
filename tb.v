`timescale 1ns/1ps
 
//IR FIELDS
`define oper_type   IR[31:27]
`define rdst        IR[26:22]
`define rsrc1       IR[21:17]
`define imm_mode    IR[16]
`define rsrc2       IR[15:11]
`define isrc        IR[15:0]
 
//ARITHMETIC OPERATIONS
`define movesgpr 5'b00000
`define mov      5'b00001
`define add      5'b00010
`define sub      5'b00011
`define mul      5'b00100
 
//LOGICAL OPERATIONS
`define ror        5'b00101
`define rand       5'b00110
`define rxor       5'b00111
`define rxnor      5'b01000
`define rnand      5'b01001
`define rnor       5'b01010
`define rnot       5'b01011
 
//LOAD AND STORE INSTRUCTIONS
 
`define storereg       5'b01101   //////store content of register (GPR) in data memory
`define storedin       5'b01110   ////// store content of din bus in data memory
`define senddout       5'b01111   /////send data from DM to dout bus
`define sendreg        5'b10001   ////// send data from DM to register
  
///////////////////////////// Jump and branch instructions

`define jump           5'b10010  ////jump to address
`define jcarry         5'b10011  ////jump if carry
`define jnocarry       5'b10100
`define jsign          5'b10101  ////jump if sign
`define jnosign        5'b10110
`define jzero          5'b10111  //// jump if zero
`define jnozero        5'b11000
`define joverflow      5'b11001 ////jump if overflow
`define jnooverflow    5'b11010

 
module tb();
 
    integer i = 0;
    
    reg clk = 0,sys_rst = 0;
    reg [15:0] din = 0;
    wire [15:0] dout;
 
    top dut(.clk(clk),
            .sys_rst(sys_rst),
            .din(din),
            .dout(dout)
    );
 
    always #5 clk = ~clk;
 
    //INITIALISING VALUE OF ALL REGISTERS TO ZERO
    initial begin
        for(i=0; i<32; i = i+1)
        begin
            dut.GPR[i] = 0;
        end
    end
 
    //INITIALISING VALUE OF DATA MEMORY TO TWO
    initial begin
        for(i=0; i<16; i = i+1)
        begin
            dut.data_mem[i] = 2;
        end
    end
 
    initial begin
        sys_rst = 1'b1;
        repeat(5) @(posedge clk);
        sys_rst = 1'b0;
        #800;
        $stop;
    end
endmodule

