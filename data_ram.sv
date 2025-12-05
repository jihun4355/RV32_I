
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// // 32비트 워드 메모리 기반
// `timescale 1ns / 1ps
// `include "define.sv"

// module data_mem (
//     input  logic        clk,
//     input  logic        d_wr_en,
//     input  logic [31:0] dAddr,
//     input  logic [31:0] dWdata,
//     input  logic [ 2:0] store_type,
//     input  logic [ 2:0] load_type,
//     output logic [31:0] dRdata
// );

//     // 워드 단위 메모리 (32bit x 64 words)
//     logic [31:0] data_mem [0:63];

//     initial begin
//         for (int i = 0; i < 64; i++)
//             data_mem[i] = 32'h8765_4321 + i;
//     end

//     // Store (S-type)
//     always_ff @(posedge clk) begin
//         if (d_wr_en) begin
//             case (store_type)
//                 `SB: data_mem[dAddr][7:0]   <= dWdata[7:0];      // Byte
//                 `SH: data_mem[dAddr][15:0]  <= dWdata[15:0];     // Halfword
//                 `SW: data_mem[dAddr]        <= dWdata;           // Word
//             endcase
//         end
//     end

//     // Load (I-type, IL-type)
//     always_comb begin
//         case (load_type)
//             `LB : dRdata = {{24{data_mem[dAddr][7]}}, data_mem[dAddr][7:0]};
//             `LH : dRdata = {{16{data_mem[dAddr][15]}}, data_mem[dAddr][15:0]};
//             `LW : dRdata = data_mem[dAddr];
//             `LBU: dRdata = {24'b0, data_mem[dAddr][7:0]};
//             `LHU: dRdata = {16'b0, data_mem[dAddr][15:0]};
//             default: dRdata = 32'b0;
//         endcase
//     end

// endmodule











// `timescale 1ns / 1ps

// module data_mem (
//     input  logic        clk,
//     input  logic        d_wr_en,
//     input  logic [31:0] dAddr,
//     input  logic [31:0] dWdata,
//     input  logic [ 2:0] store_type,
//     input  logic [ 2:0] load_type,
//     output logic [31:0] dRdata
// );


//     logic [31:0] data_mem[0:16];

//     initial begin
//         for (int i = 0; i < 256; i++) data_mem[i] = 8'h03 + 32'h8765_4321;
//     end

//     always_ff @(posedge clk) begin
//         if (d_wr_en) begin
//             case (store_type)
//                 3'b001: data_mem[dAddr] <= dWdata[7:0];
//                 3'b010: begin
//                     data_mem[dAddr] <= dWdata[15:0];

//                 end
//                 3'b100: begin
//                     data_mem[dAddr] <= dWdata[31:0];

//                 end
//             endcase
//         end
//     end

//     always_comb begin
//         case (load_type)
//             3'b001:
//             dRdata = {{24{data_mem[dAddr][7]}}, data_mem[dAddr][7:0]};  // LB
//             3'b010:
//             dRdata = {{16{data_mem[dAddr][15]}}, data_mem[dAddr][15:0]};  // LH
//             3'b011: dRdata = {data_mem[dAddr]};  // LW
//             3'b100: dRdata = {24'b0, data_mem[dAddr][7:0]};  // LBU
//             3'b101:
//             dRdata = {16'b0, data_mem[dAddr+1], data_mem[dAddr][15:0]};  // LHU
//             default: dRdata = 32'b0;
//         endcase
//     end
// endmodule
























// `timescale 1ns / 1ps
// `include "define.sv"

// module data_mem (
//     input  logic        clk,
//     input  logic        d_wr_en,
//     input  logic [31:0] dAddr,
//     input  logic [31:0] dWdata,
//     input  logic [ 2:0] store_type,
//     input  logic [ 2:0] load_type,
//     output logic [31:0] dRdata
// );


//     logic [7:0] data_mem[0:99];

//     initial begin
//         for (int i = 0; i < 256; i++) data_mem[i] = 8'h03 + 32'h8765_4321;
//     end

//     always_ff @(posedge clk) begin
//         if (d_wr_en) begin
//             case (store_type)
//                 3'b001: data_mem[dAddr] <= dWdata[7:0];
//                 3'b010: begin
//                     data_mem[dAddr] <= dWdata[15:0];

//                 end
//                 3'b100: begin
//                     data_mem[dAddr] <= dWdata[31:0];

//                 end
//             endcase
//         end
//     end

//     always_comb begin
//         case (load_type)
//             3'b001:
//             dRdata = {{24{data_mem[dAddr][7]}}, data_mem[dAddr][7:0]};  // LB
//             3'b010:
//             dRdata = {{16{data_mem[dAddr][15]}}, data_mem[dAddr][15:0]};  // LH
//             3'b011: dRdata = {data_mem[dAddr]};  // LW
//             3'b100: dRdata = {24'b0, data_mem[dAddr][7:0]};  // LBU
//             3'b101:
//             dRdata = {16'b0, data_mem[dAddr+1], data_mem[dAddr][15:0]};  // LHU
//             default: dRdata = 32'b0;
//         endcase
//     end
// endmodule














`timescale 1ns / 1ps
`include "define.sv"

