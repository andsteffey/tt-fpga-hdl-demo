//_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
//_\source top.tlv 41

//_\SV
   // Included URL: "https://raw.githubusercontent.com/efabless/chipcraft---mest-course/main/tlv_lib/calculator_shell_lib.tlv"
   // Include Tiny Tapeout Lab.
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlv_lib/tiny_tapeout_lib.tlv"// Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlv_lib/fpga_includes.tlv"
   // Included URL: "https://raw.githubusercontent.com/efabless/chipcraft---mest-course/main/reference_designs/PmodKYPD.tlv"
//_\source top.tlv 217

//_\SV

// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uo_out;
   logic [7:0]uio_in,  uio_out, uio_oe;
   logic [31:0] r;
   always @(posedge clk) r <= 0;
   assign ui_in = r[7:0];
   assign uio_in = 8'b0;
   logic ena = 1'b0;
   logic rst_n = ! reset;

   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);

   assign passed = top.cyc_cnt > 400;
   assign failed = 1'b0;
endmodule


// Provide a wrapper module to debounce input signals if requested.

//_\SV



// =======================
// The Tiny Tapeout module
// =======================

module tt_um_template (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
       // The FPGA is based on TinyTapeout 3 which has no bidirectional I/Os (vs. TT6 for the ASIC).
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
   wire reset = ! rst_n;

// ---------- Generated Code Inlined Here (before 1st \TLV) ----------
// Generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro from Redwood EDA, LLC.
// (Installed here: /usr/local/mono/sandpiper/distro.)
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


// For silencing unused signal messages.
`define BOGUS_USE(ignore)


genvar col, digit, input_label, leds, row, switch;


//
// Signals declared top-level.
//

// For $slideswitch.
logic [7:0] L0_slideswitch_a0;

// For $sseg_decimal_point_n.
logic L0_sseg_decimal_point_n_a0;

// For $sseg_digit_n.
logic [7:0] L0_sseg_digit_n_a0;

// For $sseg_segment_n.
logic [6:0] L0_sseg_segment_n_a0;

// For /fpga_pins/fpga|calc$diff.
logic [7:0] FpgaPins_Fpga_CALC_diff_a2,
            FpgaPins_Fpga_CALC_diff_a3;

// For /fpga_pins/fpga|calc$digit_flash.
logic [26:0] FpgaPins_Fpga_CALC_digit_flash_a4,
             FpgaPins_Fpga_CALC_digit_flash_a5;

// For /fpga_pins/fpga|calc$digit_one.
logic [3:0] FpgaPins_Fpga_CALC_digit_one_a4;

// For /fpga_pins/fpga|calc$digit_ten.
logic [3:0] FpgaPins_Fpga_CALC_digit_ten_a4;

// For /fpga_pins/fpga|calc$equals_in.
logic FpgaPins_Fpga_CALC_equals_in_a0,
      FpgaPins_Fpga_CALC_equals_in_a1,
      FpgaPins_Fpga_CALC_equals_in_a2,
      FpgaPins_Fpga_CALC_equals_in_a3;

// For /fpga_pins/fpga|calc$op.
logic [2:0] FpgaPins_Fpga_CALC_op_a0,
            FpgaPins_Fpga_CALC_op_a1,
            FpgaPins_Fpga_CALC_op_a2,
            FpgaPins_Fpga_CALC_op_a3;

// For /fpga_pins/fpga|calc$out.
logic [7:0] FpgaPins_Fpga_CALC_out_a3,
            FpgaPins_Fpga_CALC_out_a4;

// For /fpga_pins/fpga|calc$out_digitone.
logic [7:0] FpgaPins_Fpga_CALC_out_digitone_a4;

// For /fpga_pins/fpga|calc$out_digitten.
logic [7:0] FpgaPins_Fpga_CALC_out_digitten_a4;

// For /fpga_pins/fpga|calc$prod.
logic [7:0] FpgaPins_Fpga_CALC_prod_a2,
            FpgaPins_Fpga_CALC_prod_a3;

// For /fpga_pins/fpga|calc$quot.
logic [7:0] FpgaPins_Fpga_CALC_quot_a2,
            FpgaPins_Fpga_CALC_quot_a3;

// For /fpga_pins/fpga|calc$reset.
logic FpgaPins_Fpga_CALC_reset_a0,
      FpgaPins_Fpga_CALC_reset_a1,
      FpgaPins_Fpga_CALC_reset_a2,
      FpgaPins_Fpga_CALC_reset_a3;

// For /fpga_pins/fpga|calc$sum.
logic [7:0] FpgaPins_Fpga_CALC_sum_a2,
            FpgaPins_Fpga_CALC_sum_a3;

// For /fpga_pins/fpga|calc$ui_in.
logic [3:0] FpgaPins_Fpga_CALC_ui_in_a0,
            FpgaPins_Fpga_CALC_ui_in_a1;

// For /fpga_pins/fpga|calc$val1.
logic [7:0] FpgaPins_Fpga_CALC_val1_a1,
            FpgaPins_Fpga_CALC_val1_a2;

// For /fpga_pins/fpga|calc$val2.
logic [7:0] FpgaPins_Fpga_CALC_val2_a1,
            FpgaPins_Fpga_CALC_val2_a2;

// For /fpga_pins/fpga|calc$valid.
logic FpgaPins_Fpga_CALC_valid_a2,
      FpgaPins_Fpga_CALC_valid_a3,
      FpgaPins_Fpga_CALC_valid_a4;

// For /fpga_pins/fpga|calc$valid_or_reset.
logic FpgaPins_Fpga_CALC_valid_or_reset_a2;

// For /fpga_pins/fpga|calc/keypad$Button.
logic [15:0] w_FpgaPins_Fpga_CALC_Keypad_Button_a0 /* without recirculation for "when" condition */,
             FpgaPins_Fpga_CALC_Keypad_Button_a0,
             FpgaPins_Fpga_CALC_Keypad_Button_a1;

// For /fpga_pins/fpga|calc/keypad$CheckButton.
logic [3:0] FpgaPins_Fpga_CALC_Keypad_CheckButton_a0,
            FpgaPins_Fpga_CALC_Keypad_CheckButton_a1;

// For /fpga_pins/fpga|calc/keypad$Reported.
logic [15:0] FpgaPins_Fpga_CALC_Keypad_Reported_a0,
             FpgaPins_Fpga_CALC_Keypad_Reported_a1;

// For /fpga_pins/fpga|calc/keypad$Seq.
logic [18:0] FpgaPins_Fpga_CALC_Keypad_Seq_n1,
             FpgaPins_Fpga_CALC_Keypad_Seq_a0;

// For /fpga_pins/fpga|calc/keypad$check_mask.
logic [15:0] FpgaPins_Fpga_CALC_Keypad_check_mask_a1;

// For /fpga_pins/fpga|calc/keypad$digit_pressed.
logic [3:0] FpgaPins_Fpga_CALC_Keypad_digit_pressed_a1,
            FpgaPins_Fpga_CALC_Keypad_digit_pressed_a2;

// For /fpga_pins/fpga|calc/keypad$digits.
logic [63:0] FpgaPins_Fpga_CALC_Keypad_digits_a1;

// For /fpga_pins/fpga|calc/keypad$report_button.
logic FpgaPins_Fpga_CALC_Keypad_report_button_a1;

// For /fpga_pins/fpga|calc/keypad$reset.
logic FpgaPins_Fpga_CALC_Keypad_reset_a0,
      FpgaPins_Fpga_CALC_Keypad_reset_a1;

// For /fpga_pins/fpga|calc/keypad$row.
logic [3:0] FpgaPins_Fpga_CALC_Keypad_row_a1;

// For /fpga_pins/fpga|calc/keypad$row_sel.
logic [1:0] FpgaPins_Fpga_CALC_Keypad_row_sel_a0,
            FpgaPins_Fpga_CALC_Keypad_row_sel_a1;

// For /fpga_pins/fpga|calc/keypad$sample.
logic FpgaPins_Fpga_CALC_Keypad_sample_a0,
      FpgaPins_Fpga_CALC_Keypad_sample_a1;

// For /fpga_pins/fpga|calc/keypad$sample_or_reset.
logic FpgaPins_Fpga_CALC_Keypad_sample_or_reset_a1;

// For /fpga_pins/fpga|calc/keypad$sample_row_mask.
logic [3:0] FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a0,
            FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a1,
            FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a2,
            FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a3,
            FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a4;

// For /fpga_pins/fpga|calc/keypad$sampling.
logic FpgaPins_Fpga_CALC_Keypad_sampling_a0,
      FpgaPins_Fpga_CALC_Keypad_sampling_a1,
      FpgaPins_Fpga_CALC_Keypad_sampling_a2,
      FpgaPins_Fpga_CALC_Keypad_sampling_a3,
      FpgaPins_Fpga_CALC_Keypad_sampling_a4;




   //
   // Scope: /fpga_pins
   //


      //
      // Scope: /fpga
      //


         //
         // Scope: |calc
         //

            // Staging of $diff.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_diff_a3[7:0] <= FpgaPins_Fpga_CALC_diff_a2[7:0];

            // Staging of $digit_flash.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_digit_flash_a5[26:0] <= FpgaPins_Fpga_CALC_digit_flash_a4[26:0];

            // Staging of $equals_in.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_equals_in_a1 <= FpgaPins_Fpga_CALC_equals_in_a0;
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_equals_in_a2 <= FpgaPins_Fpga_CALC_equals_in_a1;
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_equals_in_a3 <= FpgaPins_Fpga_CALC_equals_in_a2;

            // Staging of $op.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_op_a1[2:0] <= FpgaPins_Fpga_CALC_op_a0[2:0];
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_op_a2[2:0] <= FpgaPins_Fpga_CALC_op_a1[2:0];
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_op_a3[2:0] <= FpgaPins_Fpga_CALC_op_a2[2:0];

            // Staging of $out.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_out_a4[7:0] <= FpgaPins_Fpga_CALC_out_a3[7:0];

            // Staging of $prod.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_prod_a3[7:0] <= FpgaPins_Fpga_CALC_prod_a2[7:0];

            // Staging of $quot.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_quot_a3[7:0] <= FpgaPins_Fpga_CALC_quot_a2[7:0];

            // Staging of $reset.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_reset_a1 <= FpgaPins_Fpga_CALC_reset_a0;
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_reset_a2 <= FpgaPins_Fpga_CALC_reset_a1;
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_reset_a3 <= FpgaPins_Fpga_CALC_reset_a2;

            // Staging of $sum.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_sum_a3[7:0] <= FpgaPins_Fpga_CALC_sum_a2[7:0];

            // Staging of $ui_in.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_ui_in_a1[3:0] <= FpgaPins_Fpga_CALC_ui_in_a0[3:0];

            // Staging of $val1.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_val1_a2[7:0] <= FpgaPins_Fpga_CALC_val1_a1[7:0];

            // Staging of $val2.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_val2_a2[7:0] <= FpgaPins_Fpga_CALC_val2_a1[7:0];

            // Staging of $valid.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_valid_a3 <= FpgaPins_Fpga_CALC_valid_a2;
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_valid_a4 <= FpgaPins_Fpga_CALC_valid_a3;


            //
            // Scope: /keypad
            //

               // Update state with next state or hold.
               assign FpgaPins_Fpga_CALC_Keypad_Button_a0 = !FpgaPins_Fpga_CALC_Keypad_sample_or_reset_a1 ? FpgaPins_Fpga_CALC_Keypad_Button_a1[15:0] : w_FpgaPins_Fpga_CALC_Keypad_Button_a0;
               // Staging of $Button.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_Button_a1[15:0] <= FpgaPins_Fpga_CALC_Keypad_Button_a0[15:0];

               // Staging of $CheckButton.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_CheckButton_a1[3:0] <= FpgaPins_Fpga_CALC_Keypad_CheckButton_a0[3:0];

               // Staging of $Reported.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_Reported_a1[15:0] <= FpgaPins_Fpga_CALC_Keypad_Reported_a0[15:0];

               // Staging of $Seq.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_Seq_a0[18:0] <= FpgaPins_Fpga_CALC_Keypad_Seq_n1[18:0];

               // Staging of $digit_pressed.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_digit_pressed_a2[3:0] <= FpgaPins_Fpga_CALC_Keypad_digit_pressed_a1[3:0];

               // Staging of $reset.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_reset_a1 <= FpgaPins_Fpga_CALC_Keypad_reset_a0;

               // Staging of $row_sel.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_row_sel_a1[1:0] <= FpgaPins_Fpga_CALC_Keypad_row_sel_a0[1:0];

               // Staging of $sample.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sample_a1 <= FpgaPins_Fpga_CALC_Keypad_sample_a0;

               // Staging of $sample_row_mask.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a1[3:0] <= FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a0[3:0];
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a2[3:0] <= FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a1[3:0];
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a3[3:0] <= FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a2[3:0];
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a4[3:0] <= FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a3[3:0];

               // Staging of $sampling.
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sampling_a1 <= FpgaPins_Fpga_CALC_Keypad_sampling_a0;
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sampling_a2 <= FpgaPins_Fpga_CALC_Keypad_sampling_a1;
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sampling_a3 <= FpgaPins_Fpga_CALC_Keypad_sampling_a2;
               always_ff @(posedge clk) FpgaPins_Fpga_CALC_Keypad_sampling_a4 <= FpgaPins_Fpga_CALC_Keypad_sampling_a3;









//
// Debug Signals
//

   if (1) begin : DEBUG_SIGS_GTKWAVE

      (* keep *) logic [7:0] \@0$slideswitch ;
      assign \@0$slideswitch = L0_slideswitch_a0;
      (* keep *) logic  \@0$sseg_decimal_point_n ;
      assign \@0$sseg_decimal_point_n = L0_sseg_decimal_point_n_a0;
      (* keep *) logic [7:0] \@0$sseg_digit_n ;
      assign \@0$sseg_digit_n = L0_sseg_digit_n_a0;
      (* keep *) logic [6:0] \@0$sseg_segment_n ;
      assign \@0$sseg_segment_n = L0_sseg_segment_n_a0;

      //
      // Scope: /digit[0:0]
      //
      for (digit = 0; digit <= 0; digit++) begin : \/digit 

         //
         // Scope: /leds[7:0]
         //
         for (leds = 0; leds <= 7; leds++) begin : \/leds 
            (* keep *) logic  \//@0$viz_lit ;
            assign \//@0$viz_lit = L1_Digit[digit].L2_Leds[leds].L2_viz_lit_a0;
         end
      end

      //
      // Scope: /fpga_pins
      //
      if (1) begin : \/fpga_pins 

         //
         // Scope: /fpga
         //
         if (1) begin : \/fpga 

            //
            // Scope: |calc
            //
            if (1) begin : P_calc
               (* keep *) logic [7:0] \///?$valid_or_reset@2$diff ;
               assign \///?$valid_or_reset@2$diff = FpgaPins_Fpga_CALC_diff_a2;
               (* keep *) logic [26:0] \///@4$digit_flash ;
               assign \///@4$digit_flash = FpgaPins_Fpga_CALC_digit_flash_a4;
               (* keep *) logic [3:0] \///@4$digit_one ;
               assign \///@4$digit_one = FpgaPins_Fpga_CALC_digit_one_a4;
               (* keep *) logic [3:0] \///@4$digit_ten ;
               assign \///@4$digit_ten = FpgaPins_Fpga_CALC_digit_ten_a4;
               (* keep *) logic  \///@0$equals_in ;
               assign \///@0$equals_in = FpgaPins_Fpga_CALC_equals_in_a0;
               (* keep *) logic [2:0] \///@0$op ;
               assign \///@0$op = FpgaPins_Fpga_CALC_op_a0;
               (* keep *) logic [7:0] \///@3$out ;
               assign \///@3$out = FpgaPins_Fpga_CALC_out_a3;
               (* keep *) logic [7:0] \///@4$out_digitone ;
               assign \///@4$out_digitone = FpgaPins_Fpga_CALC_out_digitone_a4;
               (* keep *) logic [7:0] \///@4$out_digitten ;
               assign \///@4$out_digitten = FpgaPins_Fpga_CALC_out_digitten_a4;
               (* keep *) logic [7:0] \///?$valid_or_reset@2$prod ;
               assign \///?$valid_or_reset@2$prod = FpgaPins_Fpga_CALC_prod_a2;
               (* keep *) logic [7:0] \///?$valid_or_reset@2$quot ;
               assign \///?$valid_or_reset@2$quot = FpgaPins_Fpga_CALC_quot_a2;
               (* keep *) logic  \///@0$reset ;
               assign \///@0$reset = FpgaPins_Fpga_CALC_reset_a0;
               (* keep *) logic [7:0] \///?$valid_or_reset@2$sum ;
               assign \///?$valid_or_reset@2$sum = FpgaPins_Fpga_CALC_sum_a2;
               (* keep *) logic [3:0] \///@0$ui_in ;
               assign \///@0$ui_in = FpgaPins_Fpga_CALC_ui_in_a0;
               (* keep *) logic [7:0] \///@1$val1 ;
               assign \///@1$val1 = FpgaPins_Fpga_CALC_val1_a1;
               (* keep *) logic [7:0] \///@1$val2 ;
               assign \///@1$val2 = FpgaPins_Fpga_CALC_val2_a1;
               (* keep *) logic  \///@2$valid ;
               assign \///@2$valid = FpgaPins_Fpga_CALC_valid_a2;
               (* keep *) logic  \///@2$valid_or_reset ;
               assign \///@2$valid_or_reset = FpgaPins_Fpga_CALC_valid_or_reset_a2;

               //
               // Scope: /keypad
               //
               if (1) begin : \/keypad 
                  (* keep *) logic [15:0] \////@0$Button ;
                  assign \////@0$Button = FpgaPins_Fpga_CALC_Keypad_Button_a0;
                  (* keep *) logic [3:0] \////@0$CheckButton ;
                  assign \////@0$CheckButton = FpgaPins_Fpga_CALC_Keypad_CheckButton_a0;
                  (* keep *) logic [15:0] \////@0$Reported ;
                  assign \////@0$Reported = FpgaPins_Fpga_CALC_Keypad_Reported_a0;
                  (* keep *) logic [18:0] \////@-1$Seq ;
                  assign \////@-1$Seq = FpgaPins_Fpga_CALC_Keypad_Seq_n1;
                  (* keep *) logic [15:0] \////@1$check_mask ;
                  assign \////@1$check_mask = FpgaPins_Fpga_CALC_Keypad_check_mask_a1;
                  (* keep *) logic [3:0] \////@1$digit_pressed ;
                  assign \////@1$digit_pressed = FpgaPins_Fpga_CALC_Keypad_digit_pressed_a1;
                  (* keep *) logic [63:0] \////@1$digits ;
                  assign \////@1$digits = FpgaPins_Fpga_CALC_Keypad_digits_a1;
                  (* keep *) logic  \////@1$report_button ;
                  assign \////@1$report_button = FpgaPins_Fpga_CALC_Keypad_report_button_a1;
                  (* keep *) logic  \////@0$reset ;
                  assign \////@0$reset = FpgaPins_Fpga_CALC_Keypad_reset_a0;
                  (* keep *) logic [3:0] \////?$sample@1$row ;
                  assign \////?$sample@1$row = FpgaPins_Fpga_CALC_Keypad_row_a1;
                  (* keep *) logic [1:0] \////?$sampling@0$row_sel ;
                  assign \////?$sampling@0$row_sel = FpgaPins_Fpga_CALC_Keypad_row_sel_a0;
                  (* keep *) logic  \////@0$sample ;
                  assign \////@0$sample = FpgaPins_Fpga_CALC_Keypad_sample_a0;
                  (* keep *) logic  \////@1$sample_or_reset ;
                  assign \////@1$sample_or_reset = FpgaPins_Fpga_CALC_Keypad_sample_or_reset_a1;
                  (* keep *) logic [3:0] \////@0$sample_row_mask ;
                  assign \////@0$sample_row_mask = FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a0;
                  (* keep *) logic  \////@0$sampling ;
                  assign \////@0$sampling = FpgaPins_Fpga_CALC_Keypad_sampling_a0;
               end
            end
         end
      end

      //
      // Scope: /switch[7:0]
      //
      for (switch = 0; switch <= 7; switch++) begin : \/switch 
         (* keep *) logic  \/@0$viz_switch ;
         assign \/@0$viz_switch = L1_Switch[switch].L1_viz_switch_a0;
      end


   end

// ---------- Generated Code Ends ----------
//_\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 76   // Instantiated from top.tlv, 272 as: m5+tt_connections()
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = ~ uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = ~ uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source

   // Instantiate the Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 307   // Instantiated from top.tlv, 275 as: m5+board(/top, /fpga, 7, $, , calc)
      
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 355   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 309 as: m4+thanks(m5__l(309)m5_eval(m5_get(BOARD_THANKS_ARGS)))
         //_/thanks
            
      //_\end_source
      
   
      // Board VIZ.
   
      // Board Image.
      
      //_/fpga_pins
         
         //_/fpga
            //_\source top.tlv 49   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 340 as: m4+calc.
            
               //_|calc
            
            
            
                  //_\source /raw.githubusercontent.com/efabless/chipcraftmestcourse/main/referencedesigns/PmodKYPD.tlv 70   // Instantiated from top.tlv, 55 as: m5+PmodKYPD(|calc, /keypad, @0, $ui_in[3:0], 1'b1, ⌈left: 40, top: 80, width: 20, height: 20⌉)
                     //_/keypad
                        // Pipelined logic to poll the keypad.
                        // Determine a fixed sequence of polling that will:
                        //   - Drive a keypad row to read, and hold it for the duration of the "sample window".
                        //   - Receive row data (1 bit per column) back from keypad, reading it at the last cycle of the sample window.
                        //   - Update array of button states ($Button).
                        // Independently, scan button states one button at a time, reporting new button presses and remembering those
                        // that have been reported while still pressed.
                        //_@0
                           assign FpgaPins_Fpga_CALC_Keypad_reset_a0 = FpgaPins_Fpga_CALC_reset_a0;
                  
                           // Run fast in Makerchip simulation.
                           
                           
                  
                           // Sample once every 2^17 cycles.
                           // Sample input 2^13 cycles after driving input.
                           // When not driving outputs, drive $_led_out.
                           // Determine when to update column keypad input
                           // and when to sample keypad output.
                           assign FpgaPins_Fpga_CALC_Keypad_Seq_n1[18:0] =
                              FpgaPins_Fpga_CALC_Keypad_reset_a0 ? 0 : FpgaPins_Fpga_CALC_Keypad_Seq_a0 + 1;
                           assign FpgaPins_Fpga_CALC_Keypad_sampling_a0 = FpgaPins_Fpga_CALC_Keypad_Seq_a0[16:13] == 4'b0;
                           assign FpgaPins_Fpga_CALC_Keypad_sample_a0 = FpgaPins_Fpga_CALC_Keypad_sampling_a0 && (FpgaPins_Fpga_CALC_Keypad_Seq_a0[12:0] == ~13'b0);
                  
                           // Update column keypad input.
                           //_?$sampling
                              assign FpgaPins_Fpga_CALC_Keypad_row_sel_a0[1:0] = FpgaPins_Fpga_CALC_Keypad_Seq_a0[18:17];
                           assign FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a0[3:0] = 4'b1 << FpgaPins_Fpga_CALC_Keypad_row_sel_a0;
                        //_@1
                           //_?$sample
                              assign FpgaPins_Fpga_CALC_Keypad_row_a1[3:0] = FpgaPins_Fpga_CALC_ui_in_a1[3:0];  // A row of data from keypad, indexed by column.
                           assign FpgaPins_Fpga_CALC_Keypad_sample_or_reset_a1 = FpgaPins_Fpga_CALC_Keypad_sample_a1 || FpgaPins_Fpga_CALC_Keypad_reset_a1;
                           //_?$sample_or_reset
                              // Update button states for the selected column.
                              assign w_FpgaPins_Fpga_CALC_Keypad_Button_a0[15:0] =
                                 FpgaPins_Fpga_CALC_Keypad_reset_a1 ? 16'b0 :
                                          {FpgaPins_Fpga_CALC_Keypad_row_sel_a1 == 2'h3 ? FpgaPins_Fpga_CALC_Keypad_row_a1 : FpgaPins_Fpga_CALC_Keypad_Button_a1[15:12],
                                           FpgaPins_Fpga_CALC_Keypad_row_sel_a1 == 2'h2 ? FpgaPins_Fpga_CALC_Keypad_row_a1 : FpgaPins_Fpga_CALC_Keypad_Button_a1[11:8],
                                           FpgaPins_Fpga_CALC_Keypad_row_sel_a1 == 2'h1 ? FpgaPins_Fpga_CALC_Keypad_row_a1 : FpgaPins_Fpga_CALC_Keypad_Button_a1[7:4],
                                           FpgaPins_Fpga_CALC_Keypad_row_sel_a1 == 2'h0 ? FpgaPins_Fpga_CALC_Keypad_row_a1 : FpgaPins_Fpga_CALC_Keypad_Button_a1[3:0]};
                  
                  
                        //
                        // Report pressed buttons (only once)
                        //
                  
                        // Check one button each cycle.
                        // Use the same pipeline as polling, aligned so that $Button, $Reported, and $CheckButton update
                        // at the same stage.
                        //_@1
                           // Pressed buttons that have been reported (to avoid reporting twice).
                           assign FpgaPins_Fpga_CALC_Keypad_Reported_a0[15:0] =
                              FpgaPins_Fpga_CALC_Keypad_reset_a1
                                 ? 16'b0 :
                              // default: button is pressed and not previously or just reported.
                                   FpgaPins_Fpga_CALC_Keypad_Button_a1 & (FpgaPins_Fpga_CALC_Keypad_Reported_a1 | (FpgaPins_Fpga_CALC_Keypad_check_mask_a1 & {16{FpgaPins_Fpga_CALC_Keypad_report_button_a1}}));
                  
                           // Can only reset to zero on TT3 FPGA demo board, so have to start with encoded count.
                           assign FpgaPins_Fpga_CALC_Keypad_CheckButton_a0[3:0] =
                              FpgaPins_Fpga_CALC_Keypad_reset_a1
                                 ? 4'h0 :
                              1'b1
                                 ? FpgaPins_Fpga_CALC_Keypad_CheckButton_a1 + 4'h1 :
                              // default
                                   FpgaPins_Fpga_CALC_Keypad_CheckButton_a1;
                           assign FpgaPins_Fpga_CALC_Keypad_check_mask_a1[15:0] = 16'b1 << FpgaPins_Fpga_CALC_Keypad_CheckButton_a1;
                           // Is the check button pressed and not reported.
                           assign FpgaPins_Fpga_CALC_Keypad_report_button_a1 = 1'b1 && | (FpgaPins_Fpga_CALC_Keypad_check_mask_a1 & FpgaPins_Fpga_CALC_Keypad_Button_a1 & ~ FpgaPins_Fpga_CALC_Keypad_Reported_a1);
                  
                           // Report it.
                           assign FpgaPins_Fpga_CALC_Keypad_digits_a1[63:0] = 64'h123A_456B_789C_0FED;
                           //$digits[63:0] = 64'h1470_258F_369E_ABCD;
                           assign FpgaPins_Fpga_CALC_Keypad_digit_pressed_a1[3:0] = FpgaPins_Fpga_CALC_Keypad_reset_a1 ? 4'hF : FpgaPins_Fpga_CALC_Keypad_report_button_a1 ? FpgaPins_Fpga_CALC_Keypad_digits_a1[(FpgaPins_Fpga_CALC_Keypad_CheckButton_a1 * 4) +: 4] : FpgaPins_Fpga_CALC_Keypad_digit_pressed_a2[3:0];
                  
                           for (row = 0; row <= 3; row++) begin : L1_FpgaPins_Fpga_CALC_Keypad_Row //_/row
                              
                              for (col = 0; col <= 3; col++) begin : L2_Col //_/col
                                 
                              end
                           end
                  
                           
                  //_\end_source
                  //_@0
                     assign FpgaPins_Fpga_CALC_reset_a0 = reset || (FpgaPins_Fpga_CALC_op_a0 == 3'b111) ;
                     // using switches
                     assign FpgaPins_Fpga_CALC_ui_in_a0[3:0] = ui_in[3:0];
            
                     assign FpgaPins_Fpga_CALC_op_a0[2:0] = ui_in[6:4];
                     //$op[2:0] = $rand;
            
                     assign FpgaPins_Fpga_CALC_equals_in_a0 = ui_in[7];
            
                  //_@1
                     assign FpgaPins_Fpga_CALC_val1_a1[7:0] = FpgaPins_Fpga_CALC_out_a3[7:0];
                     assign FpgaPins_Fpga_CALC_val2_a1[7:0] = {4'b0000, FpgaPins_Fpga_CALC_Keypad_digit_pressed_a1};
                  //_@2
                     //Counter
                     assign FpgaPins_Fpga_CALC_valid_a2 = ((FpgaPins_Fpga_CALC_equals_in_a2 == 1) && (FpgaPins_Fpga_CALC_equals_in_a3 == 0)); //? 1 : 0;
                     //$valid = $reset ? 0 : >>1$valid + 1;
                     //$cnt = $reset ? 0 : >>1$cnt + 1;
                     //$valid = $cnt;
                     assign FpgaPins_Fpga_CALC_valid_or_reset_a2 = FpgaPins_Fpga_CALC_valid_a2 || FpgaPins_Fpga_CALC_reset_a2;
                     //_?$valid_or_reset
                        //MUX input computations
                        assign FpgaPins_Fpga_CALC_sum_a2[7:0] = FpgaPins_Fpga_CALC_val1_a2[7:0] + FpgaPins_Fpga_CALC_val2_a2; // $val1[7:0] could be expressed as $val1
                        assign FpgaPins_Fpga_CALC_diff_a2[7:0] = FpgaPins_Fpga_CALC_val1_a2[7:0] - FpgaPins_Fpga_CALC_val2_a2;
                        assign FpgaPins_Fpga_CALC_prod_a2[7:0] = FpgaPins_Fpga_CALC_val1_a2[7:0] * FpgaPins_Fpga_CALC_val2_a2;
                        assign FpgaPins_Fpga_CALC_quot_a2[7:0] = FpgaPins_Fpga_CALC_val1_a2[7:0] / FpgaPins_Fpga_CALC_val2_a2;
            
            
            
                  //_@3
                     //Encoded MUX
                     assign FpgaPins_Fpga_CALC_out_a3[7:0] =
                        FpgaPins_Fpga_CALC_reset_a3
                           ? 8'b0 :
                        !FpgaPins_Fpga_CALC_valid_a3
                           ? FpgaPins_Fpga_CALC_out_a4 :
                        //$op[2:0] == 3'b100
                          // ? >>2$mem[7:0] :
                        FpgaPins_Fpga_CALC_op_a3[2:0] == 3'b011
                           ? FpgaPins_Fpga_CALC_quot_a3[7:0] :
                        FpgaPins_Fpga_CALC_op_a3[2:0] == 3'b010
                           ? FpgaPins_Fpga_CALC_prod_a3[7:0] :
                        FpgaPins_Fpga_CALC_op_a3[2:0] == 3'b001
                           ? FpgaPins_Fpga_CALC_diff_a3[7:0] :
                        FpgaPins_Fpga_CALC_op_a3[2:0] == 3'b000
                           ? FpgaPins_Fpga_CALC_sum_a3[7:0] :
                           //default
                           FpgaPins_Fpga_CALC_out_a4[7:0];
                     //mem MUX
                     //$mem[7:0] =
                        //$reset
                         //  ? 8'b0 :
                        //!$valid
                         //  ? >>1$mem :
                       // $op[2:0] == 3'b101
                       //    ? >>2$out :
                           //default
                         //  >>1$mem;
            
            
                  //_@4
                     //m5+sseg_decoder($segments_n, /keypad$digit_pressed)
            
            
            
            
            
            
                     assign FpgaPins_Fpga_CALC_digit_one_a4[3:0] = FpgaPins_Fpga_CALC_out_a4[3:0];
                     assign FpgaPins_Fpga_CALC_out_digitone_a4[7:0] =
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h0 //2'b0000
                           ? 8'b10111111 ://0
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h1 //2'b0001
                           ? 8'b10000110 ://1
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h2
                           ? 8'b11011011 ://2
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h3
                           ? 8'b11001111 ://3
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h4
                           ? 8'b11100110 ://4
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h5
                           ? 8'b11101101 ://5
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h6
                           ? 8'b11111101 ://6
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h7
                           ? 8'b10000111 ://7
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h8
                           ? 8'b11111111 ://8
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'h9
                           ? 8'b11101111 ://9
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'ha
                           ? 8'b11110111 ://a
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'hb
                           ? 8'b11111100 ://b
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'hc
                           ? 8'b10111001 ://c
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'hd
                           ? 8'b11011110 ://d
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'he
                           ? 8'b11111001 ://e
                        FpgaPins_Fpga_CALC_digit_one_a4 == 4'hf
                           ? 8'b11110001 ://f
                        //default
                           8'b00000000;  //.
            
                     assign FpgaPins_Fpga_CALC_digit_ten_a4[3:0] = FpgaPins_Fpga_CALC_out_a4[7:4];
                     assign FpgaPins_Fpga_CALC_out_digitten_a4[7:0] =
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h0 //2'b0000
                           ? 8'b00111111 ://0
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h1 //2'b0001
                           ? 8'b00000110 ://1
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h2
                           ? 8'b01011011 ://2
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h3
                           ? 8'b01001111 ://3
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h4
                           ? 8'b01100110 ://4
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h5
                           ? 8'b01101101 ://5
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h6
                           ? 8'b01111101 ://6
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h7
                           ? 8'b00000111 ://7
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h8
                           ? 8'b01111111 ://8
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'h9
                           ? 8'b01101111 ://9
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'ha
                           ? 8'b01110111 ://a
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'hb
                           ? 8'b01111100 ://b
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'hc
                           ? 8'b00111001 ://c
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'hd
                           ? 8'b01011110 ://d
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'he
                           ? 8'b01111001 ://e
                        FpgaPins_Fpga_CALC_digit_ten_a4 == 4'hf
                           ? 8'b01110001 ://f
                        //default
                           8'b00000000;  //nothing
            
                     assign FpgaPins_Fpga_CALC_digit_flash_a4[26:0] = FpgaPins_Fpga_CALC_valid_a4 ? 0 : FpgaPins_Fpga_CALC_digit_flash_a5 + 1;
            
            
            
                     assign uo_out = FpgaPins_Fpga_CALC_Keypad_sampling_a4 ? {2{FpgaPins_Fpga_CALC_Keypad_sample_row_mask_a4[3:0]}} :
                               FpgaPins_Fpga_CALC_digit_flash_a4[25]
                                  ? FpgaPins_Fpga_CALC_out_digitone_a4 :
            
                                    FpgaPins_Fpga_CALC_out_digitten_a4;
            
            
               // Note that pipesignals assigned here can be found under /fpga_pins/fpga.
            
            
            
               //m5+cal_viz(@3, /fpga) // un-comment for markerchip comment out for FPGA programming
            
               // Connect Tiny Tapeout outputs. Note that uio_ outputs are not available in the Tiny-Tapeout-3-based FPGA boards.
               assign uio_out = 8'b0;
               assign uio_oe = 8'b0;
            //_\end_source
   
      // LEDs.
      
   
      // 7-Segment
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 395   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 346 as: m4+fpga_sseg.
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            
            for (leds = 0; leds <= 7; leds++) begin : L2_Leds //_/leds

               // For $viz_lit.
               logic L2_viz_lit_a0;

               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               
            end
         end
      //_\end_source
   
      // slideswitches
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 454   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 349 as: m4+fpga_switch.
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch //_/switch

            // For $viz_switch.
            logic L1_viz_switch_a0;

            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            
         end
      //_\end_source
   
      // pushbuttons
      
   //_\end_source
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (top-to-bottom).
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 82   // Instantiated from top.tlv, 277 as: m5+tt_input_labels_viz(⌈"Value[0]", "Value[1]", "Value[2]", "Value[3]", "Op[0]", "Op[1]", "Op[2]", "="⌉)
      for (input_label = 0; input_label <= 7; input_label++) begin : L1_InputLabel //_/input_label
         
      end
   //_\end_source
   //m5+tt_input_labels_viz("KYPD row0", "KYPD row1", "KYPD row2", "KYPD row3", "D:Mask", "D:High/Dbg", "D:Reported", "Reset")

//_\SV
endmodule



// Undefine macros defined by SandPiper.
`undef BOGUS_USE
