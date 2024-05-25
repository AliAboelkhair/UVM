import P::transaction;
class driver;

  int no_transactions;
  
  virtual intf vif;
  
  mailbox gen2driv;
  
  //constructor
  function new(virtual intf vif,mailbox gen2driv);
    //getting the interface
    this.vif = vif;
    //getting the mailbox handles from  environment 
    this.gen2driv = gen2driv;
  endfunction
  task reset;
    wait(vif.reset);
    $display("[ DRIVER ] ----- Reset Started -----");
    vif.a <= 0;
    vif.b <= 0;
    vif.operator <= 0;
    wait(!vif.reset);
    $display("[ DRIVER ] ----- Reset Ended   -----");
  endtask
  task main;
    forever begin
      transaction trans;
      gen2driv.get(trans);
      @(posedge vif.clk);
      vif.operator <= trans.operator;
      vif.a     <= trans.a;
      vif.b     <= trans.b;
      @(posedge vif.clk);
      trans.c   = vif.c;
      @(posedge vif.clk);
      trans.display("[ Driver ]");
      no_transactions++;
    end
  endtask
  
endclass
