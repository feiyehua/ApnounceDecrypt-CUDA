###
 # @Author       : FeiYehua
 # @Date         : 2025-01-06 11:44:25
 # @LastEditTime : 2025-01-10 16:48:18
 # @LastEditors  : FeiYehua
 # @Description  : 
 # @FilePath     : start.sh
 #      © 2024 FeiYehua
### 
#!/bin/bash
apt-get install tmux -y
mkdir target
nvcc -rdc=true -O4 main.cu sha1.cu -o target/sha1.out
tmux