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