`timescale 1ns / 1ns
module mult8_tb();

//Toggle clock
reg clk;
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

reg start = 0;
initial begin
    #100 start = 1;
    repeat(3) @(posedge clk)
        start = 0;
end


//Clear signal
reg sig = 0;
initial begin
    sig = 0;
    #350 sig = 1;
end

reg[7:0] a,b;
wire[15:0] dout;

mult8 DUT(.ina(a), .inb(b), .clk(clk), .sig(sig), .out(dout));

endmodule


    