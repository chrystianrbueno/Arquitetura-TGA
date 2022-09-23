module exercise3 ();
  reg [7:0] a, b;
  wire [7:0] s;
  wire cout;

  full_adder fa (a, b, 0, s, cout);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    a = 1'b0; b = 1'b0; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, s);
    a = 2'b01; b = 2'b10; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, s);
    a = 4; b = 8; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, s);
    a = 4'b0110; b = 4'b1011; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, s);
    a = 32; b = 64; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, s);
    a = 8'b01010110; b = 8'b01101011; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, s);    
  end
endmodule