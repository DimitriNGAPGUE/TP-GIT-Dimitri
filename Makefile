CC = gcc
CFLAGS = -O3 -g
LDFLAGS = -lm
TARGET = test mandel

all: $(TARGET)

libppm.so: ppm.c
	$(CC) $(CFLAGS) -fpic -shared $^ -o $@

test: main.c libppm.so
	$(CC) $(CFLAGS) main.c -L. -Wl,-rpath,. -lppm $(LDFLAGS) -o $@

mandel: mandel.c libppm.so
	$(CC) $(CFLAGS) mandel.c -L. -Wl,-rpath,. -lppm $(LDFLAGS) -o $@

run: mandel test
	@echo "Exécution de mandel..."
	./mandel
	@echo "Exécution de test..."
	./test

clean:
	rm -f $(TARGET) *.so
