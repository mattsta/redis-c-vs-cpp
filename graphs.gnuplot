set title "Redis benchmarks under different compilers"
set datafile separator ":"
set style data histogram
set style histogram cluster gap 2
set style fill solid border -1
set boxwidth 0.9
set xtic rotate by -45 scale 0 font ",12"
set grid y
set ytics 0,250000,2500000
set yrange [0:2500000]
set format y "%0.0f"

set style line 1 lt rgb "red"
set style line 3 lt rgb "yellow"
set style line 4 lt rgb "green"
set style line 6 lt rgb "blue"
set style line 7 lt rgb "violet"
set style line 9 lt rgb "cyan"
set style line 2 lt rgb "dark-magenta"

set terminal svg size 1500,900
set output "comparison-all.svg"

plot "data/gpp" using 2:xticlabels(1) ls 1 title "g++ 4.8.2", \
     "data/clangpp-3.4" using 2:xticlabels(1) ls 9 title "clang++ 3.4", \
     "data/icc" using 2:xticlabels(1) ls 4 title "icc 2013", \
     "data/clang-3.4" using 2:xticlabels(1) ls 2 title "clang 3.4", \
     "data/clang" using 2:xticlabels(1) ls 6 title "clang 3.3", \
     "data/clangpp" using 2:xticlabels(1) ls 3 title "clang++ 3.3", \
     "data/gcc" using 2:xticlabels(1) ls 7 title "gcc 4.8.2"

set output "comparison-zoom-small.svg"

set ytics 0,10000,65000
set yrange [0:65000]

plot "data/gpp" using 2:xticlabels(1) every ::10::13 ls 1 title "g++ 4.8.2", \
     "data/clangpp-3.4" using 2:xticlabels(1) every ::10::13 ls 9 title "clang++ 3.4", \
     "data/icc" using 2:xticlabels(1) every ::10::13 ls 4 title "icc 2013", \
     "data/clang-3.4" using 2:xticlabels(1) every ::10::13 ls 2 title "clang 3.4", \
     "data/clang" using 2:xticlabels(1) every ::10::13 ls 6 title "clang 3.3", \
     "data/clangpp" using 2:xticlabels(1) every ::10::13 ls 3 title "clang++ 3.3", \
     "data/gcc" using 2:xticlabels(1) every ::10::13 ls 7 title "gcc 4.8.2"
set output '/dev/null'
