# Author: Garritt Baker
# Purpose: Build the employee management system with multiple source files and proper cleanup.

# Variables
CC = g++                                # The compiler
TARGET = employee                       # The build target executable name
CFLAGS = -c -Wall -Wextra               # Compile with all errors and warnings

# Targets

# Default target - calls the build of the target
all: $(TARGET)

# Linking all object files to create the final executable
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) main.o Employee.o Officer.o Supervisor.o -o $(TARGET)

# Compiling source files into object files

# Compile main.o from main.cpp
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

# Compile Employee.o from Employee.cpp
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

# Compile Officer.o from Officer.cpp
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

# Compile Supervisor.o from Supervisor.cpp
Supervisor.o: Supervisor.cpp Supervisor.h Officer.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp

# Clean up the build artifacts
clean:
	rm -f *.o *~ $(TARGET)

# End of Makefile
