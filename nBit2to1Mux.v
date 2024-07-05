module nBit2to1Mux #(
	parameter integer n = 8
)(
	input wire sel,
	input wire [n-1:0] in0,
	input wire [n-1:0] in1,
	output wire [n-1:0] y
);

	genvar i;
   generate for (i = 0; i < n; i = i + 1) begin : mux_instance
      mux2to1 mux_inst (
			.sel(sel),
			.in0(in0[i]),
			.in1(in1[i]),
			.out(y[i])
      );
      end
   endgenerate

endmodule