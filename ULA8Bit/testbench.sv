module ula8bit ();
  reg [7:0] a, b;
  reg [3:0] mode;
  wire [7:0] result;
  wire [1:0] y, z;

  ula ula(a, b, mode, result);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);

    $display("Somador");
    mode = 3'b000;
    a = 1'b0; b = 1'b0; #10; 
    $display("%b + %b = %b %d + %d = %d", a, b, result, a, b, result);
    a = 2'b01; b = 2'b10; #10; 
    $display("%b + %b = %b %d + %d = %d", a, b, result, a, b, result);
    a = 4; b = 8; #10; 
    $display("%b + %b = %b %d + %d = %d", a, b, result, a, b, result);
    a = 4'b0110; b = 4'b1011; #10; 
    $display("%b + %b = %b %d + %d = %d", a, b, result, a, b, result);
    a = 32; b = 64; #10; 
    $display("%b + %b = %b %d + %d = %d", a, b, result, a, b, result);
    a = 8'b01010110; b = 8'b01101011; #10; 
    $display("%b + %b = %b %d + %d = %d", a, b, result, a, b, result);  

    $display("Subtrator");
    mode = 3'b001;
    a = 1'b0; b = 1'b0; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, result, a, b, result);
    a = 2'b10; b = 2'b01; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, result, a, b, result);
    a = 8; b = 4; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, result, a, b, result);
    a = 4'b1011; b = 4'b0110; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, result, a, b, result);
    a = 64; b = 32; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, result, a, b, result);
    a = 8'b01101011; b = 8'b01010110; #10; 
    $display("%b - %b = %b %d - %d = %d", a, b, result, a, b, result);
    
    $display("AND");
    mode = 3'b010;
    a = 8'b10101010; b = 8'b00000000; #10
    $display("%b AND %b = %b", a, b, result);
    a = 8'b00000000; b = 8'b00000000; #10
    $display("%b AND %b = %b", a, b, result);
    a = 8'b10101010; b = 8'b10101010; #10
    $display("%b AND %b = %b", a, b, result);
    a = 8'b11111111; b = 8'b11111111; #10
    $display("%b AND %b = %b", a, b, result);
    a = 8'b10101010; b = 8'b01010101; #10
    $display("%b AND %b = %b", a, b, result);
    
    $display("OR");
    mode = 3'b011;
    a = 8'b10101010; b = 8'b00000000; #10
    $display("%b OR %b = %b", a, b, result);
    a = 8'b00000000; b = 8'b00000000; #10
    $display("%b OR %b = %b", a, b, result);
    a = 8'b10101010; b = 8'b10101010; #10
    $display("%b OR %b = %b", a, b, result);
    a = 8'b11111111; b = 8'b11111111; #10
    $display("%b OR %b = %b", a, b, result);
    a = 8'b10101010; b = 8'b01010101; #10
    $display("%b OR %b = %b", a, b, result);

    
    $display("INVERTER A");
    mode = 3'b100;
    a = 8'b00000000; #10
    $display("%b = %b", a, result);
    a = 8'b11111111; #10
    $display("%b = %b", a, result);
    a = 8'b10101101; #10
    $display("%b = %b", a, result);
    a = 8'b11010110; #10
    $display("%b = %b", a, result);
  end
endmodule
