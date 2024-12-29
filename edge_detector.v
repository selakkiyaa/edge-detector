module edge_detector (
    input wire clk,     
    input wire rst,     
    input wire in_sig,  
    output reg edge_out 
);

    reg in_sig_d;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            in_sig_d <= 1'b0; 
            edge_out <= 1'b0; 
        end else begin
            in_sig_d <= in_sig;                  
            edge_out <= in_sig & ~in_sig_d;      
        end
    end

endmodule
