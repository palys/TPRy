echo "[Mbit/s] / [ms] / [B] Ssend"

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 1

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 5

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 10

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 50

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 100

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 500

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 1000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 10000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 50000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 100000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 500000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 1000000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 5000000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 10000000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c S 2000 50000000

echo "[Mbit/s] / [ms] / [B] Rsend"

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 1

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 5

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 10

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 50

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 100

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 500

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 1000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 10000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 50000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 100000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 500000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 1000000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 5000000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 10000000

mpiexec -machinefile ./mpihosts -np 2 ./ping-pong_c R 2000 50000000

echo "DO WYKRESOW!!!"i
