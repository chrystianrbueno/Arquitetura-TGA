module inverter1bit (input a,
                     output y);
  
  assign y = ~a;
  
endmodule


module inverter_8bit (input [7:0] a,
                      output [7:0] y);
  inverter1bit ag1(a[0], y[0]);
  inverter1bit ag2(a[1], y[1]);
  inverter1bit ag3(a[2], y[2]);
  inverter1bit ag4(a[3], y[3]);
  inverter1bit ag5(a[4], y[4]);
  inverter1bit ag6(a[5], y[5]);
  inverter1bit ag7(a[6], y[6]);
  inverter1bit ag8(a[7], y[7]);
  
endmodule
