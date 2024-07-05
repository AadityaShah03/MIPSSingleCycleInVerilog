module mux4to1 (
   input wire sel0,
   input wire sel1,
   input wire in0,
   input wire in1,
   input wire in2,
   input wire in3,
   output wire y
   );
	
	wire and0,and1,and2,and3;
	
   assign and0 = in0 & (~sel1 & ~sel0);
   assign and1 = in1 & (~sel1 & sel0);
   assign and2 = in2 & (sel1 & ~sel0);
   assign and3 = in3 & (sel1 & sel0);
	
	assign y = and0 | and1 | and2 | and3;
	
endmodule