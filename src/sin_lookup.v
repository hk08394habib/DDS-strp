


module sin_lookup(input clk,
                  input [7:0]  address, //We can support 8 bit addresses, and 8 bit phase precision as well.
                  output reg [7:0] value);

   localparam                  CONST = 2**6 - 1;



   reg [5:0]                  LUT_address;
   reg [7:0]                  shift_address;
   reg                        sign = 0;



   // We do ( - 1)*100 and then ( / 100) + 1
   always @(address) begin //address

      $display("address is %0d", address);

      if (2 * CONST <= address && address <= 4 * CONST) begin
         shift_address = address - CONST * 2;
         sign = 1;
         $display("address mapped to negative");
      end else begin
         sign = 0;
         shift_address = address;
         $display("address mapped to positive");
      end

      $display("Shift address is %0d", shift_address);


      if (0 <= shift_address && shift_address < CONST) begin
         LUT_address = shift_address;
         $display("address mapped to first");
      end else if (CONST <= shift_address && shift_address < 2 * CONST) begin
         LUT_address = CONST * 2 - shift_address;
         $display("address mapped to second");
      end

      case (LUT_address)
        6'b0: value = 8'd100;
        6'b1: value = 8'd102;
        6'b10: value = 8'd104;
        6'b11: value = 8'd107;
        6'b100: value = 8'd109;
        6'b101: value = 8'd112;
        6'b110: value = 8'd114;
        6'b111: value = 8'd117;
        6'b1000: value = 8'd119;
        6'b1001: value = 8'd121;
        6'b1010: value = 8'd124;
        6'b1011: value = 8'd126;
        6'b1100: value = 8'd129;
        6'b1101: value = 8'd131;
        6'b1110: value = 8'd133;
        6'b1111: value = 8'd135;
        6'b10000: value = 8'd138;
        6'b10001: value = 8'd140;
        6'b10010: value = 8'd142;
        6'b10011: value = 8'd144;
        6'b10100: value = 8'd147;
        6'b10101: value = 8'd149;
        6'b10110: value = 8'd151;
        6'b10111: value = 8'd153;
        6'b11000: value = 8'd155;
        6'b11001: value = 8'd157;
        6'b11010: value = 8'd159;
        6'b11011: value = 8'd161;
        6'b11100: value = 8'd163;
        6'b11101: value = 8'd165;
        6'b11110: value = 8'd167;
        6'b11111: value = 8'd168;
        6'b100000: value = 8'd170;
        6'b100001: value = 8'd172;
        6'b100010: value = 8'd174;
        6'b100011: value = 8'd175;
        6'b100100: value = 8'd177;
        6'b100101: value = 8'd178;
        6'b100110: value = 8'd180;
        6'b100111: value = 8'd181;
        6'b101000: value = 8'd183;
        6'b101001: value = 8'd184;
        6'b101010: value = 8'd185;
        6'b101011: value = 8'd187;
        6'b101100: value = 8'd188;
        6'b101101: value = 8'd189;
        6'b101110: value = 8'd190;
        6'b101111: value = 8'd191;
        6'b110000: value = 8'd192;
        6'b110001: value = 8'd193;
        6'b110010: value = 8'd194;
        6'b110011: value = 8'd194;
        6'b110100: value = 8'd195;
        6'b110101: value = 8'd196;
        6'b110110: value = 8'd197;
        6'b110111: value = 8'd197;
        6'b111000: value = 8'd198;
        6'b111001: value = 8'd198;
        6'b111010: value = 8'd198;
        6'b111011: value = 8'd199;
        6'b111100: value = 8'd199;
        6'b111101: value = 8'd199;
        6'b111110: value = 8'd199;
        6'b111111: value = 8'd199;
      endcase // case (address)
      if (sign)
        value = 200 - value;
      $display("%d\n", value);
   end


endmodule; // sin_lookup
