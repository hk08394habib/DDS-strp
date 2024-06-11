`timescale 1us/1us


module test_counter();

   reg clk = 1'b0;
   reg reset = 1'b0;
   wire [3:0] count_out = 4'b0;

   counter counter_DUT(.clk(clk),
                       .reset(reset),
                       .count_out(count_out));

   initial begin
      clk = 1'b0;
      forever #1 clk = ~clk;
   end

   initial begin
      $dumpfile("counter.vcd");
      $dumpvars();
      #30
      $finish();
   end

   always @(*) begin
      $monitor("[$monitor] time=%0t, count=0x%0h \n", $time, counter_DUT.count_out);
   end

endmodule; // test_counter
