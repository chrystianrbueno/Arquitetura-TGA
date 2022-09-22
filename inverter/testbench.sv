`timescale 1ns / 1ps

module testbench();
  
  reg a1;
  wire y1;
  inverter inv1(a1, y1);
  
  initial begin
    a1 = 1'b1;

    $display("a=%b",a1);
    #1
    $display("y=%b",y1);
    
    a1 = 0'b1;

    $display("a=%b",a1);
    #1
    $display("y=%b",y1);
    
    
  end
  
endmodule