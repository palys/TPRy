echo "Barrier";
echo "WORLD_SIZE NUMBER_OF_SYNC TIME[ms]";
echo `mpiexec.hydra -machinefile ./mpihosts -np 1 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 0 100 barrier`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 0 100 barrier`;

echo "Bcast";
echo "WORLD_SIZE COMM_SIZE[4*B] NUMBER_OF_COMM TIME_BUILD_IN TIME_OWN";
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 100 100 bcast`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 100 100 bcast`;

echo "Gather"
echo "WORLD_SIZE COMM_SIZE[4*B] NUMBER_OF_COMM TIME_BUILD_IN TIME_OWN";
echo `mpiexec.hydra -machinefile ./mpihosts -np 2 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 3 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 4 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 5 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 6 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 7 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 8 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 9 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 10 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 11 ./lab2.py 100 100 gather`;
echo `mpiexec.hydra -machinefile ./mpihosts -np 12 ./lab2.py 100 100 gather`;
