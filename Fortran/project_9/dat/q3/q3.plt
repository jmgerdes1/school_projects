set xlabel "t"
set ylabel "O"
set terminal pdf
set style line 1 \
    lc '#0d5aa0'\
    pt 1 ps 0
set style line 2 \
    lc '#ff00aa'\
    pt 1 ps 0

set title "Pendulum (O0 = 0.1)"
set output "dat/q3/q3_PEN_1.pdf"
plot "dat/q3/q3_PEN_1.dat" using 3:1 notitle with linespoints linestyle 1,\
    "dat/q3/q3_PENapprox_1.dat" using 3:1 notitle with linespoints linestyle 2

set title "Pendulum (O0 = 0.2)"
set output "dat/q3/q3_PEN_2.pdf"
plot "dat/q3/q3_PEN_2.dat" using 3:1 notitle with linespoints linestyle 1,\
    "dat/q3/q3_PENapprox_2.dat" using 3:1 notitle with linespoints linestyle 2

set title "Pendulum (O0 = 0.3)"
set output "dat/q3/q3_PEN_3.pdf"
plot "dat/q3/q3_PEN_3.dat" using 3:1 notitle with linespoints linestyle 1,\
    "dat/q3/q3_PENapprox_3.dat" using 3:1 notitle with linespoints linestyle 2

set title "Pendulum (O0 = 0.4)"
set output "dat/q3/q3_PEN_4.pdf"
plot "dat/q3/q3_PEN_4.dat" using 3:1 notitle with linespoints linestyle 1,\
    "dat/q3/q3_PENapprox_4.dat" using 3:1 notitle with linespoints linestyle 2

set title "Pendulum (O0 = 0.5)"
set output "dat/q3/q3_PEN_5.pdf"
plot "dat/q3/q3_PEN_5.dat" using 3:1 notitle with linespoints linestyle 1,\
    "dat/q3/q3_PENapprox_5.dat" using 3:1 notitle with linespoints linestyle 2