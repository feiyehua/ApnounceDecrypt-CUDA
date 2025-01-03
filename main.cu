/*** 
 * @Author       : FeiYehua
 * @Date         : 2025-01-01 12:52:46
 * @LastEditTime : 2025-01-01 12:52:46
 * @LastEditors  : FeiYehua
 * @Description  : 
 * @FilePath     : main.cpp
 * @     © 2024 FeiYehua
 */
#include "timer.hpp"
#include "sha1.hpp"
using namespace std;
// uint32_t *target;
__constant__ uint32_t target[5]={0xabc21d3f,0x9d5d98ec,0xae9f3d51,0x44752901,0x71f2bbed};
uint64_t *result;
uint64_t start;
uint64_t hostResult;
uint32_t* calcBuffer;
int main()
{
    auto fp=fopen("CurrentProgress.txt","r+");
    if(fp==NULL) exit(-1);
    if(fscanf(fp,"%lu",&start)!=1)
    {
        start=0;
    }
    cudaSetDevice(0);
    // cudaMalloc(&target,sizeof(uint32_t)*5);
    cudaMalloc(&result,sizeof(uint64_t));
    cudaMalloc(&calcBuffer,sizeof(uint32_t)*80*(1<<16));
    // cudaMemcpy(target,hostTarget,sizeof(uint32_t)*5,cudaMemcpyHostToDevice);
    for(uint64_t i=start;i<=((uint64_t)1<<32ll);i++)
    {
        cal(i,result,calcBuffer);
        cudaMemcpy(&hostResult,result,sizeof(uint64_t),cudaMemcpyDeviceToHost);
        if(hostResult!=0)
        {
            auto fpResult=fopen("Result.txt","w");
            fprintf(fpResult,"%lu\n",hostResult);
            return 0;
        }
        fseek(fp, 0L, SEEK_SET);
        fprintf(fp,"%lu\n",i);
    }
    return 0;
}