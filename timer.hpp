/*** 
 * @Author       : FeiYehua
 * @Date         : 2025-01-01 12:53:25
 * @LastEditTime : 2025-01-01 12:53:25
 * @LastEditors  : FeiYehua
 * @Description  : 
 * @FilePath     : timer.hpp
 * @     © 2024 FeiYehua
 */
#include <chrono>
#include <iostream>
class Timer {
public:
    Timer() : start_(std::chrono::high_resolution_clock::now()) {}

    ~Timer() {
        auto end = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double> elapsed = end - start_;
        std::cout << "Elapsed time: " << elapsed.count() << " seconds" << std::endl;
    }

private:
    std::chrono::time_point<std::chrono::high_resolution_clock> start_;
};