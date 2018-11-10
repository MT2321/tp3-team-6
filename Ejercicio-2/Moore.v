module Moore (Clock,Reset,z,w);
input Clock,Reset,w;
output reg z;
reg[3:1] y,Y;
//Estates of the FSM
parameter [3:1] Default=3'b000, A=3'b001,B=3'b010,C=3'b011,D=3'b100;
//Next state combinational circuit
always@(w,y)    //It will only activate when w or y change
    begin
        case (y)
            Default: 
                if (w)
                    Y=A;
                else
                    Y=Default;
            A:
                if(w)
                    Y=B;
                else
                    Y=Default;
            B:
                if(w)
                    Y=Default;
                else
                    Y=C;
            C:
                if(w)
                    Y=D;
                else
                    Y=Default;
            D:
                Y=Default;
        default:
            Y=2'bxx;
        endcase
        //Define output
        z = (y == D);
    end
//Define sequential block
always @(posedge Reset,posedge Clock)   //It will react every time the clock rise
    if (Reset == 1)
        y <= Default;
    else
        y <= Y;
//This means that the exit will only be 1 when we are in the state D
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

//The FSM given by the ecuations
module Real_Moore(Clock,Reset,z,w);
input Clock,Reset,w;
output z;
wire y1,y2,y3,Y1,Y2,Y3;
//Temporary wires
wire w_Neg,y1_Neg,y2_Neg,y3_Neg,a,b,c,d,e,f;
//Internal connections
not(w_Neg,w);
not(y1_Neg,y1);
not(y2_Neg,y2);
not(y3_Neg,y3);
flip_flop Flip_FlopD1(Clock,Reset,Y1,y1);
flip_flop Flip_FlopD2(Clock,Reset,Y2,y2);
flip_flop Flip_FlopD3(Clock,Reset,Y3,y3);
//Y1
and(a,w,y1_Neg,y2_Neg,y3_Neg);
and(b,w_Neg,y2,y1_Neg);
or(Y1,a,b);
//Y2
and(c,w,y1,y2_Neg);
and(d,w_Neg,y2,y1_Neg);
or(Y2,c,d);
//Y3
and(Y3,w,y1,y2);
//Next state combinational circuit and output combinational circuits
 assign z=y3;
endmodule