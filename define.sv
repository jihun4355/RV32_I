// `timescale 1ns / 1ps

// //ALU COMMAND
// `define ADD 4'b0000
// `define SUB 4'b1000
// `define SLL 4'b0001
// `define SRL 4'b0101
// `define SRA 4'b1101
// `define SLT 4'b0010
// `define SLTU 4'b0011
// `define XOR 4'b0100
// `define OR 4'b0110
// `define AND 4'b0111

// // // B-Type (branch)
// `define BEQ 3'b000
// `define BNE 3'b001
// `define BLT 3'b100
// `define BGE 3'b101
// `define BLTU 3'b110
// `define BGEU 3'b111

// //OPCODE
// `define OP_R_TYPE 7'b0110_011 //RD = RS2 + RS1
// `define OP_S_TYPE 7'b0100_011 //SW,SH,SB
// `define OP_IL_TYPE 7'b0000_011 //LW,LH,LB,LBU, LHU
// `define OP_I_TYPE 7'b0010_011 //RD = RS1 + IMM
// `define OP_B_TYPE   7'b1100011 // B-type (branch)
// `define OP_U_LUI_TYPE 7'b0110111
// `define OP_U_AUIPC_TYPE 7'b0010111

// //IL-type
// // LB LH LW LBU LHU
// // IL-type (Load Instructions)
// `define LB   3'b000
// `define LH   3'b001
// `define LW   3'b010   
// `define LBU  3'b100
// `define LHU  3'b101

// //s-type
// `define SB 3'b000
// `define SH 3'b001
// `define SW 3'b010





// // // I-Type (Immediate-Arithmetic)
// // `define ADDI    3'b000
// // `define SLLI    3'b001
// // `define SLTI    3'b010
// // `define SLTIU   3'b011
// // `define XORI    3'b100
// // `define SR_TYPE 3'b101  // SRLI, SRAI
// // `define ORI     3'b110
// // `define ANDI    3'b111


// // // S-Type (Store)
// // `define SB      3'b000
// // `define SH      3'b001
// // `define SW      3'b010





















`timescale 1ns / 1ps

//ALU COMMAND
`define ADD 4'b0000
`define SUB 4'b1000
`define SLL 4'b0001
`define SRL 4'b0101
`define SRA 4'b1101
`define SLT 4'b0010
`define SLTU 4'b0011
`define XOR 4'b0100
`define OR 4'b0110
`define AND 4'b0111

`define BEQ 3'b000
`define BNE 3'b001
`define BLT 3'b100
`define BGE 3'b101
`define BLTU 3'b110
`define BGEU 3'b111

//s-type
`define SB 3'b000
`define SH 3'b001
`define SW 3'b010




//IL-type
// LB LH LW LBU LHU
// IL-type (Load Instructions)
`define LB 3'b000
`define LH 3'b001
`define LW 3'b010   
`define LBU 3'b100
`define LHU 3'b101


//OPCODE
`define OP_R_TYPE 7'b0110_011 //RD = RS2 + RS1
`define OP_S_TYPE 7'b0100_011 //SW,SH,SB
`define OP_IL_TYPE 7'b0000011 //LW,LH,LB,LBU, LHU
`define OP_I_TYPE 7'b0010_011 //RD = RS1 + IMM
`define OP_B_TYPE 7'b1100011 // BEQ, BNE, BLT, BLTU, BGE, BGEU
`define OP_U_TYPE 7'b0110111
`define OP_AU_TYPE 7'b0010111
`define OP_JALR_TYPE 7'b1100111
`define OP_JAL_TYPE 7'b1101111


// //OPCODE
// `define OP_R_TYPE 7'b0110_011 //RD = RS2 + RS1
// `define OP_S_TYPE 7'b0100_011 //SW,SH,SB
// `define OP_IL_TYPE 7'b0000_011 //LW,LH,LB,LBU, LHU
// `define OP_I_TYPE 7'b0010_011 //RD = RS1 + IMM
// `define OP_B_TYPE   7'b1100011 // B-type (branch)
// `define OP_U_LUI_TYPE 7'b0110111
// `define OP_U_AUIPC_TYPE 7'b0010111