CC = gcc
CFLAGS = -g -Wall -std=c89 -pedantic

TARGET = es

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	$(RM) $(TARGET)

