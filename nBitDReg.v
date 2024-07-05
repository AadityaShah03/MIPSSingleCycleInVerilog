module nBitDReg #(
	parameter integer n = 8
)(
	input wire[n-1:0] inData,
	input wire en,
	input wire clk,
	input wire rst,
	output wire[n-1:0]  q,
	output wire[n-1:0]  q_not
);

	genvar i;
	
	generate for(i = 0; i<n; i=i+1) begin:start_dff
		
		enardff dff_inst (
			.d(inData[i]),
			.clk(clk),
			.rst(rst),
			.en(en),
			.q(q[i]),
			.q_not(q_not[i])
		);
		
		end
	
	endgenerate

endmodule