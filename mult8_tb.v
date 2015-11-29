`timescale 1ns / 1ns
module mult8_tb();

wire [7:0] product;
wire done;
reg start = 0;
reg [7:0] A,B = 0;

//Toggle clock
reg clk;
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    repeat(10) @(posedge clk)
    A = 3;
    B = 5;
    
    start = 1;
    repeat(3) @(posedge clk)
    start = 0;
    wait(done);
    
    
    repeat(10) @(posedge clk)
    A = 33;
    B = 4;
    
    start = 1;
    repeat(3) @(posedge clk)
    start = 0;
    wait(done);
    
    
end

//portion for the test branch
initial begin
    
    #1000 $stop;
    #10 $finish;

end



mult8 DUT(.A(A), .B(B), .clk(clk), 
    .product(product), .start(start),.done(done));

endmodule


    