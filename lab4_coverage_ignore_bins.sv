module eg;
  bit [3:0] a;
  
  covergroup cg;
    option.per_instance = 1;
    A1: coverpoint a {
      option.auto_bin_max = 16;
      ignore_bins b2 = {2};
      ignore_bins b3 = {3};
      ignore_bins b4 = {4};
      ignore_bins b5 = {5};
      bins b[] = {[6:$],1};
    }
  endgroup
  
  initial begin
    cg c1 = new();
    repeat(200) begin
      a = $urandom;
      c1.sample();
    end
  end
  
endmodule
