CC = gcc
CFLAGS = -O3 -g
LDFLAGS = -lm
TARGET = test mandel

all: $(TARGET)

libppm.so: ppm.c
	$(CC) $(CFLAGS) -fpic -shared $^ -o $@

test: main.c libppm.so
	$(CC) $(CFLAGS) main.c -L. -lppm $(LDFLAGS) -o $@

mandel: mandel.c libppm.so
	$(CC) $(CFLAGS) mandel.c -L. -lppm $(LDFLAGS) -o $@

clean:
	rm -f $(TARGET) *.so

