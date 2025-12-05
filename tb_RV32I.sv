`timescale 1ns / 1ps

module tb_RV32I();
    logic clk = 0, reset = 1;

  
    RV32I_TOP dut (.*);


    always #5 clk = ~clk;

    initial begin
        #5;
        reset = 0;
        #600;
        $stop;
    end
endmodule
