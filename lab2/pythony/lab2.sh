echo "Barrier groups:(n, 0)";
echo "WORLD_SIZE NUMBER_OF_SYNC TIME[ms]";
echo `mpiexec.hydra -machinefile ./mpihosts -np 1 ./lab2.py 0 200 barrier 1`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 0 200 barrier 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 0 200 barrier 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 0 200 barrier 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 0 200 barrier 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 0 200 barrier 6`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 0 200 barrier 7`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 0 200 barrier 8`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 0 200 barrier 9`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 0 200 barrier 10`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 0 200 barrier 11`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 0 200 barrier 12`;

echo "Barrier groups:(n/2, n/2)";
echo "WORLD_SIZE NUMBER_OF_SYNC TIME[ms]";
echo `mpiexec.hydra -machinefile ./mpihosts -np 1 ./lab2.py 0 200 barrier 1`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 0 200 barrier 1`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 0 200 barrier 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 0 200 barrier 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 0 200 barrier 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 0 200 barrier 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 0 200 barrier 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 0 200 barrier 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 0 200 barrier 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 0 200 barrier 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 0 200 barrier 6`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 0 200 barrier 6`;

echo "Bcast groups:(n, 0)";
echo "WORLD_SIZE COMM_SIZE[4*B] NUMBER_OF_COMM TIME_BUILD_IN TIME_OWN";
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 10000 1000 bcast 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 10000 1000 bcast 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 10000 1000 bcast 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 10000 1000 bcast 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 10000 1000 bcast 6`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 10000 1000 bcast 7`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 10000 1000 bcast 8`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 10000 1000 bcast 9`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 10000 1000 bcast 10`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 10000 1000 bcast 11`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 10000 1000 bcast 12`;

echo "Bcast groups:(n/2, n/2)";
echo "WORLD_SIZE COMM_SIZE[4*B] NUMBER_OF_COMM TIME_BUILD_IN TIME_OWN";
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 10000 1000 bcast 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 10000 1000 bcast 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 10000 1000 bcast 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 10000 1000 bcast 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 10000 1000 bcast 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 10000 1000 bcast 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 10000 1000 bcast 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 10000 1000 bcast 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 10000 1000 bcast 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 10000 1000 bcast 6`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 10000 1000 bcast 6`;

echo "Gather groups:(n,0)"
echo "WORLD_SIZE COMM_SIZE[4*B] NUMBER_OF_COMM TIME_BUILD_IN TIME_OWN";
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 10000 1000 gather 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 10000 1000 gather 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 10000 1000 gather 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 10000 1000 gather 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 10000 1000 gather 6`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 10000 1000 gather 7`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 10000 1000 gather 8`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 10000 1000 gather 9`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 10000 1000 gather 10`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 10000 1000 gather 11`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 10000 1000 gather 12`;

echo "Gather groups:(n/2, n/2)"
echo "WORLD_SIZE COMM_SIZE[4*B] NUMBER_OF_COMM TIME_BUILD_IN TIME_OWN";
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 10000 1000 gather 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 10000 1000 gather 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 10000 1000 gather 2`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 10000 1000 gather 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 10000 1000 gather 3`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 10000 1000 gather 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 10000 1000 gather 4`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 10000 1000 gather 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 10000 1000 gather 5`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 10000 1000 gather 6`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 10000 1000 gather 6`;

