set terminal jpeg
set output "reno-thr.jpg"

set multiplot
#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set size 1.0, 1.0
set key right bottom


set xlabel "Time"
set ylabel "Throughput"
set key top
set style line 1 lc rgb '#0060ad' lt 0 lw 1 pt 0 ps 1.5   # --- blue

plot \
'reno-thr.txt' using 1:2 t'Dropped' with linespoints ls 1

unset multiplot

