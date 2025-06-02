TARGET=							pixel_pusher

all:
	clang --target=wasm32 -nostdlib -Wl,--no-entry -Wl,--export-all -Wl,--allow-undefined -Wl,--import-memory \
	  -Wl,--initial-memory=65536 -Wl,--max-memory=65536 -o main.wasm main.c	

commit:
	echo "commit"
	git add .
	git commit -m "AUTO COMMIT: `date +'%Y-%m-%d %H:%M:%S'`"
	git push origin main

