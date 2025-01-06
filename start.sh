###
 # @Author       : FeiYehua
 # @Date         : 2025-01-06 11:44:25
 # @LastEditTime : 2025-01-06 11:46:49
 # @LastEditors  : FeiYehua
 # @Description  : 
 # @FilePath     : start.sh
 #      © 2024 FeiYehua
### 
#!/bin/bash
sudo apt-get install tmux
nvcc -rdc=true -O4 main.cu sha1.cu -o target/sha1.out
tmux
echo ./target/sha1.out