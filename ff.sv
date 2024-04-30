module ff_reference #(
    parameter WIDTH = 4
) (
    input logic clk, 
    input logic rst,
    input logic [WIDTH-1:0] data_i,
    output logic [WIDTH-1:0] data_o
);
    logic [WIDTH-1:0] data_d, data_q; 
    logic [WIDTH-1:0] data_0_d, data_0_q; 
    logic [WIDTH-1:0] data_1_d, data_1_q; 


    assign data_o = data_1_q;


    always_comb begin
        data_d = data_i; 
        data_0_d = data_q;
        data_1_d = data_0_q; 
    end


    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_q <= '0; 
            data_0_q <= '0; 
            data_1_q <= '0; 
        end else begin
            data_q <= data_d; 
            data_0_q <= data_0_d; 
            data_1_q <= data_1_d; 
        end
    end
endmodule
