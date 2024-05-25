
module adder(
  input   clk,
  input   reset,
  input   [3:0] a	,
  input   [3:0] b	,
  input   [1:0] operator,
  output  [8:0] c); 
  

  localparam Add = 2'b00; 
  localparam Sub = 2'b01; 
  localparam Mult = 2'b10; 
  localparam Div  = 2'b11;
  
  reg [8:0] tmp_c;
  
  //Reset 
  always @(posedge reset) 
    tmp_c <= 0;
   
  // Waddition operation
  always @(posedge clk) 
    case (operator)
      Add: tmp_c <= a + b;
      Sub: tmp_c <= a - b;
      Mult: tmp_c <= a * b;
      Div: tmp_c <= a / b;
      default: tmp_c <= a + b;
    endcase
  
  assign c = tmp_c;

endmodule
