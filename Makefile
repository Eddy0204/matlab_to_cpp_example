CXX = g++
NVCC = nvcc
CXXFLAGS = -O2
OMPFLAGS = -fopenmp
TARGETS = square_matrix square_matrix_omp square_matrix_cuda

all: $(TARGETS)

square_matrix: square_matrix.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

square_matrix_omp: square_matrix_omp.cpp
	$(CXX) $(CXXFLAGS) $(OMPFLAGS) -o $@ $<

square_matrix_cuda: square_matrix.cu
	$(NVCC) -O2 -o $@ $<

clean:
	rm -f $(TARGETS)
