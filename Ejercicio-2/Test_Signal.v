//This will be the signal that will test the FSM
`timescale 100us / 100us

module test_gen(test);

parameter PERIOD = 10;

output reg test;

    initial begin
        test=1'b1;
        #PERIOD;
        test<=1'b1;
        #PERIOD;
        test<=1'b1;
        #PERIOD;
        test<=1'b0;
        #PERIOD;
        test<=1'b1;
        #PERIOD;
        test<=1'b0;
        //Everything starts again
        #PERIOD;
        test<=1'b1;
    end

endmodule