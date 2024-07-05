module MIPSRegisterFile (
	input wire[7:0] inData,
	input wire[4:0] inAddr,
	input wire we,
	input wire clk,
	input wire rst,
	input wire [4:0] readReg1in,
	input wire [4:0] readReg2in,
	output wire[7:0]  readReg1,
	output wire[7:0]  readReg2
);

	wire [7:0] decode,reg0out,reg1out,reg2out,reg3out,reg4out,reg5out,reg6out,reg7out;
	
	decoder3to8 loadSignalGen (
		.en(we),
		.sel0(inAddr[0]),
		.sel1(inAddr[1]),
		.sel2(inAddr[2]),
		.out0(decode[0]),
		.out1(decode[1]),
		.out2(decode[2]),
		.out3(decode[3]),
		.out4(decode[4]),
		.out5(decode[5]),
		.out6(decode[6]),
		.out7(decode[7])
   );
	

	nBitDReg #(.n(8)) r0 (
		.inData(inData),
		.en(decode[0]),
		.clk(clk),
		.rst(rst),
		.q(reg0out),
		.q_not()
	);
	
	nBitDReg #(.n(8)) r1 (
		.inData(inData),
		.en(decode[1]),
		.clk(clk),
		.rst(rst),
		.q(reg1out),
		.q_not()
	);
	
	nBitDReg #(.n(8)) r2 (
		.inData(inData),
		.en(decode[2]),
		.clk(clk),
		.rst(rst),
		.q(reg2out),
		.q_not()
	);
	
	nBitDReg #(.n(8)) r3 (
		.inData(inData),
		.en(decode[3]),
		.clk(clk),
		.rst(rst),
		.q(reg3out),
		.q_not()
	);
	
	nBitDReg #(.n(8)) r4 (
		.inData(inData),
		.en(decode[4]),
		.clk(clk),
		.rst(rst),
		.q(reg4out),
		.q_not()
	);
	
	nBitDReg #(.n(8)) r5 (
		.inData(inData),
		.en(decode[5]),
		.clk(clk),
		.rst(rst),
		.q(reg5out),
		.q_not()
	);
	
	nBitDReg #(.n(8)) r6 (
		.inData(inData),
		.en(decode[6]),
		.clk(clk),
		.rst(rst),
		.q(reg6out),
		.q_not()
	);
	
	nBitDReg #(.n(8)) r7 (
		.inData(inData),
		.en(decode[7]),
		.clk(clk),
		.rst(rst),
		.q(reg7out),
		.q_not()
	);
	
	nBit8to1Mux #(.n(8))read1Mux(
		.sel0(readReg1in[0]),
		.sel1(readReg1in[1]),
		.sel2(readReg1in[2]),
		.in0(reg0out),
		.in1(reg1out),
		.in2(reg2out),
		.in3(reg3out),
		.in4(reg4out),
		.in5(reg5out),
		.in6(reg6out),
		.in7(reg7out),
		.y(readReg1)
	);
	
	nBit8to1Mux #(.n(8))read2Mux(
		.sel0(readReg2in[0]),
		.sel1(readReg2in[1]),
		.sel2(readReg2in[2]),
		.in0(reg0out),
		.in1(reg1out),
		.in2(reg2out),
		.in3(reg3out),
		.in4(reg4out),
		.in5(reg5out),
		.in6(reg6out),
		.in7(reg7out),
		.y(readReg2)
	);

endmodule