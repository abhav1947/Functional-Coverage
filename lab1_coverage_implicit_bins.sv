module eg();
  
  bit [3:0] x;
  bit [3:0] y;
  
  covergroup cg;
    option.per_instance = 1;
    
    X : coverpoint x;
    Y : coverpoint y;
  endgroup
  
  initial begin: B1
    cg c = new();
    
    repeat(100) begin: B2
      {x, y} = $urandom();
      c.sample();
    end: B2
  end: B1
  
  initial begin: B3
    #500;
    $stop();
  end: B3

endmodule
