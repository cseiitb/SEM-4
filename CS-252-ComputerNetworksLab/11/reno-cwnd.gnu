set terminal jpeg
set output "reno-cwnd.jpg"

set multiplot
#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set size 1.0, 1.0
set key right bottom


set xlabel "Time"
set ylabel "Throughput"
set key top
set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 0 ps 1.5   # --- blue

plot \
'reno-dropped.txt' using 2:8 t'Dropped' with points pt 2, \
'reno-cwnd.txt' using 1:7 t'Throughput' with linespoints ls 1

unset multiplot

