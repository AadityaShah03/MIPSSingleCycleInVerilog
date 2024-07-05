module mux8to1 (
   input wire sel0,
   input wire sel1,
   input wire sel2,
   input wire in0,
   input wire in1,
   input wire in2,
   input wire in3,
   input wire in4,
   input wire in5,
   input wire in6,
   input wire in7,
   output wire y
   );
	
	wire and0,and1,and2,and3,and4,and5,and6,and7;
	
   assign and0 = in0 & (~sel2 & ~sel1 & ~sel0);
   assign and1 = in1 & (~sel2 & ~sel1 & sel0);
   assign and2 = in2 & (~sel2 & sel1 & ~sel0);
   assign and3 = in3 & (~sel2 & sel1 & sel0);
   assign and4 = in4 & (sel2 & ~sel1 & ~sel0);
   assign and5 = in5 & (sel2 & ~sel1 & sel0);
   assign and6 = in6 & (sel2 & sel1 & ~sel0);
   assign and7 = in7 & (sel2 & sel1 & sel0);
	
	assign y = and0 | and1 | and2 | and3 | and4 | and5 | and6 | and7;
	
endmodule