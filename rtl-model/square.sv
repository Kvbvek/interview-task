`include "quadra.vh"

module square
(
    input  x2_t x2,
    output sq_t sq
);
    sqfull_t sq_f;

    // Compute x2^2:
    always_comb begin
        sq_f = (x2 * x2) >> X2_SHIFT; // shift right 12 bits for proper alignment -> * 2^(-12)
        sq = sq_f[33:10];             // truncate to 24 bits from full 34 bit result
    end
endmodule    
