
module or_gate_bit (input a, b,
               output cout);
  assign cout = a | b;
endmodule


module or_gate_2bit (input [1:0] a, b,
                output [1:0] cout);
  or_gate_bit og1 (a[0:0], b[0:0], cout[0:0]);
  or_gate_bit og2 (a[1:1], b[1:1], cout[1:1]);
  
endmodule

module or_gate_4bit (input [3:0] a, b,
                     output [3:0] cout);
  or_gate_2bit og1 (a[1:0], b[1:0], cout[1:0]);
  or_gate_2bit og2 (a[3:2], b[3:2], cout[3:2]);
endmodule

module or_gate_8bit (input [7:0] a, b,
                     output [7:0] cout);
  or_gate_4bit og1 (a[3:0], b[3:0], cout[3:0]);
  or_gate_4bit og2 (a[7:4], b[7:4], cout[7:4]);
endmodule
