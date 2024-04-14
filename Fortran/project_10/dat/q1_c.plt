set terminal pdf
set output "dat/q1_c.pdf"

set xrange [3:4]
set yrange [-5:1]

set xlabel "a"
set ylabel "lambda"

set object rectangle from 3,-5 to 4,1 behind fillcolor "#808080" fillstyle solid

f(x) = 0

plot f(x) lc "#000000" notitle,\
    'dat/q1_c.dat' lc "#ffffff" notitle w lines