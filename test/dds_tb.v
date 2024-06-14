module dds_tb();

   reg clk = 1'b0;
   reg reset = 1'b0;
   wire [7:0] phase_acc;

   wire [7:0] output_sin;

   phase_acc phase_acc_DUT(.clk(clk),
                           .mult(8'd16),
                           .reset(reset),
                           .phase_acc(phase_acc));

   sin_lookup sin_lookup_DUT(.clk(clk),
                             .address(phase_acc),
                             .value(output_sin));


   initial begin
      //$monitor("phase=%0d sin=%0d\n", phase_acc_DUT.phase_acc, sin_lookup_DUT.value);
      $display("start");
      clk = 1'b0;
      forever #1 clk = ~clk;
   end

   initial begin
      $dumpfile("counter.vcd");
      $dumpvars();
      #600
      $display("finish");
      $finish();
   end

endmodule;
