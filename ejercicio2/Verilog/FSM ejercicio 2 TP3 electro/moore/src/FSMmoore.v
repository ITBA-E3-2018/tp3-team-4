module FSMmoore(clk,reset,w,out);
	input clk,resetn,w:
	output out;
	reg [3:1] y, Y;
	parameter [3:1] A=3’b000, B=3b001, C=3’b011, D=3’b010, E=3’b110;

// comportamiento de estado a estado
always @(w or y)
	case(y)
		A: if(w) y<=B;
		    else y<=A;
		B: if(w) y<=C;
		    else y<=A;
		C: if(w) y<=A;
		    else y<=D;
		D: if(w) y<=E;
		    else y<=A;
		E: if(w) y<=C;
		    else y<=A;
		default:Y=3’bxxx;
	endcase

//bloque secuencial

always @(posedge clk or negedge resetn)
	if(resetn==0) y<=A; // si hubo reset, el siguiente estado va a ser A
	else y<=Y; // si no hubo reset, actualizo el estado

assign out=(y==E); // conecto un cable desde un comprador del estado actual y el “estado E” a la salida

endmodule


	
	
	