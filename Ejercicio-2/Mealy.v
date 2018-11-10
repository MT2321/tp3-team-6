//This is the FSM without logic gates
module Mealy(Clock,Reset,z,w);
input Clock,Reset,w;
output reg z;
reg[2:1] y,Y;
//Estates of the FSM
parameter [2:1] Default=2'b00, A=2'b01,B=2'b10,C=2'b11;
//Next state combinational circuit and output combinational circuits
always@(w,y)
    case(y)
        Default:
            if(w == 1)
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
            if (w == 1) 
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
            if (w == 1) 
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
            if( w == 1)
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

//On here on there will be the definitions of every circuit used by the FSM

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

//The FSM given by the ecuations
module Real_Mealy(Clock,Reset,z,w);
input Clock,Reset,w;
output z;
wire y1,y2,Y1,Y2;
//Temporary wires
wire w_Neg,y1_Neg,y2_Neg,a,b,c,d,e,f;
//Internal connections
not(w_Neg,w);
not(y1_Neg,y1);
not(y2_Neg,y2);
flip_flop Flip_FlopD1(Clock,Reset,Y1,y1);
flip_flop Flip_FlopD2(Clock,Reset,Y2,y2);
//Y1
and(a,w,y1_Neg,y2_Neg);
and(b,w_Neg,y2,y1_Neg);
or(Y1,a,b);
//Y2
and(c,w,y1,y2_Neg);
and(d,w_Neg,y2,y1_Neg);
or(Y2,c,d);
//Next state combinational circuit and output combinational circuits
and(z,w,y1,y2);
endmodule
