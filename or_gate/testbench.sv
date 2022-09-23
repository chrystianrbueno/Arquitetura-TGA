module testbench();
  
  reg [7:0] a, b;
  wire [7:0] y;
  or_gate_8bit og4(a, b, y);
  
  initial begin
    
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
    
  end
endmodule
