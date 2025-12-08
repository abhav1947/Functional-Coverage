module eg;
  logic [3:0] x =0;
  logic clk = 1'b0;
  
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    option.per_instance = 1;
    X1: coverpoint x;
  endgroup
  
  cg c_h;
  
  initial begin
    c_h = new();
    
    c_h.sample();
    repeat(100) begin
      @(posedge clk);
      x = $urandom;
    end
  end
  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #600 
  $finish;
end
endmodule
  
