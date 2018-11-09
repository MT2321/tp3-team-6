//Reset
`timescale 100us / 100us
//El primer valor indica la cantidad que espera el modulo dado que
// se lo llama #1 y la segunda indica que no va a haber un tiempo
// de espera menor a el.
module reset_gen(reset);

parameter PERIOD = 10;

output reg reset;
	 
    initial
    begin
        reset = 1'b1;
        #PERIOD;
        reset <= 1'b0;
        #PERIOD;
    end

endmodule