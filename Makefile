<<<<<<< HEAD
# Define the compiler
CC = gcc

# Compiler flags (-Wall for warnings, -g for debugging symbols)
CFLAGS = -Wall -g -c

# Define the final executable name
TARGET = main

# Define the source files and object files
SRCS = main.c chip8.c
OBJS = $(SRCS:.c=.o)

# GDB Port for remote debugging
GDB_PORT = :1234

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

# Compile .c files into .o object files
%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

# Target to launch the program with gdbserver listening on the port
.PHONY: debug
debug: $(TARGET)
	@echo "Starting gdbserver on port $(GDB_PORT)..."
	gdbserver $(GDB_PORT) ./$(TARGET)

# Clean up compiled files
.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET)
=======
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2
TARGET = chip8
SOURCES = src/main.cpp src/chip8.cpp
OBJECTS = $(SOURCES:.cpp=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJECTS) -lSDL2

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: all clean
>>>>>>> 04cd164bedc83d956fc520476f555327fd42fa50
