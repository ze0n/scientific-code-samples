set terminal pngcairo size 800,600 enhanced font 'Verdana,14'

set autoscale
set xtic auto
set ytic auto

set grid ytics lt 0 lw 1 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1 lc rgb "#bbbbbb"

set yrange [0:150]
#set yrange auto


#set xtic 0,10,100
#set ytic 0,5,80

set xlabel "Time, min"
set ylabel "Flow through the bridge (evacuated agents in 10 s.)"

#set mxtics 5
#set mytics 5

set datafile separator ";"

set palette model RGB defined (0 "red", 1 "blue", 2 "green", 3 "black")

set output "45.png"

set title "45% agents with DSS"

plot "45.csv" using 1:($2+$3+$4+$5) title "Bridge #1" smooth bezier  with filledcurves lw 2 lc rgb "#f60018", \
     "45.csv" using 1:($2+$3+$4) title "Bridge #2" smooth bezier with filledcurves  lw 2 lc rgb "#3216b0", \
     "45.csv" using 1:($2+$3) title "Bridge #3" smooth bezier with filledcurves  lw 2  lc rgb "#ffce00", \
     "45.csv" using 1:($2) title "Bridge #4" smooth bezier  with filledcurves lw 2 lc rgb "#25d500"

end