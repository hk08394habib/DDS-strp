


module sin_lookup(input clk,
                  input [7:0]  address, //We can support an 8 bit address, and each has a precision of 8 bits
                  output [7:0] value);



   reg [7:0]                  LUT_address;
   reg                        sign = 0;
   reg [7:0]                  intermediate_value;


   always @(address)
     if (2 * CONST < address < 4 * CONST) begin
        sign = 1;
        LUT_address = address - CONST * 2;
     end else if (0 < address < CONST) begin
        LUT_address = CONST * 2 - address
     end else if (CONST < address < 2 * CONST) begin
        LUT_address = address;
     end

     case (LUT_address)
       8'b0: 8'sd0;
       8'b1: -8'sd707;
       8'b10: 8'sd1000;
       8'b11: -8'sd707;
       8'b100: 8'sd0;
       8'b101: 8'sd707;
       8'b110: -8'sd1000;
       8'b111: 8'sd707;
       8'b1000: 8'sd0;
       8'b1001: -8'sd707;
       8'b1010: 8'sd1000;
       8'b1011: -8'sd707;
       8'b1100: 8'sd0;
       8'b1101: 8'sd707;
       8'b1110: -8'sd1000;
       8'b1111: 8'sd707;
       8'b10000: 8'sd0;
       8'b10001: -8'sd707;
       8'b10010: 8'sd1000;
       8'b10011: -8'sd707;
       8'b10100: 8'sd0;
       8'b10101: 8'sd707;
       8'b10110: -8'sd1000;
       8'b10111: 8'sd707;
       8'b11000: 8'sd0;
       8'b11001: -8'sd707;
       8'b11010: 8'sd1000;
       8'b11011: -8'sd707;
       8'b11100: 8'sd0;
       8'b11101: 8'sd707;
       8'b11110: -8'sd1000;
       8'b11111: 8'sd707;
       8'b100000: 8'sd0;
       8'b100001: -8'sd707;
       8'b100010: 8'sd1000;
       8'b100011: -8'sd707;
       8'b100100: 8'sd0;
       8'b100101: 8'sd707;
       8'b100110: -8'sd1000;
       8'b100111: 8'sd707;
       8'b101000: 8'sd0;
       8'b101001: -8'sd707;
       8'b101010: 8'sd1000;
       8'b101011: -8'sd707;
       8'b101100: 8'sd0;
       8'b101101: 8'sd707;
       8'b101110: -8'sd1000;
       8'b101111: 8'sd707;
       8'b110000: 8'sd0;
       8'b110001: -8'sd707;
       8'b110010: 8'sd1000;
       8'b110011: -8'sd707;
       8'b110100: 8'sd0;
       8'b110101: 8'sd707;
       8'b110110: -8'sd1000;
       8'b110111: 8'sd707;
       8'b111000: 8'sd0;
       8'b111001: -8'sd707;
       8'b111010: 8'sd1000;
       8'b111011: -8'sd707;
       8'b111100: 8'sd0;
       8'b111101: 8'sd707;
       8'b111110: -8'sd1000;
       8'b111111: 8'sd707;
     endcase // case (address)

endmodule; // sin_lookup
