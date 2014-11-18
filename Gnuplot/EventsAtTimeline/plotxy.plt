set terminal pngcairo size 1800,500 enhanced font 'Verdana,20'

set autoscale
unset ytics
unset border

set xdata time
set timefmt "%Y-%m-%d %H"
set format x "%d-%m-%Y %H"

set yrange [0.8 : 1.2]
set xrange ["2014-05-25 00" : "2014-07-17 18"]

set xtics ("2014-05-27 05","2014-06-09 05", "2014-06-11 02", "2014-06-12 02", "2014-06-13 14", "2014-07-01 17", "2014-06-14 23", "2014-07-10 06", "2014-07-14 09")
set xtics rotate

set grid ytics lt 0 lw 1 lc rgb "#666666"

set datafile separator ";"

set output 'events.png'

set object rectangle from first '2014-06-13 12', graph 0 to first '2014-06-14 06', graph 1 fc rgb 'pink' back
set object rectangle from first '2014-07-10 06', graph 0 to first '2014-07-11 00', graph 1 fc rgb 'pink' back

plot 1 lc rgb "black" lw 2 title "" ,\
     "data.csv" using 1:2   with points lw 3 lc "black" pt 7 title "" ,\
     "data.csv" using 1:2:3 with labels left nopoint rotate by 50 tc rgb "black" title ""
end