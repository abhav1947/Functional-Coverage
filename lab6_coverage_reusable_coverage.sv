module eg;
  
  logic [3:0] mode;
  
  covergroup cg(
    input logic [3:0] var_name,
    input int lower, higher,
    input string inst_name);
    
    option.per_instance = 1;
    option.name = inst_name;
    
    C1: coverpoint var_name{
      bins b[] = {[lower:higher]};
    }
    
  endgroup
    
    cg cg1, cg2, cg3, cg4;
    
    initial begin
      cg1 = new(mode,0,3,"Arithmetic_op");
      cg2 = new(mode,4,7,"Logical_op");
      cg3 = new(mode,8,11,"Shift_op");
      cg4 = new(mode,12,15,"Jump_op");
      
      repeat(50) begin
        mode = $urandom();
        cg1.sample();
        cg2.sample();
        cg3.sample();
        cg4.sample();
      end
    end
  
endmodule
