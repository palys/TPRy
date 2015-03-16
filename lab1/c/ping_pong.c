#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
  int type = 0;
  int number_of_communicates = 0;
  int length = 0;
  int verbose = 0;

  if (argc < 4) {
    fprintf(stderr, "usage: %s [type] [number_of_communicates] [length_of_communicate] [-v]\n", argv[0]);
    exit(-1);
  }

  if (argc == 5) {
    if (strcmp(argv[4], "-v") == 0) {
      verbose = 1;
    }
  }

  if (strcmp(argv[1], "S") == 0) {
    type = 0;
  } else if (strcmp(argv[1], "R") == 0) {
    type = 1;
  } else {
    fprintf(stderr, "type have to be S for Ssend or R for Rsend\n");
    exit(-1);
  }

  number_of_communicates = atoi(argv[2]);
  length = atoi(argv[3]);

  char * communicate = malloc(length * sizeof(char));
  sprintf(communicate, "%0*d", length, 0);

  MPI_Init(NULL, NULL);
  int world_rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
  int world_size;
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);

  if (world_rank == 0 && verbose) {
    printf("type = %d number_of_communicates = %d length = %d\n", type, number_of_communicates, length);
  }

  if (world_size < 2) {
    fprintf(stderr, "World size must be greater than 1 for %s\n", argv[0]);
    MPI_Abort(MPI_COMM_WORLD, 1); 
  }
  
  char * rec_buff = malloc(length * sizeof(char));
  int number_of_comm = number_of_communicates;
  MPI_Barrier(MPI_COMM_WORLD);
  
  double latency_sum = 0;
  double latency_once_start = 0;

  double throughput = 0;
  double sending_start = MPI_Wtime();
  double sending_time_diff = 0;
  number_of_communicates = number_of_comm;
  if (world_rank == 0) {
    sending_start = MPI_Wtime();
    while (number_of_communicates > 0) {
        latency_once_start = MPI_Wtime(); 
        if (type == 0) {
    	  MPI_Ssend(communicate, length, MPI_CHAR, 1, 0, MPI_COMM_WORLD);
        } else {
          MPI_Rsend(communicate, length, MPI_CHAR, 1, 0, MPI_COMM_WORLD);
        }
	number_of_communicates--;
	MPI_Recv(rec_buff, length, MPI_CHAR, 1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        latency_sum += (MPI_Wtime() - latency_once_start);
    }
    sending_time_diff = MPI_Wtime() - sending_start;
  } else if (world_rank == 1) {
    while (number_of_communicates > 0) {
    	MPI_Recv(rec_buff, length, MPI_CHAR, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
    	latency_sum += (MPI_Wtime() - latency_once_start);
        number_of_communicates--;
        latency_once_start = MPI_Wtime();
        if (type == 0) {
    	  MPI_Ssend(communicate, length, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
        } else {
          MPI_Rsend(communicate, length, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
        }
    }
  }
  
  if (world_rank == 0) {
    throughput = ((((double)number_of_comm) * length) / sending_time_diff);
    if (verbose) {
      printf("Throughput is %f Mbit/s Sending time is %f\n", throughput / (128 * 1024), sending_time_diff);
      printf("Latency sum is %f, number of communicates is %d, average latency is %f ms\n", latency_sum, number_of_comm, latency_sum / number_of_comm * 1000);
    } else { 
      printf("%f %f %d\n", throughput / (128 * 1024), latency_sum / number_of_comm * 1000, length);
    }

  }
  MPI_Finalize();
}
