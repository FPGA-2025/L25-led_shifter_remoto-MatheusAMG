module LedShifter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output  reg [7:0] leds
);

    localparam ONE_SECOND = CLK_FREQ;
    reg [31:0] counter;

    always @(posedge clk) begin
        if (!rst_n) begin
            leds <= 8'b00011111;
            counter <= 0;
        end
        if (counter >= ONE_SECOND - 1)begin
            counter <= 0;
            leds <= {leds[6:0], leds[7]};
        end
        else begin
            counter <= couter + 1;
        end
    end
    
endmodule
