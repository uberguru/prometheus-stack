docker run -p 9100:9100 \
     --log-driver none \
     --name node-exporter \
     --net host \
     --pid host \
     --volume /proc:/host/proc \
     --volume /sys:/host/sys \
     --volume /:/rootfs \
     promxporter 
