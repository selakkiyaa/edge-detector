module edge_detector_tb;

    // Testbench signals
    reg clk;          // Clock signal
    reg rst;          // Reset signal
    reg in_sig;       // Input signal
    wire edge_out;    // Output signal (edge detected)

    // Instantiate the positive edge detector
    edge_detector uut (
        .clk(clk),
        .rst(rst),
        .in_sig(in_sig),
        .edge_out(edge_out)
    );

    // Clock generation (50 MHz clock)
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // Clock period = 20 ns
    end

    // Test stimulus
    initial begin
        // Initialize signals
        rst = 1;    // Assert reset
        in_sig = 0; // Initialize input signal
        #25 rst = 0;    // Deassert reset after 25 ns

        // Generate input signal transitions
        #30 in_sig = 1; // Rising edge at 55 ns
        #40 in_sig = 0; // Falling edge at 95 ns
        #20 in_sig = 1; // Rising edge at 115 ns
        #60 in_sig = 0; // Falling edge at 175 ns

        // End simulation
        #100 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | clk=%b | rst=%b | in_sig=%b | edge_out=%b", $time, clk, rst, in_sig, edge_out);
    end

endmodule
