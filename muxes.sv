module muxes (
    input logic a_i, b_i, c_i, d_i,
    input logic [1:0] sel4_i,   
    output logic y0_o, y1_o     
);

    logic xor_out;  

    
    assign xor_out = a_i ^ b_i;

    always_comb begin
        if (xor_out) begin
            y0_o = d_i;
        end else begin
            y0_o = c_i;
        end
    end

    
    always_comb begin
        case (sel4_i)
            2'b00: y1_o = 0;   
            2'b01: y1_o = c_i; 
            2'b10: y1_o = 0;   
            2'b11: y1_o = d_i; 
            default: y1_o = 0; 
        endcase
    end

endmodule
