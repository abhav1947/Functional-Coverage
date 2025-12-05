module eg();
  
  bit [7:0] x;
  bit [3:0] y;
  
  covergroup cg;
    option.per_instance = 1;
    
    X : coverpoint x{
      option.auto_bin_max = 256;
    }
    Y : coverpoint y;
  endgroup
  
  initial begin: B1
    cg c = new();
    
    repeat(300) begin: B2
      {x, y} = $urandom();
      c.sample();
    end: B2
  end: B1
  
  initial begin: B3
    #500;
    $stop();
  end: B3

endmodule
