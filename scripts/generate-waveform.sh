#!/bin/bash

FILE=$1
OUTPUT=$2
START=$3
END=$4

duration=$(ffprobe -i $FILE -show_entries format=duration -v quiet -of csv="p=0")

if [ -z $START ]; then
  START=0
fi

if [ -z $END ]; then
  END=$duration
fi

max_range=50000

wave_duration=$(echo "scale=4; $END - $START" | bc)

progress=$(echo "scale=4; $wave_duration * 100 / $duration" | bc)

range=$(echo "$progress * $max_range / 100" | bc)

plot=./temp.gnuplot

touch $plot

echo "set terminal png size 100,400" > $plot
echo "set output '$OUTPUT';" >> $plot
# echo "set yrange [-$range:$range];" >> $plot
 echo "set yrange [-1:1];" >> $plot
echo "unset key;" >> $plot
echo "unset tics;" >> $plot
echo "unset border;" >> $plot
echo "set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb\"black\" behind" >> $plot
echo "set lmargin 0;" >> $plot
echo "set rmargin 0;" >> $plot
echo "set tmargin 0;" >> $plot
echo "set bmargin 0;" >> $plot
echo "plot '<cat' binary filetype=bin format='%int16' endian=little array=1:0 with lines;" >> $plot

ffmpeg -i copy.mpeg -ac 1 -filter:a aresample=8000 -map 0:a -c:a pcm_s16le -f data - | gnuplot $plot
# ffmpeg -ss 40 -i $FILE -t 10 -c copy ./copy.mpeg
# ffmpeg -i ./copy.mpeg -filter_complex showwavespic -frames:v 1 $OUTPUT
# # rm temp.gnuplot
xdg-open $OUTPUT

