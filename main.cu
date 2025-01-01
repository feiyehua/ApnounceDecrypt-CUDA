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
uint32_t *target;
uint32_t hostTarget[5]={0xcb473678,0x976f425d,0x6ec13398,0x38f11011,0x007ad27d};
uint64_t *result;
uint64_t start;
uint64_t hostResult;
int main()
{
    auto fp=fopen("CurrentProgress.txt","w+");
    if(fscanf(fp,"%lu",&start)!=1)
    {
        start=0;
    }
    cudaSetDevice(0);
    cudaMalloc(&target,sizeof(uint32_t)*5);
    cudaMalloc(&result,sizeof(uint64_t));
    cudaMemcpy(target,hostTarget,sizeof(uint32_t)*5,cudaMemcpyHostToDevice);
    for(uint64_t i=start;i<=((uint64_t)1<<32ll);i++)
    {
        cal(i,target,result);
        // cudaMemcpy(&hostResult,result,sizeof(uint64_t),cudaMemcpyDeviceToHost);
        // if(hostResult!=0)
        // {
        //     fprintf(fp,"%lu\n",hostResult);
        //     return 0;
        // }
        fseek(fp, 0L, SEEK_SET);
        fprintf(fp,"%lu\n",i);
    }
    return 0;
}