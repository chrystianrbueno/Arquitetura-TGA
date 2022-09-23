module full_adder_bit (input a, b, cin,
                       output s, cout);
  wire w1, w2, w3;
  xor U1 (w1,a,b);
  and U2 (w2,a,b);
  xor U3 (s,w1,cin);
  and U4 (w3,w1,cin);
  or U5 (cout,w2,w3);
endmodule

module full_adder (input [7:0] a, b,
                   input cin,
                   output [7:0] s,
                   output cout);
  wire [6:0] carry;
  full_adder_bit fa1 (a[0:0], b[0:0], cin, s[0:0], carry[0:0]);
  full_adder_bit fa2 (a[1:1], b[1:1], carry[0:0], s[1:1], carry[1:1]);
  full_adder_bit fa3 (a[2:2], b[2:2], carry[1:1], s[2:2], carry[2:2]);
  full_adder_bit fa4 (a[3:3], b[3:3], carry[2:2], s[3:3], carry[3:3]);
  full_adder_bit fa5 (a[4:4], b[4:4], carry[3:3], s[4:4], carry[4:4]);
  full_adder_bit fa6 (a[5:5], b[5:5], carry[4:4], s[5:5], carry[5:5]);
  full_adder_bit fa7 (a[6:6], b[6:6], carry[5:5], s[6:6], carry[6:6]);
  full_adder_bit fa8 (a[7:7], b[7:7], carry[6:6], s[7:7], cout);
endmodule