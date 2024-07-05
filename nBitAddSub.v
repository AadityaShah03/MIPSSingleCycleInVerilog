module nBitAddSub #(
	parameter integer n = 8
	)(
	input wire [n-1:0] a,
   input wire [n-1:0] b,
   input wire subOrCin,
   output wire cout,
   output wire overflow,
   output wire [n-1:0] s
   );
	
   wire [n-1:0] intCin;
	
	fullAdder fa0 (
		.a(a[0]),
		.b(b[0] ^ subOrCin),
		.cin(subOrCin),
		.cout(intCin[0]),
		.s(s[0])
   );
	
	genvar i;
	
	generate for(i=1;i<n;i = i +1)begin: full_adder_gen
		
		fullAdder fa_inst (
			.a(a[i]),
			.b(b[i] ^ subOrCin),
			.cin(intCin[i-1]),
			.cout(intCin[i]),
			.s(s[i])
		);
		
		end
	
	endgenerate
	
	assign cout = intCin[n-1];
	assign overflow = intCin[n-1] ^ intCin[n-2];
	
endmodule