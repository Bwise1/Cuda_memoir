/*
 how to run nvcc cuda_threads.cu -o cuda_threads
 ./cuda_threads
*/
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <cstdio>

// Kerner which will be ran on the GPU also know as device Code
__global__ void HelloGPU()
{
	printf("Hello World from the GPU\n");
}

// in the main we have host code, code that would be ran on CPU also known as Host code
int main()
{
    /*calling the kernel with execution cofiguration 
     <<< NUMBER_OF_BLOCKS, NUMBER_OF_THREADS_PER_BLOCK>>>
     <<<1,1>>> means 1 block which contains 1 thread.
        the code would be executed once, in a block using a thread
     <<<1,5>>> means 1 block which contains 5 threads, 
        the code would be executed 5 times by 5 different threads
    */
	HelloGPU<<<1,5>>>();
	cudaDeviceSynchronize();
	
	getchar();
	return 0;
}