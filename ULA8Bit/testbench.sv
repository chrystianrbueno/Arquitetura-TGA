module ula8bit ();
  reg [7:0] a, b;
  wire [7:0] s, x, y, z;
  wire cout;

  full_adder_subtrator sub (a, b, 1, s, cout);
  full_adder_subtrator sum (a, b, 0, x, cout);
  and_gate_8bit ag8(a, b, y);
  or_gate_8bit og4(a, b, z);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("Subtrator");
    a = 1'b0; b = 1'b0; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, s, a, b, s);
    a = 2'b10; b = 2'b01; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, s, a, b, s);
    a = 8; b = 4; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, s, a, b, s);
    a = 4'b1011; b = 4'b0110; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, s, a, b, s);
    a = 64; b = 32; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, s, a, b, s);
    a = 8'b01101011; b = 8'b01010110; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, s, a, b, s);
    
    $display("Somador");
    a = 1'b0; b = 1'b0; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, x);
    a = 2'b01; b = 2'b10; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, x);
    a = 4; b = 8; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, x);
    a = 4'b0110; b = 4'b1011; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, x);
    a = 32; b = 64; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, x);
    a = 8'b01010110; b = 8'b01101011; #10; $display("%b + %b = %b %d + %d = %d", a, b, s, a, b, x);   

    $display("AND");
    a = 8'b10101010;
    b = 8'b00000000;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);
    a = 8'b00000000;
    b = 8'b00000000;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);
    a = 8'b10101010;
    b = 8'b10101010;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);
    a = 8'b11111111;
    b = 8'b11111111;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);
    a = 8'b10101010;
    b = 8'b01010101;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);

    $display("OR");
    a = 8'b10101010;
    b = 8'b00000000;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", z);
    a = 8'b00000000;
    b = 8'b00000000;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", z);
    a = 8'b10101010;
    b = 8'b10101010;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", z);
    a = 8'b11111111;
    b = 8'b11111111;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", z);
    a = 8'b10101010;
    b = 8'b01010101;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", z);
    
  end
endmodule