module full_adder_subtrator_bit (input a, b, cin,
                       output s, cout);
  wire w1, w2, w3;
  xor U1 (w1,a,b);
  and U2 (w2,a,b);
  xor U3 (s,w1,cin);
  and U4 (w3,w1,cin);
  or U5 (cout,w2,w3);
endmodule

module full_adder_subtrator (input [7:0] a, b,
                   input cin,
                   output [7:0] s,
                   output cout);
  wire [6:0] carry;
  wire [7:0] bin;
  assign bin[0] = b[0]^cin;
  assign bin[1] = b[1]^cin;
  assign bin[2] = b[2]^cin;
  assign bin[3] = b[3]^cin;
  assign bin[4] = b[4]^cin;                          
  assign bin[5] = b[5]^cin;
  assign bin[6] = b[6]^cin;
  assign bin[7] = b[7]^cin;

  full_adder_subtrator_bit fa1 (a[0], bin[0], cin, s[0], carry[0]);
  full_adder_subtrator_bit fa2 (a[1], bin[1], carry[0], s[1], carry[1]);
  full_adder_subtrator_bit fa3 (a[2], bin[2], carry[1], s[2], carry[2]);
  full_adder_subtrator_bit fa4 (a[3], bin[3], carry[2], s[3], carry[3]);
  full_adder_subtrator_bit fa5 (a[4], bin[4], carry[3], s[4], carry[4]);
  full_adder_subtrator_bit fa6 (a[5], bin[5], carry[4], s[5], carry[5]);
  full_adder_subtrator_bit fa7 (a[6], bin[6], carry[5], s[6], carry[6]);
  full_adder_subtrator_bit fa8 (a[7], bin[7], carry[6], s[7], cout);
endmodule


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

module and_gate_bit (input a, b,
               output cout);
  assign cout = a & b;
endmodule


module and_gate_2bit (input [1:0] a, b,
                output [1:0] cout);
  and_gate_bit ag1 (a[0:0], b[0:0], cout[0:0]);
  and_gate_bit ag2 (a[1:1], b[1:1], cout[1:1]);
  
endmodule

module and_gate_4bit (input [3:0] a, b,
                     output [3:0] cout);
  and_gate_2bit ag1 (a[1:0], b[1:0], cout[1:0]);
  and_gate_2bit ag2 (a[3:2], b[3:2], cout[3:2]);
endmodule

module and_gate_8bit (input [7:0] a, b,
                     output [7:0] cout);
  and_gate_4bit ag1 (a[3:0], b[3:0], cout[3:0]);
  and_gate_4bit ag2 (a[7:4], b[7:4], cout[7:4]);
endmodule

module inverter1bit (input a,
                     output y);
  
  assign y = ~a;
  
endmodule


module inverter_8bit (input [7:0] a,
                      output [7:0] y);
  inverter1bit ag1(a[0], y[0]);
  inverter1bit ag2(a[1], y[1]);
  inverter1bit ag3(a[2], y[2]);
  inverter1bit ag4(a[3], y[3]);
  inverter1bit ag5(a[4], y[4]);
  inverter1bit ag6(a[5], y[5]);
  inverter1bit ag7(a[6], y[6]);
  inverter1bit ag8(a[7], y[7]);
  
endmodule

module ula (a, b, s, out);
  input [7:0] a, b;
  output reg [7:0] out;
  wire [7:0] adder_output, subt_output, and_output, or_output, invAA, invBB, inverter_outputA, inverter_outputB;
  input [3:0] s;
  wire cout;
  
  full_adder_subtrator sum (a, b, 0, adder_output, cout);
  full_adder_subtrator sub (a, b, 1, subt_output, cout);
  and_gate_8bit ag8(a, b, and_output);
  or_gate_8bit og8(a, b, or_output);
  inverter_8bit invA (a, inverter_outputA);

  always @(a or b or s)
    begin
      if (s == 3'b000)
        begin
          assign out = adder_output;
        end
      else if (s == 3'b001)
        begin
          assign out = subt_output;
        end
      else if (s == 3'b010)
        begin
          assign out = and_output;
        end
      else if (s == 3'b011)
        begin
          assign out = or_output;
        end
      else if (s == 3'b100)
        begin
          assign out = inverter_outputA;
        end
      else
        begin
          assign out = 8'b0;
        end
    end
endmodule
