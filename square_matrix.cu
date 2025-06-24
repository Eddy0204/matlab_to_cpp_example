#include <iostream>
#include <random>
#include <chrono>
#include <cstdlib>

__global__ void squareCUDA(float* originalMatrix, float* finalMatrix, int total){
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= total){
             return;
    }
    finalMatrix[i] = originalMatrix[i] * originalMatrix[i];
}

int main()
{
    int size = 10000;

    float* originalMatrix = (float*)malloc(size * size * sizeof(float));
    float* finalMatrix = (float*)malloc(size * size * sizeof(float));


    //fill original matrix with random numbers
    for (int i = 0; i < size * size; i++){
        originalMatrix[i] = static_cast<float>(rand()) / RAND_MAX;
    }

    float* originalMatrix_cuda;
    float* finalMatrix_cuda;
    

    int totalElements = size * size;

    cudaMalloc(&originalMatrix_cuda, totalElements * sizeof(float));
    cudaMalloc(&finalMatrix_cuda, totalElements * sizeof(float));
    cudaMemcpy(originalMatrix_cuda, originalMatrix, totalElements * sizeof(float), cudaMemcpyHostToDevice);

    //warm up cuda (for accurate timing)
    squareCUDA<<<1, 1>>>(originalMatrix_cuda, finalMatrix_cuda, totalElements);
    cudaDeviceSynchronize();

    //Timing start here
    auto start = std::chrono::high_resolution_clock::now();
    
    
    int threadsPerBlock = 256;
    int blocks = (totalElements + threadsPerBlock - 1) / threadsPerBlock;


    squareCUDA<<<blocks, threadsPerBlock>>>(originalMatrix_cuda, finalMatrix_cuda, totalElements);
    cudaDeviceSynchronize();

    //end timing
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end - start;

    //copy matrix into cpu
    cudaMemcpy(finalMatrix, finalMatrix_cuda, totalElements * sizeof(float), cudaMemcpyDeviceToHost);


    //print timing

    //MATLAB time for 10000 x 10000: 0.183926 seconds
    std::cout << "Cuda time for " << size << " x " << size << ": "<< elapsed.count() << " seconds\n";


    cudaFree(originalMatrix_cuda);
    cudaFree(finalMatrix_cuda);
    free(finalMatrix);
    free(originalMatrix);

    return 0;
}