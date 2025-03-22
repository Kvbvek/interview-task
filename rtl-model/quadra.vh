// quadra.vh

`ifndef QUADRA_VH
`define QUADRA_VH

typedef logic ck_t; // clock
typedef logic rs_t; // reset
typedef logic dv_t; // data valid

// --------------------------------------------------------------------------------
// I/O precision
// --------------------------------------------------------------------------------

// x in [0,2) -> u1.23
localparam int  X_I =  1;          //         =  1
localparam int  X_F = 23;          //         = 23
localparam int  X_W = X_I + X_F;   //  1 + 23 = 24 (u1.23)

typedef logic [X_W-1:0] x_t;

// y [-2,2) -> s2.23
localparam int  Y_I =  2;          //         =  2
localparam int  Y_F = 23;          //         = 23
localparam int  Y_W = X_I + X_F;   //  2 + 23 = 25 (s2.23)

typedef logic signed [Y_W-1:0] y_t;

// --------------------------------------------------------------------------------
// Internal precision:
// --------------------------------------------------------------------------------

// x1: x[23:17] -> u1.6
localparam int  X1_I =  1;             //       = 1
localparam int  X1_F = 6;             //        = 6
localparam int  X1_W = X1_I + X1_F;   //  1 + 6 = 7 (u1.6)

typedef logic [X1_W-1:0] x1_t;

// x2: x[16:0] -> u0.17
localparam int  X2_I =  0;             //         = 0
localparam int  X2_F = 17;             //         = 17
localparam int  X2_W = X2_I + X2_F;   //   0 + 17 = 17 (u0.17)

typedef logic [X2_W-1:0] x2_t;

// a: -> s4.28
localparam int  A_I =  4;
localparam int  A_F = 28;
localparam int  A_W = A_I + A_F;

typedef logic signed [A_W-1:0] a_t;

// b: -> s4.28
localparam int  B_I =  4;
localparam int  B_F = 28;
localparam int  B_W = B_I + B_F;

typedef logic signed [B_W-1:0] b_t;

// c: -> s4.28
localparam int  C_I =  4;
localparam int  C_F = 28;
localparam int  C_W = C_I + C_F;

typedef logic signed [C_W-1:0] c_t;

// sq full
localparam int  SQFULL_I = X2_I + X2_I;
localparam int  SQFULL_F = X2_F + X2_F;
localparam int  SQFULL_W = 34; //SQ_I + SQ_F;

typedef logic [SQFULL_W-1:0] sqfull_t;

// sq
localparam int  SQ_I = X2_I + X2_I;
localparam int  SQ_F = X2_F + X2_F;
localparam int  SQ_W = 24; //SQ_I + SQ_F;

typedef logic [SQ_W-1:0] sq_t;

// t0
localparam int  T0_I = A_I;
localparam int  T0_F = A_F;
localparam int  T0_W = 31;//T0_I + T0_F;

typedef logic signed [T1_W-1:0] t0_t;

// t1
localparam int  T1_I = B_I + X2_I;
localparam int  T1_F = B_F + X2_F;
localparam int  T1_W = 49;//T1_I + T1_F;

typedef logic signed [T1_W-1:0] t1_t;

// t2
localparam int  T2_I = SQ_I + C_I;
localparam int  T2_F = SQ_F + C_F;
localparam int  T2_W = 56;//T2_I + T2_F;

typedef logic signed [T2_W-1:0] t2_t;

// // t trunc
// localparam int  T2_I = SQ_I + C_I;
// localparam int  T2_F = SQ_F + C_F;
// localparam int  T2_W = 31;//T2_I + T2_F;

// typedef logic signed [T2_W-1:0] t2_t;

// s
localparam int  S_I = Y_I;
localparam int  S_F = Y_F;
localparam int  S_W = 31;//S_I + S_F;

typedef logic signed [S_W-1:0] s_t;

// <challenge!>

`endif
