# Simple Makefile for compiling the square matrix project

CXX = g++
CXXFLAGS = -O2 -std=c++17
TARGET = square_matrix
SRC = square_matrix.cpp

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)
