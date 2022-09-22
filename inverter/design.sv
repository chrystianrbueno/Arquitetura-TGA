/*module minverter (cin, a, b, y, z,);
	input cin, a, b;
    output y, z;
	
  	xor U1 (y, cin, a);
	xor U2 (z, ~cin, b);
endmodule*/
module inverter (cin, a, b, y, z,);
 input cin, a, b;
 output y, z;
  
  assign y = cin ^ a;
  assign z = ~cin ^ b;
  
endmodule