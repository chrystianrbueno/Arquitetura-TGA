module subtrator ();
  reg [7:0] a, b;
  wire [7:0] s;
  wire cout;

  full_adder_subtrator fa (a, b, 1, s, cout);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
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
  end
endmodule