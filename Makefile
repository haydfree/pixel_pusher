all:
	@echo "---all---"
	clang main.c -o main

commit:
	@echo "---commit---"
	git add .
	git commit -m "AUTO COMMIT: `date +'%Y-%m-%d %H:%M:%S'`"
	git push origin main

run:
	@echo "---run---"
	./main

clean:
	@echo "---clean---"
	rm -rf main *.o *.core
