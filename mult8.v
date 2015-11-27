module mult8(
    output done,
    output reg [7:0] product,
    input [7:0] A,
    input [7:0] B,
    input clk,
    input start);
    
    reg [4:0] multcounter; // counter for number of shift/adds
    reg [7:0] shiftB; // shift register for B
    reg [7:0] shiftA; // shift register for A
    wire adden; // enable addition
    
    assign adden = shiftB[7] & !done;
    assign done = multcounter[3];
    
    always @(posedge clk) begin
        // increment multiply counter for shift/add ops
        if(start) multcounter <= 0;
        else if(!done) multcounter <= multcounter + 1;
        
        // shift register for B
        if(start) shiftB <= B;
        else shiftB[7:0] <= {shiftB[6:0], 1'b0};
        
        // shift register for A
        if(start) shiftA <= A;
        else shiftA[7:0] <= {shiftA[7], shiftA[7:1]};
        
        // calculate multiplication
        if(start) product <= 0;
        else if(adden) product <= product + shiftA;
    end
endmodule