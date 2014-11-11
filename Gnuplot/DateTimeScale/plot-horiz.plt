set encoding utf8
set terminal pngcairo enhanced size 1600,1100 font "PT Sans bold,18"
set termoption dash

set xlabel ''

set grid

set datafile missing "NaN"

set xdata time
set timefmt "%Y-%m-%d-%H"
set format x "%d-%m-%Y"

#set xtics "2013-10-19-00", 3600*24, "2014-12-26 00"
set xrange ["2013-10-19 00" : "2013-12-26 00"]

set grid mxtics lt 0 lw 1 lc rgb "#444444"

set xtics rotate
set key out below
unset key

set yrange [0 : 65]
fName = 'MAE.txt'
set ylabel 'MAE, см'
set output 'MAE.png'

plot fName using 1:2 with lines lt 3 lw 1 lc 1 title 'Model #1',\
	 fName using 1:3 with lines lt 3 lw 1 lc 2 title 'Model #2',\
	 fName using 1:4 with lines lt 3 lw 1 lc 3 title 'Model #3',\
	 fName using 1:5 with lines lt 3 lw 1 lc 4 title 'Model #4',\
	 fName using 1:6 with lines lt 3 lw 1 lc 5 title 'Model #5',\
	 fName using 1:7 with lines lt 1 lw 2 lc 6 title 'Ensemble #1',\
	 fName using 1:8 with lines lt 1 lw 2 lc 1 title 'Ensemble #2',\
     fName using 1:9 with lines lt 1 lw 2 lc 9 title 'Ensemble #0' 

end