`timescale 1ns / 1ps

module top(
    input       clk,
    input       rst_n,
    output wire txp
);

// Print Controll -------------------------------------------
`include "print.vh"
defparam tx.uart_freq = 115200;
defparam tx.clk_freq = 50_000_000;
assign print_clk = clk;
assign txp = uart_txp;

reg [23:0] cnt = 0;
always @(posedge clk) begin
    if (~rst_n)
        cnt <= 0;
    else begin
        cnt = cnt + 24'b1;
        if (cnt == 24'b1)
            `print("0123456789abcdef", STR);
    end
end
// Print Controll -------------------------------------------

endmodule
