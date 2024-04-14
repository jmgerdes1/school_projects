set key default
set key top left
set xrange[*:*]
set yrange[*:*]
set xlabel "x"
set ylabel "psi(x)"
set terminal pdf
set output "dat/q2.pdf"


plot "dat/q2_1.dat" w linespoints ps 0.01 notitle,\
    "dat/q2_2.dat" w linespoints ps 0.01 notitle,\
    "dat/q2_3.dat" w linespoints ps 0.01 notitle,\
    "dat/q2_4.dat" w linespoints ps 0.01 notitle,\