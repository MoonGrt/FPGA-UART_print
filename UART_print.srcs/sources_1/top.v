`timescale 1ns / 1ps

module top(
    input       clk,
    input       rst_n,
    output wire txp
);

// Print Controll -------------------------------------------
`include "print.vh"
defparam tx.uart_freq=115200;
defparam tx.clk_freq=50_000_000;
assign print_clk = clk;
assign txp = uart_txp;

always@(posedge rst_n)begin
    `print("1234567890abcdef", STR);
end
// Print Controll -------------------------------------------

endmodule
