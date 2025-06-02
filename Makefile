TARGET=							pixel_pusher

commit:
	echo "commit"
	git add .
	git commit -m "AUTO COMMIT: `date +'%Y-%m-%d %H:%M:%S'`"
	git push origin main

