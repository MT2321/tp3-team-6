//Clock
`timescale 100us / 100us
//El primer valor indica la cantidad que espera el modulo dado que
// se lo llama #1 y la segunda indica que no va a haber un tiempo
// de espera menor a el.
module clock_gen(clk);

parameter PERIOD = 10;

output reg clk;
	 
always
	begin: CLOCK_DRIVER
		clk <= 1'b0;
		#(PERIOD/2);
		clk <= 1'b1;
		#(PERIOD/2);
	end
endmodule