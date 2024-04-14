set title "Range of Projectile"
set xlabel "X"
set ylabel "y"
set terminal pdf
set style line 1 \
    lc '#00ff00'\
    pt 1 ps 0
set style line 2 \
    lc '#0000ff'\
    pt 1 ps 0
set output "dat/q3/q3_1.pdf"
plot "dat/q3/q3_1.dat" notitle with linespoints linestyle 1
set output "dat/q3/q3_2.pdf"
plot "dat/q3/q3_2.dat" notitle with linespoints linestyle 1
set output "dat/q3/q3_3.pdf"
plot "dat/q3/q3_3.dat" notitle with linespoints linestyle 1
set output "dat/q3/q3_4.pdf"
plot "dat/q3/q3_4.dat" notitle with linespoints linestyle 1
set output "dat/q3/q3_5.pdf"
plot "dat/q3/q3_5.dat" notitle with linespoints linestyle 1
set output "dat/q3/q3_6.pdf"
plot "dat/q3/q3_6.dat" notitle with linespoints linestyle 1

set title "Euler vs Secant"
set output "dat/q3/q3_emvsm.pdf"
set xlabel "k (s^-1)"
set ylabel "Range (m)"
plot "dat/q3/q3_kr.dat" notitle with linespoints linestyle 1,\
    "dat/q3/p4_kr.dat" notitle with linespoints linestyle 2