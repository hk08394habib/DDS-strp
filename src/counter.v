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
                  input [7:0]      mult, //if we want to multiply 1khz by, say 10, we can do that.
                  input            reset,
                  output reg [7:0] phase_acc = 4'b0
                  );

   parameter                       f_clk = 1000000;

   always @(posedge clk) begin
      phase_acc <= phase_acc + mult;
      if (phase_acc != 0 && phase_acc < mult) //if we wrap around, and we get, say 1 or something instead of 0, then go back to 0. Shouldn't be an issue if you use powers of 2
        phase_acc <= 8'b0;
      if (phase_acc == 0)
        $display("starting");



   end

   always @(negedge reset) begin
      phase_acc <= 8'b0;
   end

endmodule
