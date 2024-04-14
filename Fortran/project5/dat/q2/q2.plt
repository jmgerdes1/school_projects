set title "Radioactive Decay"
set xlabel "time (s)"
set ylabel "Number of Particles"
set terminal pdf
f(x) = 100*exp(-x)
set style line 1 \
    lc '#00ff00'\
    pt 1 ps 0
set style line 2 \
    lc '#0000ff'\
    pt 1 ps 0
set output "dat/q2/q2_1.pdf"
plot "dat/q2/decay_1.dat" title "Data" with linespoints linestyle 1,\
    f(x) title "Expected" linestyle 2
set output "dat/q2/q2_2.pdf"
plot "dat/q2/decay_2.dat" title "Data" with linespoints linestyle 1,\
    f(x) title "Expected" linestyle 2
set output "dat/q2/q2_3.pdf"
plot "dat/q2/decay_3.dat" title "Data" with linespoints linestyle 1,\
    f(x) title "Expected" linestyle 2
set output "dat/q2/q2_4.pdf"
plot "dat/q2/decay_4.dat" title "Data" with linespoints linestyle 1,\
    f(x) title "Expected" linestyle 2