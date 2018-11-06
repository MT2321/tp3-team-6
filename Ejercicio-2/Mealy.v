module Mealy (Clock,z,w):
input Clock,w;
output z;
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
endmodule