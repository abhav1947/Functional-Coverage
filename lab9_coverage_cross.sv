module eg;
  
  logic wr_enb;
  logic clk = 0;
  logic [7:0] din;
  logic [3:0] addr;
  logic [7:0] dout;
  
  always #5 clk = ~clk;
  
  covergroup cg@(posedge clk);
    option.per_instance = 1;
    wr_en: coverpoint wr_enb{
      bins b0 = {0};
      bins b1 = {1};
    }
    addr_c: coverpoint addr;
    crs_wr_addr: cross wr_en, addr_c;
  endgroup
  
  covergroup cg2@(posedge clk or negedge clk);
    option.per_instance = 1;
    clk_tgl: coverpoint clk{
      bins c0 = {0};
      bins c1 = {1};
    }
  endgroup
  
  cg c1;
  cg2 c2;
  
  initial begin
    c1 = new();
    c2 = new();
    forever begin
      @(posedge clk);
      wr_enb = $urandom;
      addr = $urandom;
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #1000; 
    $finish;
  end
  
  
endmodule
