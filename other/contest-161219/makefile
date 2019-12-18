CC = gcc
CFLAGS = -g -Wall -O2 \-std=c89 -pedantic

TARGET = es

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	$(RM) $(TARGET)

