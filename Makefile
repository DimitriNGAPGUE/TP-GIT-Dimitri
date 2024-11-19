CC = gcc
CFLAGS = -O3 -g
LDFLAGS = -lm
TARGET = test mandel

all: $(TARGET)
	@echo "Compilation terminée."
libppm.so: ppm.c
	$(CC) $(CFLAGS) -fpic -shared $^ -o $@

test: main.c libppm.so
	$(CC) $(CFLAGS) main.c -L. -Wl,-rpath,. -lppm $(LDFLAGS) -o $@
	@echo "Exécution de mandel..."
	@./test

mandel: mandel.c libppm.so
	$(CC) $(CFLAGS) mandel.c -L. -Wl,-rpath,. -lppm $(LDFLAGS) -o $@
	@echo "Exécution de mandel..."
	@./mandel

clean:
	rm -f $(TARGET) *.so

