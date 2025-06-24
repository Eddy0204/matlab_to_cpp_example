CXX = g++
CXXFLAGS = -O2 -std=c++17

# Targets
all: square_matrix square_matrix_omp

square_matrix: square_matrix.cpp
	$(CXX) $(CXXFLAGS) square_matrix.cpp -o square_matrix

square_matrix_omp: square_matrix_omp.cpp
	$(CXX) $(CXXFLAGS) -fopenmp square_matrix_omp.cpp -o square_matrix_omp

clean:
	rm -f square_matrix square_matrix_omp
