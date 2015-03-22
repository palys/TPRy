#!/usr/bin/env python
from mpi4py import MPI
import sys
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()
data_size = int(sys.argv[1])
number_of_communicates = int(sys.argv[2])
function_type = sys.argv[3]

def divide():
 global comm
 global size
 global rank
 size_of_first_group = int(sys.argv[4])
 new_comm = comm.Split(1 if rank < size_of_first_group else 0)
 comm = new_comm
 rank = comm.Get_rank()
 size = comm.Get_size()

def own_bcast(data_size):
 if rank == 0:
  data = range(0, data_size)
 else:
  data = None 
 comm.Barrier()
 start_time = MPI.Wtime()
 if rank == 0:
  for i in range(1, size):
   comm.send(data, dest = i)
 else:
  data = comm.recv(source = 0)
 comm.Barrier()
 end_time = MPI.Wtime()
 return end_time - start_time

def bcast(data_size):
 if rank == 0:
  data = range(0, data_size)
 else:
  data = None
 comm.Barrier()
 start_time = MPI.Wtime()
 comm.bcast(data, root = 0)
 comm.Barrier() 
 end_time = MPI.Wtime()
 return end_time - start_time

def data_chunk(data_size):
 regular_size = data_size / size
 number_of_bigger = data_size % size
 if rank < number_of_bigger:
  return range(rank * (regular_size + 1), (rank + 1) * (regular_size + 1))
 else:
  big_end = number_of_bigger * (regular_size + 1)
  index = rank - number_of_bigger
  return range(big_end + index * regular_size, big_end + (index + 1) * regular_size)

def own_gather(data_size):
 data_to_send = data_chunk(data_size)
 comm.Barrier()
 start_time = MPI.Wtime()
 if rank != 0:
  comm.send(data_to_send, dest = 0)
 if rank == 0:
  data = data_to_send
  for i in range(1, size):
   data.extend(comm.recv(source = i))
 comm.Barrier()
 end_time = MPI.Wtime()
 return end_time - start_time

def gather(data_size):
 data_to_send = data_chunk(data_size)
 comm.Barrier()
 start_time = MPI.Wtime()
 data = comm.gather(data_to_send, root = 0)
 comm.Barrier()
 end_time = MPI.Wtime()
 return end_time - start_time

def barrier(data_size):
 time_sum = 0.0
 for i in range(0, data_size):
  if rank == 0:
   start_time = MPI.Wtime()
  comm.Barrier()
  if rank == 0:
   end_time = MPI.Wtime()
   barrier_time = end_time - start_time
   time_sum += barrier_time
 if rank == 0:
  print "{0} {1} {2}".format(size, data_size, time_sum * 1000 / data_size)

if function_type == "bcast":
 functions_to_test = [bcast, own_bcast]
elif function_type == "gather":
 functions_to_test = [gather, own_gather]


divide()
if function_type == "bcast" or function_type == "gather":
 build_in_time = 0.0
 own_time = 0.0

 for i in range(0, number_of_communicates):
  build_in_time += functions_to_test[0](data_size)
  own_time += functions_to_test[1](data_size)
 if rank == 0:
  build_in_time_millis = build_in_time / number_of_communicates * 1000
  own_time_millis = own_time / number_of_communicates * 1000
  print "{0} {1} {2} {3} {4}".format(size, data_size, number_of_communicates, build_in_time_millis, own_time_millis)
  MPI.Finalize()
elif function_type == "barrier":
 barrier(number_of_communicates)
 MPI.Finalize()
