// Code your testbench here
// or browse Examples
module tb;

reg clk;
reg [1:0] mode;
reg [7:0] data;
wire [7:0] q;

shift_register dut(clk, mode, data, q);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test sequence
initial begin

    // Parallel load
    mode = 2'b10;
    data = 8'b10101010;
    #10;

    // Right shift
    mode = 2'b00;
    #10;

    // Left shift
    mode = 2'b01;
    #10;

    // Hold
    mode = 2'b11;
    #10;

    // Random testing
    repeat(10) begin
        @(negedge clk);
        mode = $urandom_range(0,3);
        data = $urandom_range(0,255);
    end

    #10;
    $finish;
end

// Display output
initial begin
    $monitor("Time=%0t Mode=%b Data=%b Q=%b",
              $time, mode, data, q);
end
  // Waveform generation
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
end

endmodule