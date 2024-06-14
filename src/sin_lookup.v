


module sin_lookup(input clk,
                  input [7:0]  address, //We can support 8 bit addresses, and 8 bit phase precision as well.
                  output [7:0] value);



   reg [5:0]                  LUT_address;
   reg                        sign = 0;
   reg [7:0]                  intermediate_value;



   // We do ( - 1)*100 and then ( / 100) + 1
   always @(address)
     if (2 * CONST < address < 4 * CONST) begin
        LUT_address = address - CONST * 2;
     end else if (0 < address < CONST) begin
        LUT_address = CONST * 2 - address
     end else if (CONST < address < 2 * CONST) begin
        LUT_address = address;
     end

     case (LUT_address)
       6'b0: intermediate_value = 8'd100;
       6'b1: intermediate_value = 8'd102;
       6'b10: intermediate_value = 8'd104;
       6'b11: intermediate_value = 8'd107;
       6'b100: intermediate_value = 8'd109;
       6'b101: intermediate_value = 8'd112;
       6'b110: intermediate_value = 8'd114;
       6'b111: intermediate_value = 8'd117;
       6'b1000: intermediate_value = 8'd119;
       6'b1001: intermediate_value = 8'd121;
       6'b1010: intermediate_value = 8'd124;
       6'b1011: intermediate_value = 8'd126;
       6'b1100: intermediate_value = 8'd129;
       6'b1101: intermediate_value = 8'd131;
       6'b1110: intermediate_value = 8'd133;
       6'b1111: intermediate_value = 8'd135;
       6'b10000: intermediate_value = 8'd138;
       6'b10001: intermediate_value = 8'd140;
       6'b10010: intermediate_value = 8'd142;
       6'b10011: intermediate_value = 8'd144;
       6'b10100: intermediate_value = 8'd147;
       6'b10101: intermediate_value = 8'd149;
       6'b10110: intermediate_value = 8'd151;
       6'b10111: intermediate_value = 8'd153;
       6'b11000: intermediate_value = 8'd155;
       6'b11001: intermediate_value = 8'd157;
       6'b11010: intermediate_value = 8'd159;
       6'b11011: intermediate_value = 8'd161;
       6'b11100: intermediate_value = 8'd163;
       6'b11101: intermediate_value = 8'd165;
       6'b11110: intermediate_value = 8'd167;
       6'b11111: intermediate_value = 8'd168;
       6'b100000: intermediate_value = 8'd170;
       6'b100001: intermediate_value = 8'd172;
       6'b100010: intermediate_value = 8'd174;
       6'b100011: intermediate_value = 8'd175;
       6'b100100: intermediate_value = 8'd177;
       6'b100101: intermediate_value = 8'd178;
       6'b100110: intermediate_value = 8'd180;
       6'b100111: intermediate_value = 8'd181;
       6'b101000: intermediate_value = 8'd183;
       6'b101001: intermediate_value = 8'd184;
       6'b101010: intermediate_value = 8'd185;
       6'b101011: intermediate_value = 8'd187;
       6'b101100: intermediate_value = 8'd188;
       6'b101101: intermediate_value = 8'd189;
       6'b101110: intermediate_value = 8'd190;
       6'b101111: intermediate_value = 8'd191;
       6'b110000: intermediate_value = 8'd192;
       6'b110001: intermediate_value = 8'd193;
       6'b110010: intermediate_value = 8'd194;
       6'b110011: intermediate_value = 8'd194;
       6'b110100: intermediate_value = 8'd195;
       6'b110101: intermediate_value = 8'd196;
       6'b110110: intermediate_value = 8'd197;
       6'b110111: intermediate_value = 8'd197;
       6'b111000: intermediate_value = 8'd198;
       6'b111001: intermediate_value = 8'd198;
       6'b111010: intermediate_value = 8'd198;
       6'b111011: intermediate_value = 8'd199;
       6'b111100: intermediate_value = 8'd199;
       6'b111101: intermediate_value = 8'd199;
       6'b111110: intermediate_value = 8'd199;
       6'b111111: intermediate_value = 8'd199;
     endcase // case (address)

   if (sign) intermediate_value - 100;

endmodule; // sin_lookup
