module nBit8to1Mux #(
	parameter integer n = 8
)(
	input wire sel0,
	input wire sel1,
	input wire sel2,
	input wire [n-1:0] in0,
	input wire [n-1:0] in1,
	input wire [n-1:0] in2,
	input wire [n-1:0] in3,
	input wire [n-1:0] in4,
	input wire [n-1:0] in5,
	input wire [n-1:0] in6,
	input wire [n-1:0] in7,
	output wire [n-1:0] y
);

	genvar i;
   generate for (i = 0; i < n; i = i + 1) begin : mux_instance
      mux8to1 mux_inst (
			.sel0(sel0),
			.sel1(sel1),
			.sel2(sel2),
			.in0(in0[i]),
			.in1(in1[i]),
			.in2(in2[i]),
			.in3(in3[i]),
			.in4(in4[i]),
			.in5(in5[i]),
			.in6(in6[i]),
			.in7(in7[i]),
			.y(y[i])
      );
      end
   endgenerate

endmodule