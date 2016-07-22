
// $ID: mg 147$
// File name: counter$  
// Author: Rishab Verma     $
// Lab Section: Friday 11 30$
// Description: $






module sync_low
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output wire sync_out
);

reg leave;
reg go;

always_ff @ (posedge clk, negedge n_rst) 
begin: FFL
	if(1'b0 == n_rst) 
	begin
		leave <= 0;
		go <= 0;
	end 

	else 
	begin
		leave <= async_in;
		go <= leave;
	end
end

assign sync_out = go;


endmodule

