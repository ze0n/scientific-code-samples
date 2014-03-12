#set terminal pngcairo size 800,600 enhanced font 'Verdana,14'
set terminal pngcairo dashed size 800,600 enhanced monochrome font 'Verdana,14' 
#dashlength 5 linewidth 2

set autoscale
set xtic auto
set ytic auto

set ytic 35,5,100
set xtic 0,10,100

set yrange [35:100]
set xrange [0:100]

set mxtics 2
set mytics 5

set xlabel "Agents with DSS, %"
set ylabel "Normalized evacuation time, %"

set grid ytics lt 0 lw 1 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1 lc rgb "#bbbbbb"

set datafile separator ";"

#set key box top right width 1 height 1 title "Number of agents"  font ",18"
#set xtics ("1" 1, "2" 2, "3" 3, "4" 4, "5" 5, "6" 6)

set output 'xy.png'
plot "xy.12.csv" using 1:(100.0 * $2/101.5)  with linespoints lw 3 lt 2 lc "black" pt 1  title "12.5×10^3 agents (100% is 1.7h)", \
     "xy.25.csv" using 1:(100.0 * $2/180.5) with linespoints lw 3 lt 1 lc "black" pt 2  title "25×10^3 agents (100% is 3h)", \
     "xy.50.csv" using 1:(100.0 * $2/362.9)  with linespoints lw 3 lt 3 lc "black" pt 3  title "50×10^3 agents (100% is 6h)"

end