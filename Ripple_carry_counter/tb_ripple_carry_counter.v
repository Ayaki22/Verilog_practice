module ripple_carry_counter_tb;
  reg d_clk;
  reg d_reset;
  wire [3:0] c_q;

  // Instantiate the ripple carry counter
  ripple_carry_counter uut (
    .q(c_q),
    .clk(d_clk),
    .reset(d_reset)
  );

  // Generate clock with period of 10 time units
  initial begin
    d_clk = 0;
    forever #5 d_clk = ~d_clk;
  end

  // Generate reset signal
  initial begin
    // Initialize reset
    d_reset = 1;
    #15 d_reset = 0;  // Reset goes low at time 15
    #180 d_reset = 1; // Reset goes high again at time 195
    #10 d_reset = 0;  // Reset goes low again at time 205
    #50 $finish;      // End simulation at time 255
  end

  // Monitor signals
  initial begin
    $monitor("Time: %0t, d_clk: %b, d_reset: %b, c_q: %b", $time, d_clk, d_reset, c_q);
  end
endmodule
