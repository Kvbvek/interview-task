#! /bin/csh -f

if (-f coeffs.txt) then
    rm coeffs.txt
endif

octave approx.m |& tee coeffs.txt

# optionally, use optimized coeffs:
#ctave approx_opt.m |& tee coeffs.txt

if (-f hex_coeffs.txt) then
    rm hex_coeffs.txt
endif

octave print_coeffs.m |& tee hex_coeffs.txt



