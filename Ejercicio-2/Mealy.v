module Mealy (Clock,Reset,z,w);
input Clock,Reset,w;
output reg z;
reg[2:1] y,Y;
//Estates of the FSM
parameter [2:1] Default=2'b00, A=2'b01,B=2'b10,C=2'b11;
//Next state combinational circuit and output combinational circuits
always@(w,y)
    case(y)
        Default:
            if(w)
                begin
                    z=0;
                    Y=A;
                end
            else
                begin
                    z=0;
                    Y=Default;
                end
        A:
            if (w) 
                begin
                    z=0;
                    Y=B;
                end
            else
                begin
                    z=0;
                    Y=Default;
                end
        B:
            if (w) 
                begin
                    z=0;
                    Y=Default;
                end
            else
                begin
                    z=0;
                    Y=C;
                end
        C:
            if(w)
                begin
                    z=1;
                    Y=Default;
                end
            else
                begin
                    z=0;
                    Y=Default;
                end
    endcase
// Define the sequential block
always @(posedge Reset, posedge Clock)
    if (Reset == 1) 
    y <= Default;
    else 
    y <= Y;
endmodule

//This is where the flip-flop D stars
module flip_flop(Clock,Reset,D,Q);
input D, Clock, Reset;
output reg Q;
always @(posedge Reset, posedge Clock)
    if (Reset == 1)
        Q <= 0;
    else
        Q <= D;
endmodule