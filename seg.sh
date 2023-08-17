VIDEO="./videos/2023.8.16董宇辉东方甄选直播间直播完整版.mp4"
output="${VIDEO%.mp4}"_1h.mp4
echo "save to ${output}"

duration_seconds=3600
start_time=0

ffmpeg -i $VIDEO -ss $start_time -c copy -t $duration_seconds $output