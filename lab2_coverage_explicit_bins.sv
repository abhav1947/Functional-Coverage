module eg();
  
  bit [3:0] x;
  bit [3:0] y;
  
  covergroup cg;
    option.per_instance = 1;
    
    X : coverpoint x{
      bins x0 = {0};
      bins x1 = {[0:$]};
      bins x2 = {1,2,3};
      bins x3 = {[$:6]};
      bins x4 = {[$:$]};
      bins x5[] = {[$:$]}; 
    }
    Y : coverpoint y{
      bins y0 = {0,1,2,3};
      bins y1[] = {4,5,6,7};
      bins y2[] = {[8:$]};
    }
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