module data_mem (
    input  logic        clk,
    input  logic        d_wr_en,
    input  logic [31:0] dAddr,
    input  logic [31:0] dWdata,
    input  logic [ 2:0] store_type,
    input  logic [ 2:0] load_type,
    output logic [31:0] dRdata
);


    logic [7:0] data_mem[0:256];

    initial begin
        for (int i = 0; i < 256; i++) data_mem[i] = 8'h03 + 32'h8765_4321;
    end



    always_ff @(posedge clk) begin
        if (d_wr_en) begin
            case (store_type)
                3'b001: begin // SB
                    data_mem[dAddr] <= dWdata[7:0];
                end
                3'b010: begin // SH
                    data_mem[dAddr]     <= dWdata[7:0];
                    data_mem[dAddr + 1] <= dWdata[15:8];
                end
                3'b100: begin // SW
                    data_mem[dAddr]     <= dWdata[7:0];
                    data_mem[dAddr + 1] <= dWdata[15:8];
                    data_mem[dAddr + 2] <= dWdata[23:16];
                    data_mem[dAddr + 3] <= dWdata[31:24];
                end
            endcase
        end
    end

    always_comb begin
        case (load_type)
            3'b001: // LB
                dRdata = {{24{data_mem[dAddr][7]}}, data_mem[dAddr]};
            3'b010: // LH
                dRdata = {{16{data_mem[dAddr+1][7]}}, data_mem[dAddr+1], data_mem[dAddr]};
            3'b011: // LW
                dRdata = {data_mem[dAddr+3], data_mem[dAddr+2], data_mem[dAddr+1], data_mem[dAddr]};
            3'b100: // LBU
                dRdata = {24'b0, data_mem[dAddr]};
            3'b101: // LHU
                dRdata = {16'b0, data_mem[dAddr+1], data_mem[dAddr]};
            default:
                dRdata = 32'b0;
        endcase
    end

endmodule




// `timescale 1ns / 1ps
// `include "define.sv"

// module data_mem (
//     input  logic        clk,
//     input  logic        d_wr_en,
//     input  logic [31:0] dAddr,      // byte 주소
//     input  logic [31:0] dWdata,     // 저장할 데이터
//     input  logic [ 2:0] store_type, // SB, SH, SW
//     input  logic [ 2:0] load_type,  // LB, LH, LW, LBU, LHU
//     output logic [31:0] dRdata      // 읽어온 데이터
// );


//     logic [7:0] data_mem[0:99];

//     // initial begin
//     //     for (int i = 0; i < 256; i++) data_mem[i] = 8'h03 + 32'h8765_4321;
//     // end


//     initial begin
//         for (int i = 0; i < 256; i++)
//             data_mem[i] = 32'h8765_4321 + i;
//     end

//     // -------------------
//     // Store (쓰기)
//     // -------------------
//     always_ff @(posedge clk) begin
//         if (d_wr_en) begin
//             case (store_type)
//                 `SB: begin
//                     case (dAddr[1:0])
//                         2'b00: data_mem[dAddr[31:2]][7:0]   <= dWdata[7:0];
//                         2'b01: data_mem[dAddr[31:2]][15:8]  <= dWdata[7:0];
//                         2'b10: data_mem[dAddr[31:2]][23:16] <= dWdata[7:0];
//                         2'b11: data_mem[dAddr[31:2]][31:24] <= dWdata[7:0];
//                     endcase
//                 end

//                 `SH: begin
//                     case (dAddr[1])
//                         1'b0: data_mem[dAddr[31:2]][15:0]  <= dWdata[15:0];
//                         1'b1: data_mem[dAddr[31:2]][31:16] <= dWdata[15:0];
//                     endcase
//                 end

//                 `SW: begin
//                     data_mem[dAddr[31:2]] <= dWdata;
//                 end
//             endcase
//         end
//     end

//     // -------------------
//     // Load (읽기)
//     // -------------------
//     always_comb begin
//         case (load_type)
//             `LB: begin
//                 case (dAddr[1:0])
//                     2'b00: dRdata = {{24{data_mem[dAddr[31:2]][7]}},   data_mem[dAddr[31:2]][7:0]};
//                     2'b01: dRdata = {{24{data_mem[dAddr[31:2]][15]}},  data_mem[dAddr[31:2]][15:8]};
//                     2'b10: dRdata = {{24{data_mem[dAddr[31:2]][23]}},  data_mem[dAddr[31:2]][23:16]};
//                     2'b11: dRdata = {{24{data_mem[dAddr[31:2]][31]}},  data_mem[dAddr[31:2]][31:24]};
//                 endcase
//             end

//             `LBU: begin
//                 case (dAddr[1:0])
//                     2'b00: dRdata = {24'b0, data_mem[dAddr[31:2]][7:0]};
//                     2'b01: dRdata = {24'b0, data_mem[dAddr[31:2]][15:8]};
//                     2'b10: dRdata = {24'b0, data_mem[dAddr[31:2]][23:16]};
//                     2'b11: dRdata = {24'b0, data_mem[dAddr[31:2]][31:24]};
//                 endcase
//             end

//             `LH: begin
//                 case (dAddr[1])
//                     1'b0: dRdata = {{16{data_mem[dAddr[31:2]][15]}}, data_mem[dAddr[31:2]][15:0]};
//                     1'b1: dRdata = {{16{data_mem[dAddr[31:2]][31]}}, data_mem[dAddr[31:2]][31:16]};
//                 endcase
//             end

//             `LHU: begin
//                 case (dAddr[1])
//                     1'b0: dRdata = {16'b0, data_mem[dAddr[31:2]][15:0]};
//                     1'b1: dRdata = {16'b0, data_mem[dAddr[31:2]][31:16]};
//                 endcase
//             end

//             `LW: dRdata = data_mem[dAddr[31:2]];

//             default: dRdata = 32'b0;
//         endcase
//     end

// endmodule
