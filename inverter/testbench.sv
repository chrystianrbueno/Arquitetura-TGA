module mio_somador_testbench();
	reg  cin, a, b;
	wire y, z;
 
	inverter dut(cin, a, b,  y, z,);
 
	initial
		begin
           
          
          cin = 1'b1; a = 1'b0; b = 1'b0; #1;
          $display(y,z);
          
          
          cin = 1'b1; a = 1'b1; b = 1'b0; #1;
          $display(y,z);
          
          
          cin = 1'b0; a = 1'b0; b = 1'b1; #1;
          $display(y,z);
          

          cin = 1'b0; a = 1'b0; b = 1'b0; #1;
          $display(y,z);
          
    
  end
  
endmodule