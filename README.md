## 🔍 Project Overview – RISC-V AMBA Peripheral System

본 프로젝트는 **RISC-V RV32I CPU, AMBA APB Bus, UART-FIFO Peripheral, UVM-Lite 검증, C Application 실행**까지 하나의 SoC 구성 절차를 완성한 설계·검증 프로젝트입니다.

---

### ✔ 핵심 구성 요소 (PDF p.3–8)

- **RV32I CPU (Single-Cycle / Multi-Cycle)**  
  - busAddr, busWData, busRData, write, transfer, ready 신호 기반 APB 통신  
  - 명령어는 ROM에서 Fetch  
- **ROM (Instruction Memory)**  
  - CPU 부팅 시 프로그램 Fetch  
- **APB Master**  
  - CPU 제어 신호를 APB 규격(PADDR/PSEL/PWRITE/PENABLE 등)으로 변환  
- **APB Slave Peripherals**  
  - RAM, GPO, GPI, UART FIFO 등 연결

---

### ✔ Multi-Cycle 구조 (PDF p.9–11)

- Program Counter, Register File, ALU, ImmExtend, Control FSM 포함  
- FETCH → DECODE → EXE → MEM → WB 파이프 진행  
- R-type → S-type 동작 확인 및 PC 증가 정상 동작

---

### ✔ AMBA APB Bus 설계 목적 (PDF p.12–15)

1. 단순 제어 (주소/데이터/읽기/쓰기 기반 신호)  
2. 저전력 동작  
3. 주변장치 확장 용이  
4. APB 프로토콜 기반 IP 재사용성 향상  

**APB FSM:**  
- IDLE → SETUP → ACCESS  
- PSEL=1, PENABLE=1에서 유효 전송  
- PREADY=1 시 완료

---

### ✔ UART FIFO Peripheral (PDF p.16–18)

- **TX FIFO → UART_TX → PC 송신**  
- **PC 수신 → UART_RX → RX FIFO**  
- APB Master가 TDR(Rx Reg), RDR(Tx Reg)을 제어  
- UVM-Lite 환경에서 TX/RX 시나리오 랜덤 검증  
- gen / drv / mon / scb 구성으로 PASS/FAIL 자동 판정

---

### ✔ UART Peripheral 검증 결과 (PDF p.19)

- 모든 트랜잭션 PASS  
- TX/RX 데이터 동일성 확인

---

### ✔ C Application (PDF p.20–21)

- APB 레지스터를 이용한 LED Shift Program  
- UART Ready 확인 → LED Left/Right 이동  
- Basys3 보드에서 실제 동작 영상 포함

---

### ✔ Troubleshooting & 개선 (PDF p.22–24)

- **문제:**  
  APB 인터페이스 + UART 제어를 한 모듈에서 조합논리로 처리 → 타이밍 오류 발생  
- **해결:**  
  FSM 기반으로 제어 신호 분리하여 타이밍 문제 해결  
- **추가 개선:**  
  FND 레지스터 오프셋 실수로 값이 항상 15 출력됨 → 주소 매핑 수정으로 해결




## 📄 RISC-V AMBA Peripheral Project (PDF Report)

전체 프로젝트 보고서는 아래 PDF에서 확인할 수 있습니다.

👉 [📘 **RISC-V AMBA Peripheral PDF 열기**](./RISC-V%20AMBA%20Peripheral.pdf)


:contentReference[oaicite:0]{index=0}

---

### 📌 PDF 미리보기 썸네일 (옵션)

[![PDF Preview](./riscv_amba_page1.png)](./RISC-V%20AMBA%20Peripheral.pdf)


