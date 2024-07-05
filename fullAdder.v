module fullAdder (
	input wire a,
   input wire b,
   input wire cin,
   output wire cout,
   output wire s
   );
	
   wire xor0,and0,and1;
	
	assign xor0 = a ^ b;
	assign s    = xor0 ^ cin;
	assign and0 = a & b;
	assign and1 = xor0 & cin;
	assign cout = and0 | and1;
	
endmodule