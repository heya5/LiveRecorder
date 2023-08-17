#!/bin/bash

VIDEO="./videos/2023.8.16董宇辉东方甄选直播间直播完整版.mp4"
output_base="${VIDEO%.mp4}"

duration_seconds=3600
total_duration=$(ffprobe -i "$VIDEO" -show_entries format=duration -v quiet -of csv="p=0")

# Convert total_duration to integer
total_duration_int=$(printf "%.0f" "$total_duration")

for ((start_time=0; start_time<total_duration_int; start_time+=duration_seconds)); do
    output="${output_base}_${start_time}_duration_${duration_seconds}.mp4"
    echo "Start time: ${start_time}, duration: ${duration_seconds}"
    echo "Saving segment ${output}"

    ffmpeg -i "$VIDEO" -ss "$start_time" -c copy -t "$duration_seconds" "$output"
done
