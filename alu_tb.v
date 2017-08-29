// ---------------------------------------------------------------------------------
// Copyright (c) 2017 HDLExpress.com, Canby, OR, USA
// All rights reserved
// ---------------------------------------------------------------------------------
// Project       :  
// Editor        :  Notepad++ on Windows 7
// FPGA          :  
// File          :  alu_tb.v - Testbench to check ALU Functional Unit
// Description   :  new KPU superscalar OoOE architect tailored to the RISC-V RV32IM ISA
// Designers     :  Kirk Weedman - kirk@hdlexpress.com
//                  user Trung
// ---------------------------------------------------------------------------------
`timescale 1ns/100ps

module alu_tb ();
   `include "functions.h"
   `include "logic_params.h"
   `include "cpu_params_RV.h"

   logic    reset;
   logic    clk_100;
   logic    debug;
   logic    [PC_SZ-1:0] pc;
   logic    [7:0] cnt;
   logic    xfer;
   

   //------------------------------------------------------------------------------------------------
   // Feed RISC-V instructions from program_memory to decode stage
   //------------------------------------------------------------------------------------------------
   IP_Data     dec_data_in;      // MUST contain both instruction and program counter value
   logic       dec_valid_in;
   logic       dec_rdy_out;

   parameter MAX_SIM_CLOCKS = 100;
   parameter PML = 500; // Program Memory length - determined by number of instructions in file CPU_CODE (see cpu_params.h)
   logic    [I_SZ-1:0] program_memory [0:PML-1];

`define DelayClockCycles(a) \
   repeat (a) @(posedge clk_100)
   
   assign xfer = dec_valid_in & dec_rdy_out;
   
   initial
   begin
      debug    = FALSE;
      reset    = 1'b1;
      cnt = 5;
      pc  = 0;
      dec_valid_in = FALSE;
      
      `DelayClockCycles(50);
      reset    = 1'b0;
      $display("Reset completed, Simulation started.");
      
      dec_valid_in = TRUE;
      
      dec_data_in = '{program_memory[0],pc};
      do
      begin
         @(posedge clk_100);
         if (xfer)
         begin
            pc = pc + 1;
            dec_data_in = '{program_memory[pc],pc};
            cnt = cnt - 1;
         end
      end
      while (cnt != 0);
      // you may want to put the test code to check the ALU Functional Unit output data here or at the bottom of this file... TBD by user
      dec_valid_in = FALSE;
      
      debug = TRUE;
      #2;
      debug = FALSE;
      @(posedge clk_100);
      @(posedge clk_100);
      
      $display("Simulation completed.");
      $stop;
   end
   
   

   ////////////////////////////////////////////////////////////////////////////
	// Generate 100 Mhz clock
   
	initial
	begin
		clk_100 = 1'b0;
		#44 // simulate some startup delay
		forever
			clk_100 = #5 ~clk_100;
	end
   
   //------------------------------------------------------------------------------------------------
   // Read RISC-V instructions from a file
   //------------------------------------------------------------------------------------------------
   // Xlinx allows this for ROM type initializatoin of FPGA - normally this is not synthesizable
   initial
      $readmemh(CPU_CODE, program_memory);
   
   
   //------------------------------------------------------------------------------------------------
   // Disassemble each instruction (for viewing in ModelSim) that is fed to the Decode stage
   //------------------------------------------------------------------------------------------------
   `ifdef SIM_DEBUG
   string      i_str;
   string      pc_str;
   
   disasm fdis (ASSEMBLY,dec_data_in,i_str,pc_str);  // disassemble each instruction to the DECODE stage
   `endif
   
   
   //------------------------------------------------------------------------------------------------
   // Decode & Micro Op stages
   //------------------------------------------------------------------------------------------------
   
   logic        dm_rdy;
   logic        dm_valid;
   DM_Data      dm_data;
   
   logic        mdc_rdy;
   logic        mdc_valid;
   MDC_Data     mdc_data;
   
   logic        alu_func_rdy;
   logic        alu_func_valid;
   FU_Data_Out  alu_func_data_out;
   FU_Data_In   alu_func_data_in;
   FWD_Data 	alu_fwd_data;
   
   assign alu_func_rdy = 1'b1;
   assign alu_func_data_in.md=mdc_data.md;
   assign alu_func_data_in.rd=mdc_data.rd;
   assign alu_func_data_in.ipd=mdc_data.ipd;
   
   
   
   decode
      DEC (.clk_in(clk_100), .reset_in(reset),
          .data_in(dec_data_in), .valid_in(dec_valid_in), .rdy_out(dec_rdy_out),
          .data_out(dm_data),    .valid_out(dm_valid),    .rdy_in(dm_rdy)
          );
		  
   microcode micro
   ( .clk_in(clk_100), .reset_in(reset),
     .data_in(dm_data), .valid_in(dm_valid), .rdy_out(dm_rdy),
     .data_out(mdc_data), .valid_out(mdc_valid), .rdy_in(mdc_rdy)
   );
   
   alu_functional_unit alu_func
   (
	.clk_in(clk_100),.reset_in(reset),
    .data_in(alu_func_data_in),   .valid_in(mdc_valid),       .rdy_out(mdc_rdy),
    .data_out(alu_func_data_out), .valid_out(alu_func_valid) ,.rdy_in(alu_func_rdy),
    .fwd_data_out(alu_fwd_data)
   );
   
   gpr #(.MAXP(1)) g1
   ( 
   .clk_in(clk_100);
   .reset_in(reset);
   
   input    logic           [GPR_ASZ-1:0] Rs1_rd_reg_in   [0:MAXP-1];  // Registers that can be read are Rs1[], Rs2[]
   input    logic           [GPR_ASZ-1:0] Rs2_rd_reg_in   [0:MAXP-1];
                             
   output   logic               [RSZ-1:0] Rs1_rd_data_out [0:MAXP-1];  // Contents of Rs1[], Rs2[]
   output   logic               [RSZ-1:0] Rs2_rd_data_out [0:MAXP-1];
   
   input    logic           [MAX_GPR-1:0] gpr_wr_in;
   input    logic               [RSZ-1:0] gpr_wr_data_in  [0:MAX_GPR-1];

   );  

   
   // Create GPRs and CSRs
      
endmodule