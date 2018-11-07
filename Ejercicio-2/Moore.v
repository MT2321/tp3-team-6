module Moore (Clock,Reset,z,w):
input Clock,w;
output z;
reg[3:1] y,Y;
//Estates of the FSM
parameter [3:1] Default=3'b000, A=3'b001,B=3'b010,C=3'b011,D=3'b100;
//Next state combinational circuit
always@(w,y)    //It will only activate when w or y change
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
//Define sequential block
always(posedge Clock)   //It will react every time the clock rise
    if (Reset)
    y <= Default;
    else
    y <= Y;
//Define output
assign z= (y == D);
//This means that the exit will only be 1 when we are in the state D
endmodule