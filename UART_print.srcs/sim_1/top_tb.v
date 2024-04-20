`timescale 1ns/1ns

module top_tb;

// Parameters
parameter PERIOD = 10;

// Declare signals
reg  		clk;
reg  		rst_n;
wire 		txp;

// Clock generation
initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
end

// Instantiate module
top top (
    .clk(clk),
    .rst_n(rst_n),
    .txp(txp)
);

// Stimulus generation
initial begin
    // Add your stimulus code here
    rst_n = 0;
    #(PERIOD*2) rst_n = 1;
end

// Monitor outputs
always @(posedge clk) begin
    // Add your output monitoring code here
end

endmodule
