// $ID: $
// File name: moore.sv$  
// Author: Rishab Verma mg147$
// Lab Section: Friday 11 30 am $
// Description: Moore machine 1101 detector $


module mealy
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

parameter [1:0] startstate = 2'b00;
parameter [1:0] state1 = 2'b01;
parameter [1:0] state2 = 2'b10;
parameter [1:0] state3 = 2'b11;
reg [1:0] current;
reg [1:0] next;


always_ff @ (posedge clk, negedge n_rst)
begin

	if (n_rst == 0)
		current <= 2'b00;
	else
		current <= next;
end

always_comb 
begin
	next = current ;
	//set output to be zero for now 
	o=0;
	
	case(current)
		startstate:
			begin	
				if(i == 1)
					next = state1;
				else
					next = startstate;
			end

		state1:
			begin 
				if(i==1)
					next = state2;
				else
					next = startstate;
			end
		state2:
			begin
				if(i == 0)
					next = state3;
				else
					next = startstate;
			end	
	
		state3:
			begin
				if(i == 1)
					begin//out put is 1 here
						next = state1;
						o = 1;
					end	
				else
					next = startstate;
			end

		default:
			begin
				next = startstate;
			end
	endcase
end
			
							
endmodule
