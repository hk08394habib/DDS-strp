// Copyright 2023 Efabless Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


module phase_acc (
                  input            clk,
                  input [19:0]     f_out,
                  input            reset,
                  output reg [7:0] phase_acc = 4'b0
                  );

   parameter                       f_clk = 1000000;

   always @(posedge clk) begin
      phase_acc <= phase_acc + f_clk/f_out; //e.g. if we want 500kHz, then each time we increment by 1Mhz/0.5Mhz = 2.
      if (phase_acc == (2**8 - 1 - f_clk/f_out))
        phase_acc <= 8'b0;
   end

   always @(negedge reset) begin
      phase_acc <= 8'b0;
   end

endmodule
