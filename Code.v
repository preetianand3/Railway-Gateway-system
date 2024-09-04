module again(out, pins, clk, dir);
output [3:0]out;
output [1:0]pins;
input clk, dir;
reg [3:0]out;
reg [3:0]t = 4'b0111;
reg [1:0]pins;

wire clk1;
clk_divider x(clk1, clk);
always @(posedge clk1)
begin 
pins=dir;
	if(dir==1)	
		t ={t[0], t[3], t[2], t[1]};
	else
		t ={t[2], t[1], t[0], t[3]};
out = t;
end 

endmodule
module clk_divider(clk1, clk);
input clk;
output clk1;
reg [26:0] temp;
initial begin 
	temp = 26'd0;
end
always@(posedge clk)
	begin 
		temp = temp +1'b1;
	end
	assign clk1=temp[15];
endmodule
