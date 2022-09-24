module mio_somador_testbench();
	reg [7:0] a;
	wire 7:0] result;
 
    inverter1bit dut(a, result);
 
    initial begin
           
          
    $display("INVERTER A");
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
