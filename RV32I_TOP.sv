
// `timescale 1ns / 1ps
// module RV32I_TOP (
//     input logic clk,
//     input logic reset
// );
//     logic [31:0] instr_code, instr_rAddr;
//     logic [31:0] dAddr, dWdata;
//     logic d_wr_en;
//     logic [2:0] store_type;
//     logic [2:0] load_type;
//     logic [31:0] dRdata;

//     RV32I_core U_RV32I_CPU (.*);
//     instr_mem U_instr_mem (
//         .instr_rAddr(instr_rAddr),
//         .instr_code (instr_code)
//     );

//     data_mem U_DATA_RAM (
//         .clk(clk),
//         .d_wr_en(d_wr_en),
//         .dAddr(dAddr),
//         .dWdata(dWdata),
//         .store_type(store_type),
//         .load_type(load_type),
//         .dRdata(dRdata)
//     );
// endmodule

// module RV32I_core (
//     input  logic        clk,
//     input  logic        reset,
//     input  logic [31:0] instr_code,
//     input  logic [31:0] dRdata,
//     output logic [31:0] instr_rAddr,
//     output logic        d_wr_en,
//     output logic [31:0] dAddr,
//     output logic [ 2:0] store_type,
//     output logic [31:0] dWdata,
//     output logic [2:0] load_type
// );
//     logic [3:0] alu_controls;
//     logic reg_wr_en, w_aluSrcMuxSel, w_RegWdataSel;
//     logic branch;

//     control_unit U_Control_Unit (
//         .instr_code   (instr_code),
//         .alu_controls (alu_controls),
//         .aluSrcMuxSel(w_aluSrcMuxSel),
//         .store_type   (store_type),
//         .reg_wr_en    (reg_wr_en),
//         .d_wr_en      (d_wr_en),
//         .RegWdataSel  (w_RegWdataSel),
//         .load_type (load_type),
//         .branch(branch)
//     );

//     datapath U_data_path (
//         .clk          (clk),
//         .reset        (reset),
//         .instr_code   (instr_code),
//         .alu_controls (alu_controls),
//         .reg_wr_en    (reg_wr_en),
//         .aluSrcMuxSel(w_aluSrcMuxSel),
//         .RegWdataSel  (w_RegWdataSel),
//         .dRdata       (dRdata),
//         .instr_rAddr  (instr_rAddr),
//         .dAddr        (dAddr),
//         .dWdata       (dWdata),
//         .branch(branch)
//     );
// endmodule










`timescale 1ns / 1ps
module RV32I_TOP (
    input logic clk,
    input logic reset
);
    logic [31:0] instr_code, instr_rAddr;
    logic [31:0] dAddr, dWdata;
    logic d_wr_en;
    logic [2:0] store_type;
    logic [2:0] load_type;
    logic [31:0] dRdata;

    RV32I_core U_RV32I_CPU (.*);
    instr_mem U_instr_mem (
        .instr_rAddr(instr_rAddr),
        .instr_code (instr_code)
    );

    data_mem U_DATA_RAM (
        .clk(clk),
        .d_wr_en(d_wr_en),
        .dAddr(dAddr),
        .store_type(store_type),
        .dWdata(dWdata),
        .dRdata(dRdata),
        .load_type(load_type)
    );
endmodule

module RV32I_core (
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] instr_code,
    input  logic [31:0] dRdata,
    output logic [31:0] instr_rAddr,
    output logic        d_wr_en,
    output logic [31:0] dAddr,
    output logic [ 2:0] store_type,
    output logic [31:0] dWdata,
    output logic [ 2:0] load_type
);
    logic [3:0] alu_controls;
    logic reg_wr_en, w_aluSrcMux_sel;
    logic [2:0] w_RegWdataSel;
    logic branch;
    logic jal, jarl;

    control_unit U_Control_Unit (
        .instr_code  (instr_code),
        .alu_controls(alu_controls),
        .aluSrcMuxSel(w_aluSrcMux_sel),
        .store_type  (store_type),
        .reg_wr_en   (reg_wr_en),
        .d_wr_en     (d_wr_en),
        .RegWdataSel (w_RegWdataSel),
        .load_type   (load_type),
        .branch      (branch),
        .jal         (jal),
        .jarl        (jarl)
    );

    datapath U_data_path (
        .clk         (clk),
        .reset       (reset),
        .instr_code  (instr_code),
        .alu_controls(alu_controls),
        .reg_wr_en   (reg_wr_en),
        .jal         (jal),
        .jarl        (jarl),
        .aluSrcMuxSel(w_aluSrcMux_sel),
        .RegWdataSel (w_RegWdataSel),
        .dRdata      (dRdata),
        .instr_rAddr (instr_rAddr),
        .dAddr       (dAddr),
        .dWdata      (dWdata),
        .branch      (branch)
    );
endmodule
