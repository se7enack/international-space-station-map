
#https://github.com/se7enack/international-space-station-map

apikey="YOUR API KEY GOES HERE"

watermark='g i t h u b . c o m / s e 7 e n a c k / i n t e r n a t i o n a l - s p a c e - s t a t i o n - m a p  .'

pos=$(curl http://api.open-notify.org/iss-now.json)
long=$(echo  $pos | jq '.iss_position | .longitude' | tr -d '"')
lat=$(echo  $pos | jq '.iss_position | .latitude' | tr -d '"')

wget -O tmp.file "https://www.mapquestapi.com/staticmap/v4/getmap?size=1376,774&type=map&zoom=7&center=${lat},${long}&imagetype=JPEG&key=${apikey}"
mogrify -draw "image over 550,324 0,0 'iss.png'" tmp.file
convert tmp.file -gravity Center -crop 93x93%+0+0 tmp.file
convert tmp.file -gravity southeast -stroke '#000C' -strokewidth 2 -annotate 0 "${watermark}" -stroke  none   -fill white  -annotate 0 "${watermark}"  tmp.file
convert tmp.file -gravity southwest -stroke '#000C' -strokewidth 2 -annotate 0 ".  `date`" -stroke  none   -fill white  -annotate 0 ".  `date`"  /tmp/iss.jpg

rm -f tmp.file 
