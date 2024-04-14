set title "SHO (Euler)"
set xlabel "t (s)"
#set ylabel "v (m/s)"
set terminal pdf
#set style line 1 \
#    lc '#daa520'\
#    pt 1 ps 0
#set style line 2 \
#    lc '#938479'\
#    pt 1 ps 0
#set style line 3 \
#    lc '#93934a'\
#    pt 1 ps 0
#set style line 4 \
#    lc '#BB2B1B'\
#    pt 1 ps 0
set style line 1 \
    lc '#96CC1E'\
    pt 1 ps 0
set style line 2 \
    lc '#D61F28'\
    pt 1 ps 0
set style line 3 \
    lc '#651D92'\
    pt 1 ps 0

set output "dat/q1/q1_esho.pdf"
plot "dat/q1/q1_esho.dat" using 4:1 title "Position" with linespoints linestyle 1,\
    "dat/q1/q1_esho.dat" using 4:2 title "Velocity" with linespoints linestyle 2,\
    "dat/q1/q1_esho.dat" using 4:3 title "Energy" with linespoints linestyle 3

set title "SHO (Cromer)"
set output "dat/q1/q1_csho.pdf"
plot "dat/q1/q1_csho.dat" using 4:1 title "Position" with linespoints linestyle 1,\
    "dat/q1/q1_csho.dat" using 4:2 title "Velocity" with linespoints linestyle 2,\
    "dat/q1/q1_csho.dat" using 4:3 title "Energy" with linespoints linestyle 3

set title "SHO (Cromer-AnP)"
set output "dat/q1/q1_canp.pdf"
plot "dat/q1/q1_canp.dat" using 4:1 title "Position" with linespoints linestyle 1,\
#   "dat/q1/q1_canp.dat" using 4:2 title "Velocity" with linespoints linestyle 2,\
#   "dat/q1/q1_canp.dat" using 4:3 title "Energy" with linespoints linestyle 3,\