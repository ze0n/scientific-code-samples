set terminal pngcairo size 600,500 enhanced font 'PT Sans,18'

set autoscale
set xtic auto
set ytic auto

set ytic 0,20,100
set xtic 0,10,80

set yrange [0:100]
set xrange [0:80]


#set mxtics 2
#set mytics 2

set title ""

set ylabel "Agents started evacuation, %"
set xlabel "Time, min"

set arrow 1 from 20,20 to 30,60 lc rgb "#777777"
set label 1 "Notification finished" at 20,18 left

set arrow 2 from  40,40 to 50,60 lc rgb "#777777"
set label 2 "Disaster occurred" at 40,38 left

set arrow 3 from 30,70 to 50,70 lc rgb "#777777"
set arrow 4 from 50,70 to 30,70 lc rgb "#777777"
set label 3 "T" at 39,76 left

set arrow 5 from 60,60 to 60,100 lc rgb "#777777"
set arrow 6 from 60,100 to 60,60 lc rgb "#777777"
set label 7 "A_{ignoring}" at 61,80 left


set grid ytics lt 0 lw 1.5 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1.5 lc rgb "#bbbbbb"

set datafile separator ";"



set output 'percents.1.2.png'
plot 'func.wm5400.w1200.h60.txt' using ($1/60):2 title "" with lines lw 3 lc rgb "black"

end