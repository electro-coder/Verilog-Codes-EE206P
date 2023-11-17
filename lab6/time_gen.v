module time_gen(clk, rst, second, minute, hour);
    
    output reg [6:0] second, minute, hour;
    input clk,rst;
    reg[24:0] count;
    reg clkn;
    
    always @(posedge clk or negedge rst)
    begin
    if(rst == 1'b1)begin
    count <=25'b0;
    clkn  <= 1'b0;
    end
    else
    begin
        if (count > 25'd25000000)
        begin
        count = 25'b0;
        clkn = ~clkn; 
        end
        else
        count <= count + 1'b1;     
    end
    end
   
    
    always @ (posedge clkn or posedge rst)
    begin
    if(rst == 1)
    begin
    second <= 0;
    minute <= 0;
    hour   <= 0;
    end
        else 
        begin
        if(second==59)
        begin
            second<= 0;
            if(minute == 59)
            begin 
                minute <= 0;
                if(hour == 23)
                hour <= 0;
                else 
                hour <= hour + 1'b1;
            end 
            else 
            minute <= minute + 1'b1;
        end
        else 
        second <= second + 1'b1;
        end
        end
endmodule
