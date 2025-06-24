#include <iostream>
#include <random>
#include <chrono>
#include <cstdlib>

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
    

    for(int i = 0; i < size * size; i++){
        finalMatrix[i] = originalMatrix[i] * originalMatrix[i];
    }

    //end timing
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end - start;

    //print timing

    //MATLAB time for 10000 x 10000: 0.183926 seconds
    std::cout << "C++ time for " << size << " x " << size << ": "<< elapsed.count() << " seconds\n";


    free(finalMatrix);
    free(originalMatrix);

    return 0;
}