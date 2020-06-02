set terminal png size 100,400
set output 'wave1.png';
set yrange [-1:1];
unset key;
unset tics;
unset border;
set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"black" behind
set lmargin 0;
set rmargin 0;
set tmargin 0;
set bmargin 0;
plot '<cat' binary filetype=bin format='%int16' endian=little array=1:0 with lines;
