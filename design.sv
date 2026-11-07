// Code your design here
module shift_register(
    input clk,
    input [1:0] mode,
    input [7:0] data,
    output reg [7:0] q
);

always @(posedge clk) begin
    case(mode)
        2'b00: q <= {1'b0, q[7:1]}; // Right shift
        2'b01: q <= {q[6:0], 1'b0}; // Left shift
        2'b10: q <= data;           // Parallel load
        2'b11: q <= q;              // Hold
    endcase
end

endmodule