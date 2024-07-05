module decoder3to8 (
	input wire en,
   input wire sel0,
   input wire sel1,
   input wire sel2,
   output wire out0,
   output wire out1,
   output wire out2,
   output wire out3,
   output wire out4,
   output wire out5,
   output wire out6,
   output wire out7
   );
	
   assign out0 = en & (~sel2 & ~sel1 & ~sel0);
   assign out1 = en & (~sel2 & ~sel1 & sel0);
   assign out2 = en & (~sel2 & sel1 & ~sel0);
   assign out3 = en & (~sel2 & sel1 & sel0);
   assign out4 = en & (sel2 & ~sel1 & ~sel0);
   assign out5 = en & (sel2 & ~sel1 & sel0);
   assign out6 = en & (sel2 & sel1 & ~sel0);
   assign out7 = en & (sel2 & sel1 & sel0);
	
endmodule