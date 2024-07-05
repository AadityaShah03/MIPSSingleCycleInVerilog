module enardff(
	input wire d,
	input wire clk,
	input wire rst,
	input wire en,
	output reg q,
	output wire q_not
);
	
	always @(posedge clk or posedge rst)
	
	begin
	
		if (rst)
			q <= 1'b0;
		else if (en)
			q <= d;
	end
	
	assign q_not = ~q;
	
endmodule