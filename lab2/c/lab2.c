#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int world_rank;
int world_size;
int number = 137;

int size_of_packets;
int number_of_packets;
int size_of_first_group;

int *recvbuff;

MPI_Comm comm;

double barrier(){
	double timesum = 0;
	double start, end, barrier_time;
	int i;
	for(i=0;i<number_of_packets;i++){
		if(world_rank==0){
			start = MPI_Wtime();
		}
		MPI_Barrier(comm);
		if(world_rank==0){
			end = MPI_Wtime();
			barrier_time = end - start;
			timesum += barrier_time;
		}
	}
	return timesum/number_of_packets;
}

double my_bcast(){
	int * data = (int*)malloc(size_of_packets * sizeof(int));
	MPI_Barrier(comm);
	double start = MPI_Wtime();

	if(world_rank==0){
		int i;
		for(i = 1; i< world_size; i++){
			MPI_Send(data, size_of_packets, MPI_INT, i, 0, comm);
		}
	} else {
		MPI_Recv(data, size_of_packets, MPI_INT, 0, 0, comm, MPI_STATUS_IGNORE);
	}

	MPI_Barrier(comm);
	double stop = MPI_Wtime();

	return stop - start;
}

double bcast(){
	int * data = (int*)malloc(size_of_packets * sizeof(int));
	MPI_Barrier(comm);
	double start = MPI_Wtime();

	MPI_Bcast(data,size_of_packets,MPI_INT,0,comm);

	MPI_Barrier(comm);
	double stop = MPI_Wtime();

	return stop - start;
}

double my_gather(){
	int * data = (int*)malloc(size_of_packets * sizeof(int));
	MPI_Barrier(comm);
	double start = MPI_Wtime();

	if(world_rank==0){
		int s;
		for(s=1; s<world_size; s++){
			MPI_Recv(&data[size_of_packets / world_size * s], size_of_packets / world_size, MPI_INT, s, 0, comm, MPI_STATUS_IGNORE);
		}
	} else {
		MPI_Send(&data[size_of_packets / world_size * world_rank], size_of_packets / world_size, MPI_INT, 0, 0, comm);
	}

	MPI_Barrier(comm);
	double stop = MPI_Wtime();

	return stop - start;
}

double gather(){
	int * data = (int*)malloc(size_of_packets * sizeof(int));
	MPI_Barrier(comm);
	double start = MPI_Wtime();
	MPI_Gather(&data[size_of_packets / world_size * world_rank],size_of_packets / world_size,MPI_INT,recvbuff,size_of_packets / world_size,MPI_INT,0,comm);
	MPI_Barrier(comm);
	double stop = MPI_Wtime();

	return stop - start;
}

void divide(){
	MPI_Comm_split(MPI_COMM_WORLD, world_rank < size_of_first_group, 0, &comm);
	MPI_Comm_rank(comm, &world_rank);
	MPI_Comm_size(comm, &world_size);
}

int main(int argc, char** argv){

	size_of_packets = atoi(argv[1]);
	number_of_packets = atoi(argv[2]);
        size_of_first_group = atoi(argv[3]);
        

	MPI_Init(NULL,NULL);

	MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
	MPI_Comm_size(MPI_COMM_WORLD, &world_size);

        divide();

	MPI_Barrier(comm);

	recvbuff = malloc(sizeof(int)*size_of_packets);

	int i;
	double times = 0.0;
	
	for(i = 0; i < number_of_packets; i++) {
		times += my_bcast();
	}
	if (world_rank == 0) {
		printf("my_bcast time %f\n", times / number_of_packets);
	}

	times = 0.0;
	for(i = 0; i < number_of_packets; i++) {
		times += bcast();
	}
	if (world_rank == 0) {
		printf("bcast time %f\n", times / number_of_packets);
	}

	times = 0.0;
	for(i = 0; i < number_of_packets; i++) {
		times += my_gather();
	}
	if (world_rank == 0) {
		printf("my_gather time %f\n", times / number_of_packets);
	}
	
	times = 0.0;
	for(i = 0; i < number_of_packets; i++) {
		times += gather();
	}
	if (world_rank == 0) {
		printf("gather time %f\n", times / number_of_packets);
	}

	times = barrier();
	if (world_rank == 0) {
		printf("barrier time %f\n", times);
	}


	MPI_Finalize();
}
