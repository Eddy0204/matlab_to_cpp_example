#include <iostream>
#include <random>
#include <chrono>
#include <cstdlib>
#include <omp.h>

int main()
{
    int size = 10000;

    float* originalMatrix = (float*)malloc(size * size * sizeof(float));
    float* finalMatrix = (float*)malloc(size * size * sizeof(float));


    //fill original matrix with random numbers
    for (int i = 0; i < size * size; i++){
        originalMatrix[i] = static_cast<float>(rand()) / RAND_MAX;
    }

    //Timing start here
    auto start = std::chrono::high_resolution_clock::now();
    
#pragma omp parallel for
    for(int i = 0; i < size * size; i++){
        finalMatrix[i] = originalMatrix[i] * originalMatrix[i];
    }

    //end timing
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end - start;

    //print timing

    std::cout << "C++ OMP time for " << size << " x " << size << ": "<< elapsed.count() << " seconds\n";


    free(finalMatrix);
    free(originalMatrix);

    return 0;
}