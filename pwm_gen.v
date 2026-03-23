`timescale 1ns/1ps

module pwm_gen(
    input clk,
    input rst,
    input [7:0] duty_cycle,
    output reg pwm_out
);
    reg [7:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            pwm_out <= 0;
        end
        else begin
            counter <= counter + 1;
            if (counter < duty_cycle)
                pwm_out <= 1;
            else
                pwm_out <= 0;
        end
    end
endmodule
