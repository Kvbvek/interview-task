//
// Quadratic polynomial:  f(x) = a + b*x2 + c*(x2^2)
//

`include "quadra.vh"

module quadra
(
    input  ck_t clk,
    input  rs_t rst_b,
    input  x_t x,
    output y_t  y
);

    x1_t x1;
    x2_t x2;
    x2_t x2_internal;

    sq_t sq, sq_nxt;

    a_t a, a_nxt;
    b_t b, b_nxt;
    c_t c, c_nxt;

    t1_t t1, t1_nxt;
    t1_full_t t1_full;
    t2_t t2, t2_nxt;
    t2_full_t t2_full;
    t0_t t0, t0_nxt;

    s_t sum;
    s_full_t s_full;

    y_t y_nxt;

    assign x2 = x[16:0];
    assign x1 = x[23:17];

    square u_square(
        .x2(x2),
        .sq(sq)
    );    

    lut u_lut(
        .x1(x1),
        .a(a),
        .b(b),
        .c(c)
    );

    always_comb begin
        t0 = signed'(a >> 1);
        t1_full = b * signed'(x2 >> X2_SHIFT); // shift right 6 bits for proper interpretation -> * 2^(-6)
        t1 = signed'(t1_full[T1_FULL_W-1:T1_FULL_W-T1_W]);
        t2_full = c * signed'(sq >> X2_SHIFT*2);        // shift right 12 bits for proper alignment -> * 2^(-12)
        t2 = signed'(t2_full[T2_FULL_W-1:T2_FULL_W-T2_W]);

        s_full = t0 + t1 + t2;
        sum = signed'(s_full[S_FULL_W-3:0]);

        y_nxt = signed'(sum[S_W-1:R_F]);
    end

    always_ff@(posedge clk) begin
        if (!rst_b) begin
            y <= '0;
        end
        else begin
            y <= y_nxt;
        end
    end


endmodule
