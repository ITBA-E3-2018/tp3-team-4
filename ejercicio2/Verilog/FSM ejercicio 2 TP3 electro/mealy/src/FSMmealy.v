module FSMmealy(clk,resetn,w,out);
	input clk,resetn,w;
	output out;
	reg [2:1] y, Y, z;
	parameter [2:1] A=2'b00, B=2'b01, C=2'b11, D=2'b10;	//los estados se definen con menos bits porque hay uno menos
	
	//comportamiento estado a estado
	always @(w or y)
		case(y)
			A: if(w)
			begin
				out=0;
				Y<=B;
			end else 
			begin
				out=0;
				Y<=A;
			end
			
			B: if(w)
			begin
				out=0;
				Y<=C;
			end else 
			begin
				out=0;
				Y<=A;
			end
			
			C: if(w)
			begin
				out=0;
				Y<=C;
			end else 
			begin
				out=0;
				Y<=D;
			end
			
			D: if(w)
			begin
				out=1;
				Y<=B;
			end else 
			begin
				out=0;
				Y<=A;
			end

			default:
			begin
			out=0;
				Y<=2'bxx;
			end
		endcase
	
	//bloque secuencial
	always @(posedge clk or negedge resetn)
	if(resetn==0) y<=A;
	else y<=Y;

endmodule