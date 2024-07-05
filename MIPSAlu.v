module MIPSAlu(
	input wire [7:0] a,
   input wire [7:0] b,
   input wire [1:0] aluop,
   output wire zero,
   output wire [7:0] s
   );
	
   wire [7:0] aluResult,andResult,orResult,intMuxOut;
	
	assign andResult = a & b;
	assign orResult = a | b;
	
	nBitAddSub #(.n(8))mainAlu(
		.a(a),
		.b(b),
		.subOrCin(~aluop[1] & aluop[0]),
		.cout(),
		.overflow(),
		.s(aluResult)
	);
	
	nBit4to1Mux #(.n(8))selMux(
		.sel0(aluop[0]),
		.sel1(aluop[1]),
		.in0(aluResult),
		.in1(aluResult),
		.in2(andResult),
		.in3(orResult),
		.y(intMuxOut)
	);
	
	assign s = intMuxOut;
	assign zero = ~(|intMuxOut);
	
endmodule