set key default
set key top left
set xrange[*:*]
set yrange[0:*]
set xlabel "x"
set ylabel "psi(x)"
set terminal pdf
set output "dat/q3.pdf"


plot "dat/q3_1.dat" w linespoints ps 0.01 notitle,\
#    "dat/q3_2.dat" w linespoints ps 0.01 notitle,\
#    "dat/q3_3.dat" w linespoints ps 0.01 notitle,\
#    "dat/q3_4.dat" w linespoints ps 0.01 notitle,\
#    "dat/q3_norm.dat" w linespoints ps 0.01 notitle