



// `timescale 1ns / 1ps
// `include "define.sv"

// module control_unit (
//     input  logic [31:0] instr_code,
//     output logic [ 3:0] alu_controls,
//     output logic [ 2:0] store_type,
//     output logic [ 2:0] load_type,
//     output logic        aluSrcMuxSel,
//     output logic [ 2:0] RegWdataSel,
//     output logic        reg_wr_en,
//     output logic        d_wr_en,
//     output logic        branch,
//     output logic        jal,
//     output logic        jarl
// );

//     //    rom [0] = 32'h004182B3; //32'b0000_0000_0100_0001_1000_0010_1011_0011; // add x5, x3, x4
//     wire  [6:0] funct7 = instr_code[31:25];
//     wire  [2:0] funct3 = instr_code[14:12];
//     wire  [6:0] opcode = instr_code[6:0];
//     logic [8:0] controls;

//     assign funct3 = instr_code[14:12];
//     assign {jal, jarl, RegWdataSel, aluSrcMuxSel, reg_wr_en, d_wr_en, branch} = controls;

//     always_comb begin
//         case (opcode)
//             `OP_R_TYPE:    controls = 9'b000000100;
//             `OP_S_TYPE:    controls = 9'b000001010;
//             `OP_IL_TYPE:   controls = 9'b000011100;
//             `OP_I_TYPE:    controls = 9'b000001100;
//             `OP_B_TYPE:    controls = 9'b000000001;
//             `OP_U_TYPE:    controls = 9'b000100100;
//             `OP_AU_TYPE:   controls = 9'b000110110;
//             // `OP_JAL_TYPE:  controls = 9'b101000100;
//             // `OP_JALR_TYPE: controls = 9'b111000100;
//             `OP_JAL_TYPE:  controls = 9'b101000100; // jal=1, jarl=0
//             `OP_JALR_TYPE: controls = 9'b011000100; // jal=0, jarl=1

//             default: controls = 9'b000000000;
//         endcase
//     end



//     always_comb begin
//         case (opcode)
//             `OP_R_TYPE:  alu_controls = {funct7[5], funct3};  // R-type
//             `OP_S_TYPE:  alu_controls = `ADD;  // S-type
//             `OP_IL_TYPE: alu_controls = `ADD;  //IL-type 
//             `OP_I_TYPE: begin
//                 if ({funct7[5], funct3} == 4'b1101)
//                     alu_controls = {1'b1, funct3};
//                 else alu_controls = {1'b0, funct3};
//             end
//             `OP_B_TYPE:  alu_controls = {1'b0, funct3};  // B_type

//             default: alu_controls = 4'bx;
//         endcase
//     end


//     always_comb begin
//         store_type = 3'b000;
//         if (opcode == `OP_S_TYPE) begin
//             case (funct3)
//                 `SB: store_type = 3'b001;
//                 `SH: store_type = 3'b010;
//                 `SW: store_type = 3'b100;
//                 default: store_type = 3'b000;
//             endcase
//         end
//     end

//     always_comb begin
//         load_type = 3'b000;
//         if (opcode == `OP_IL_TYPE) begin
//             case (funct3)
//                 `LB: load_type = 3'b001;
//                 `LH: load_type = 3'b010;
//                 `LW: load_type = 3'b011;
//                 `LBU: load_type = 3'b100;
//                 `LHU: load_type = 3'b101;
//                 default: load_type = 3'b000;
//             endcase
//         end
//     end





// endmodule








`timescale 1ns / 1ps
`include "define.sv"

module control_unit (
    input  logic [31:0] instr_code,
    output logic [ 3:0] alu_controls,
    output logic [ 2:0] store_type,
    output logic [ 2:0] load_type,
    output logic        aluSrcMuxSel,
    output logic [ 2:0] RegWdataSel,
    output logic        reg_wr_en,
    output logic        d_wr_en,
    output logic        branch,
    output logic        jal,
    output logic        jarl
);

    //    rom [0] = 32'h004182B3; //32'b0000_0000_0100_0001_1000_0010_1011_0011; // add x5, x3, x4
    wire  [6:0] funct7 = instr_code[31:25];
    wire  [2:0] funct3 = instr_code[14:12];
    wire  [6:0] opcode = instr_code[6:0];
    logic [8:0] controls;

    assign funct3 = instr_code[14:12];
    assign {jal, jarl, RegWdataSel, aluSrcMuxSel, reg_wr_en, d_wr_en, branch} = controls;

    always_comb begin
        case (opcode)
            `OP_R_TYPE:    controls = 9'b000000100;
            `OP_S_TYPE:    controls = 9'b000001010;
            `OP_IL_TYPE:   controls = 9'b000011100;
            `OP_I_TYPE:    controls = 9'b000001100;
            `OP_B_TYPE:    controls = 9'b000000001;
            `OP_U_TYPE:    controls = 9'b000100100;
            `OP_AU_TYPE:   controls = 9'b000110110;
            `OP_JAL_TYPE:  controls = 9'b101000100;
            `OP_JALR_TYPE: controls = 9'b111000100;
            default:       controls = 9'b000000000;
        endcase
    end


    always_comb begin
        case (opcode)
            `OP_R_TYPE:  alu_controls = {funct7[5], funct3};  // R-type
            `OP_S_TYPE:  alu_controls = `ADD;  // S-type
            `OP_IL_TYPE: alu_controls = `ADD;  //IL-type 
            `OP_I_TYPE: begin
                if ({funct7[5], funct3} == 4'b1101)
                    alu_controls = {1'b1, funct3};
                else alu_controls = {1'b0, funct3};
            end
            `OP_B_TYPE:  alu_controls = {1'b0, funct3};  // B_type

            default: alu_controls = 4'bx;
        endcase
    end


    always_comb begin
        store_type = 3'b000;
        if (opcode == `OP_S_TYPE) begin
            case (funct3)
                `SB: store_type = 3'b001;
                `SH: store_type = 3'b010;
                `SW: store_type = 3'b100;
                default: store_type = 3'b000;
            endcase
        end
    end

    always_comb begin
        load_type = 3'b000;
        if (opcode == `OP_IL_TYPE) begin
            case (funct3)
                `LB: load_type = 3'b001;
                `LH: load_type = 3'b010;
                `LW: load_type = 3'b011;
                `LBU: load_type = 3'b100;
                `LHU: load_type = 3'b101;
                default: load_type = 3'b000;
            endcase
        end
    end



endmodule


