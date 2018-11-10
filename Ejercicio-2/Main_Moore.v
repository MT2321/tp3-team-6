//Modulo encargado de ejecutar la FSM
module main;

// My signal definitions
    wire Reset,Clock,Signal;
    wire Output;
    reset_gen res_gen(Reset);
    clock_gen clk_gen(Clock);
    test_gen test(Signal);
    Real_Moore FSM(Clock,Reset,Output,Signal);
    initial begin
        #10;
        $finish;
    end
// Setup to allow us to pass an output path for $dumpfile
  reg dummy;
  reg[8*64:0] dumpfile_path = "output.vcd";
    
    initial begin
        dummy= $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,main);
    end

endmodule