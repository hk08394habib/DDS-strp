`timescale 1us/1us

module test_counter();
   reg clk = 1'b0;
   reg reset = 1'b0;
   wire [3:0] phase_acc = 4'b0;

   phase_acc phase_acc_DUT(.clk(clk),
                           .mult(2),
                           .reset(reset),
                           .phase_acc(phase_acc));

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
      $monitor("[$monitor] time=%0t, phase_acc=%0d \n", $time, phase_acc_DUT.phase_acc);
   end

endmodule; // test_counter
