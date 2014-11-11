set encoding utf8
set terminal pngcairo enhanced size 900,1900 font "PT Sans bold, 10"
set termoption dash

set xlabel 'Количество моделей'
set ylabel 'MAE, см'

set ylabel font "PT Sans, 16" 
set xlabel font "PT Sans, 16" 

set grid
set grid mytics lt 0 lw 2 lc rgb "#444444"

unset border

set xrange [0.8:5.2]
set xtics (1,2,3,4,5)

set ytics 6.5,0.5,13
set yrange [6.75:12.75]

set key out below

set xtics font "PT Sans, 16" 
set ytics font "PT Sans, 16" 

set output 'graph.png'

set datafile separator " "

load "beauty.txt"

set style fill transparent solid 0.5

plot    "edges.txt"  using 1:2 with l lw 0.7 lc rgb "#777777" title "" , \
        "points.txt" using 1:2 with points pt 7 ps 1.5 lw 1.5 lc rgb "#e34a33" title "" ,\
        "points.txt" using 1:2:3 with labels point pt 6 ps 1.5 lw 1.5 offset character 4,character -0.2 title ""
        

end