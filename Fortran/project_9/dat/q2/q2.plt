set xlabel "x"
set ylabel "y"
#set xrange[-1:1]
#set yrange[-1:1]
set terminal pdf
set style line 1 \
    lc '#0f00f0'\
    pt 1 ps 0

set title "HO (kx = 1, ky = 1)"
set output "dat/q2/q2_cHO_1.pdf"
plot "dat/q2/q2_cHO_1.dat"  notitle with linespoints linestyle 1

set title "HO (kx = 1, ky = 4)"
set output "dat/q2/q2_cHO_2.pdf"
plot "dat/q2/q2_cHO_2.dat"  notitle with linespoints linestyle 1

set title "HO (kx = 1, ky = 2)"
set output "dat/q2/q2_cHO_3.pdf"
plot "dat/q2/q2_cHO_3.dat"  notitle with linespoints linestyle 1