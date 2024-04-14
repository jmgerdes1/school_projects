set terminal pdf
set output "dat/q1.pdf"

set xrange [1:4]
set yrange [*:*]

set xlabel "alpha"
set ylabel "x"

f(x)=(x-1)/x

g(x)=(x+(x*x)-(x*sqrt((x*x)-3-(2*x))))/(x*x*2)

h(x)=(x+(x*x)+(x*sqrt((x*x)-3-(2*x))))/(x*x*2)

plot "dat/q1.dat" ps 0.1 pt 7 notitle,\
    f(x) with lines notitle lc "#000000",\
    g(x) with lines notitle lc "#000000",\
    h(x) with lines notitle lc "#000000"