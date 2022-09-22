module testbench();
  
  reg a, b;
  wire y;
  or_gate_bit og1(a, b, y);
  
  initial begin
    a = 1'b1;
    b = 1'b1;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);
    
    a = 0'b1;
    b = 0'b1;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);
    
    a = 0'b1;
    b = 1'b1;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);
    
    a = 1'b1;
    b = 0'b1;
    $display("a=%b b=%b", a, b);
    #1
    $display("cout=%b", y);
  end
  
endmodule