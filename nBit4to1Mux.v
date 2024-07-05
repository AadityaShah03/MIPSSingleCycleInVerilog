module nBit4to1Mux #(
	parameter integer n = 8
)(
	input wire sel0,
	input wire sel1,
	input wire [n-1:0] in0,
	input wire [n-1:0] in1,
	input wire [n-1:0] in2,
	input wire [n-1:0] in3,
	output wire [n-1:0] y
);

	genvar i;
   generate for (i = 0; i < n; i = i + 1) begin : mux_instance
      mux4to1 mux_inst (
			.sel0(sel0),
			.sel1(sel1),
			.in0(in0[i]),
			.in1(in1[i]),
			.in2(in2[i]),
			.in3(in3[i]),
			.y(y[i])
      );
      end
   endgenerate

endmodule