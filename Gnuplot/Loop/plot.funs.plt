set terminal pngcairo size 4000,2200 enhanced font 'Verdana,14'

set autoscale
set xtic auto
set ytic auto

set ytic 0,25,100
set xtic 0,600,5400

set yrange [0:100]
set xrange [0:5400]


#set mxtics 2
#set mytics 2

#set xlabel "Agents with DSS, %"
#set ylabel "Population evacuation time, min"

set grid ytics lt 0 lw 1 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1 lc rgb "#bbbbbb"

set datafile separator ";"

set output 'percents.xy.png'
set multiplot layout 6,8


do for [h=0:5]{
    do for [w=0:7] {
        plot 'data/func.wm5400.w'.(w*600).'.h'.(50+h*10).'.txt' using 1:2 title "" with lines lw 1
    }
}

end