//
// Quadratic polynomial:  f(x) = a + b*x2 + c*(x2^2)
//

`include "quadra.vh"

module quadra
(
    input  ck_t clk,
    input  rs_t rst_b,
    input  x1_t  x1,
    input  x2_t x2,
    output y_t  y
);

    // x1_t x1;
    x2_t x2_internal;
    sq_t sq, sq_nxt;
    a_t a, a_nxt;
    b_t b, b_nxt;
    c_t c, c_nxt;

    t1_t t1, t1_nxt;
    t2_t t2, t2_nxt;
    t0_t t0, t0_nxt;

    s_t s_nxt;

    // assign x2 = x[16:0];
    // assign x1 = x[23:17];

    square u_square(
        .x2(x2),
        .sq(sq_nxt)
    );    

    lut u_lut(
        .x1(x1),
        .a(a_nxt),
        .b(b_nxt),
        .c(c_nxt)
    );

    // Stage 1 ff
    always_ff@(posedge clk) begin
        if (!rst_b) begin
            sq <= '0;
            a <= '0;
            b <= '0;
            c <= '0;
            x2_internal <= '0;
        end
        else begin
            sq <= sq_nxt;
            a <= a_nxt;
            b <= b_nxt;
            c <= c_nxt;
            x2_internal <= x2;
        end
    end

    always_comb begin // t = s4.27
        t0_nxt = a >>> 1;
        t1_nxt = (b * x2_internal) >>> 24; 
        t2_nxt = (c * sq) >>> 30; 
    end

    // Stage 2 ff
    always_ff@(posedge clk) begin
        if (!rst_b) begin
            t0 <= '0;
            t1 <= '0;
            t2 <= '0;
        end
        else begin
            t0 <= t0_nxt;
            t1 <= t1_nxt;
            t2 <= t2_nxt;
        end
    end

    always_comb begin
        s_nxt = t0 + t1 + t2;
    end

    //Stage 3 ff
    always_ff@(posedge clk) begin
        if (!rst_b) begin
            y <= '0;
        end
        else begin
            y <= s_nxt >>> 6;
        end
    end


endmodule
