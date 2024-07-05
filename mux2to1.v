module mux2to1 (
   input wire sel,
   input wire in0,
   input wire in1,
   output wire out
   );
   assign out = (sel) ? in1 : in0; 
	// Conditional assignment for 2-to-1 Mux
endmodule