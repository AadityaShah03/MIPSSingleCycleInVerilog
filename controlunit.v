module controlunit (
   input wire [5:0] instruction,
   output wire regdst,
   output wire alusrc,
   output wire memtoreg,
   output wire regwrite,
   output wire memread,
   output wire memwrite,
   output wire branch,
   output wire [1:0] aluopout,
   output wire jump,
   output wire bne
	);

   wire add;
   wire sub;
   wire andop;
   wire orop;
   wire lw;
   wire sw;
   wire beq;
   wire bneop;
   wire jumpop;
   wire slt;
   wire aluop1;
   wire aluop0;

   assign add = ~instruction[5] & ~instruction[4] & ~instruction[3] &
                ~instruction[2] & ~instruction[1] & ~instruction[0];

   assign sub = ~instruction[5] & ~instruction[4] & ~instruction[3] &
                ~instruction[2] & ~instruction[1] & instruction[0];

   assign andop = ~instruction[5] & ~instruction[4] & ~instruction[3] &
                  ~instruction[2] & instruction[1] & ~instruction[0];

   assign orop = ~instruction[5] & ~instruction[4] & ~instruction[3] &
                 ~instruction[2] & instruction[1] & instruction[0];

   assign lw = ~instruction[5] & ~instruction[4] & ~instruction[3] &
               instruction[2] & ~instruction[1] & ~instruction[0];

   assign sw = ~instruction[5] & ~instruction[4] & ~instruction[3] &
               instruction[2] & ~instruction[1] & instruction[0];

   assign beq = ~instruction[5] & ~instruction[4] & ~instruction[3] &
                instruction[2] & instruction[1] & ~instruction[0];

   assign bneop = ~instruction[5] & ~instruction[4] & ~instruction[3] &
                  instruction[2] & instruction[1] & instruction[0];

   assign jumpop = ~instruction[5] & ~instruction[4] & instruction[3] &
                   ~instruction[2] & ~instruction[1] & ~instruction[0];

   assign slt = ~instruction[5] & ~instruction[4] & instruction[3] &
                ~instruction[2] & ~instruction[1] & instruction[0];

   assign regdst = (add | sub | orop | andop | slt) & ~(lw | jumpop);
   assign alusrc = (lw | sw) & ~((add | sub | orop | andop | slt) | beq | bneop | jumpop);
   assign memtoreg = lw & ~((add | sub | orop | andop | slt) | jumpop);
   assign regwrite = (add | sub | orop | andop | slt | lw) & ~(beq | sw | bneop | jumpop);
   assign memread = lw & ~((add | sub | orop | andop | slt) | beq | bneop | sw | jumpop);
   assign memwrite = sw & ~((add | sub | orop | andop | slt) | beq | bneop | lw | jumpop);
   assign branch = beq & ~((add | sub | orop | andop | slt) | bneop | lw | sw | jumpop);

   assign aluop1 = (andop | orop | beq | bneop) & ~(add | sub | lw | sw | jumpop | slt);
   assign aluop0 = (sub | orop) & ~(add | beq | bneop | andop | lw | sw | jumpop | slt);

   assign aluopout[0] = aluop0;
   assign aluopout[1] = aluop1;

   assign bne = bneop & ~((add | sub | orop | andop | slt) | beq | sw | jumpop | lw);
   assign jump = jumpop;

endmodule
