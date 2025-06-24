# matlab_to_cpp_example
Translation of a basic MATLAB numerical routine (elementwise matrix squaring) into optimized C++ and CUDA implementations. Includes timing comparisons and performance notes. Built to demonstrate applied experience in MATLAB-to-C++ porting and GPU acceleration.


### MATLAB time for 10000 x 10000: 0.183926 seconds
### C++ time for 10000 x 10000: 0.104565 seconds
### C++ OMP time for 10000 x 10000: 0.0234512 seconds
### Cuda time for 10000 x 10000: 0.00271434 seconds

##### Benchmarking Note
The CUDA timing results in this project report only the kernel execution time and do not include memory transfers between the host (CPU) and the device (GPU). This is a deliberate choice to isolate and measure the performance of the computational kernel itself.

In real-world applications, memory transfer time can often be overlapped with computation or amortized across multiple kernel launches. By focusing on the kernel, this benchmark highlights the speedup achieved from parallel computation on the GPU, which is the primary point of comparison against the CPU and OpenMP versions.

This approach provides a clearer picture of the raw performance advantage offered by CUDA in the context of this matrix squaring task.