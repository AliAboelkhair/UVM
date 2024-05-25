//-------------------------------------------------------------------------
//						www.verificationguide.com 
//-------------------------------------------------------------------------
class transaction;
  
  //declaring the transaction items
  rand bit [3:0] a;
  rand bit [3:0] b;
  rand bit [1:0] operator;
  bit [8:0] c;

  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- a = %0d, b = %0d, opcode = %0d",a,b,operator);
    $display("- c = %0d",c);
    $display("-------------------------");
  endfunction
endclass

