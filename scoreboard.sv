//-------------------------------------------------------------------------
//						www.verificationguide.com
//-------------------------------------------------------------------------
//gets the packet from monitor, Generated the expected result and compares with the //actual result recived from Monitor
//`include "transaction3.sv"
import P::transaction;

class scoreboard;
   
  //creating mailbox handle
  mailbox mon2scb;
  
  //used to count the number of transactions
  int no_transactions;
  
  //constructor
  function new(mailbox mon2scb);
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
  endfunction
  
  //Compares the Actual result with the expected result
  task main;
    transaction trans;
    forever begin
      mon2scb.get(trans);
      
        case(trans.operator)
          00: if((trans.a+trans.b) == trans.c)
                $display("Result is as Expected");
              else
                $error("Wrong Result.\n\tExpeced: %0d Actual: %0d",(trans.a+trans.b),trans.c);
          
          01: if((trans.a - trans.b) == trans.c)
                $display("Result is as Expected");
              else
                $error("Wrong Result.\n\tExpeced: %0d Actual: %0d",(trans.a - trans.b),trans.c);

          10: if((trans.a * trans.b) == trans.c)
                $display("Result is as Expected");
              else
                $error("Wrong Result.\n\tExpeced: %0d Actual: %0d",(trans.a * trans.b),trans.c);

          11: if((trans.a / trans.b) == trans.c)
                $display("Result is as Expected");
              else
                $error("Wrong Result.\n\tExpeced: %0d Actual: %0d",(trans.a / trans.b),trans.c);  
        endcase

        no_transactions++;
        trans.display("[ Scoreboard ]");

    end
  endtask
  
endclass
