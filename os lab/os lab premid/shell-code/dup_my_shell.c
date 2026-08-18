#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>
#include<signal.h>


void child_process(int n) {
  usleep(5000);
  for (int idx = 1; idx <= n; ++idx) {
    printf("Child [%d]: %d\n", getpid(), idx);
    sleep(1);
  }
  exit(0);
}

int main(int argc, char* argv[]) {
  if (argc < 4) {
    printf(
        "Usage: ./sched <time-slice> <c1-execution-time> "
        "<c2-execution-time>\n");
    exit(1);
  }

  int num_children = 2;
  int time_slice = atoi(argv[1]);
  int children_exec_time[2];
  for (int idx = 2; idx < num_children + 2; ++idx) {
    children_exec_time[idx - 2] = atoi(argv[idx]);
  }

  printf("timeslice: %d, c1 execution time: %d, c2 execution time: %d\n",
         time_slice, children_exec_time[0], children_exec_time[1]);
  

}












// #include<stdio.h>
// #include<unistd.h>
// #include<stdlib.h>
// #include<signal.h>
// #include<string.h>
// #include  <sys/types.h>

// #define MAX_INPUT_SIZE 1024
// #define MAX_TOKEN_SIZE 64
// #define MAX_NUM_TOKENS 64

// /* Splits the string by space and returns the array of tokens
// *
// */
// char **tokenize(char *line)
// {
//   char **tokens = (char **)malloc(MAX_NUM_TOKENS * sizeof(char *));
//   char *token = (char *)malloc(MAX_TOKEN_SIZE * sizeof(char));
//   int i, tokenIndex = 0, tokenNo = 0;

//   for(i =0; i < strlen(line); i++){

//     char readChar = line[i];

//     if (readChar == ' ' || readChar == '\n' || readChar == '\t'){
//       token[tokenIndex] = '\0';
//       if (tokenIndex != 0){
// 	tokens[tokenNo] = (char*)malloc(MAX_TOKEN_SIZE*sizeof(char));
// 	strcpy(tokens[tokenNo++], token);
// 	tokenIndex = 0; 
//       }
//     } else {
//       token[tokenIndex++] = readChar;
//     }
//   }
 
//   free(token);
//   tokens[tokenNo] = NULL ;
//   return tokens;
// }

// void free_mem(char ** tokens){
// 	for(int i=0;i<MAX_NUM_TOKENS;i++){
// 		if(tokens[i]!=NULL){
// 			free(tokens[i]);
// 			tokens[i]=NULL;
// 		}
// 	}
// 	free(tokens);
// }

// void sigchld_handler(int sig){
// 		pid_t bg_pid;
// 		while((bg_pid = waitpid(-1, NULL, WNOHANG))>0){
// 			printf("reaped %d\n", bg_pid);
// 		}
// }

// int bg_num = 0;
// int fg_num = 0;
// int fg_pgid = -1;
// int bg_pgid = -1;

// int main(int argc, char* argv[]) {
// 	signal(SIGCHLD, sigchld_handler);

// 	char  line[MAX_INPUT_SIZE];            
// 	char  **tokens;              
// 	int i;


// 	while(1) {

// 		/* BEGIN: TAKING INPUT */
// 		bzero(line, sizeof(line));
// 		printf("$ ");
// 		scanf("%[^\n]", line);
// 		getchar();
// 		line[strlen(line)] = '\n'; //terminate with new line
// 		tokens = tokenize(line);

// 		int i = 0;

// 		while(1){
// 			if(tokens[i]==NULL) break;
// 			int j = i;	// j saterts from i so as to address empty cmd bw && &&
// 			while(tokens[j]!=NULL){
// 				if(strcmp(tokens[j], "&")==0) break;
// 				if(strcmp(tokens[j],"&&")==0) break;
// 				if(strcmp(tokens[j],"&&&")==0) break;
// 				j++;
// 			}
// 			int bg = 0;
// 			if(tokens[j]!=NULL){
// 				if(strcmp(tokens[j], "&")==0){
// 					if(tokens[j+1]!=NULL) {printf("'&' can appear only at end\n"); tokens[j+1]=NULL;}
// 					else bg = 1;
// 				}
// 				else if(strcmp(tokens[j],"&&&")==0) bg = 1;
// 			}
// 			tokens[j] = NULL;
// 			pid_t pid=fork();
// 			if(pid==0){
// 				if(execvp(tokens[i], tokens+i)==-1){
// 					printf("%s exec failed\n",tokens[i]);
// 					exit(1);
// 				}
// 			}
// 			else{
// 				i = j+1;
// 				if(bg==0){
// 					if(waitpid(pid)>=0)printf("reaped %d\n",pid);
// 				}
// 			}
// 		}
// 		free_mem(tokens);
// 	}
// }













// #include<stdio.h>
// #include<stdlib.h>
// #include<unistd.h>

// int main(){
// 	// take input
// 	int a[6] = {1, 2, 3, 4, 5, 6};
// 	if(fork()==0){
// 		int sum = 0;
// 		for(int i=0; i<6; i+=2) sum+=a[i];
// 		printf("pid=%d, ppid=%d, sum=%d\n", getpid(), getppid(), sum);
// 		exit(0);
// 	}
// 	else{
// 		if(fork()==0){
// 			int sum = 0;
// 			for(int i=1; i<6; i+=2) sum+=a[i];
// 			printf("pid=%d, ppid=%d, sum=%d\n", getpid(), getppid(), sum);
// 			exit(0);
// 		}
// 		else{
// 			pid_t pid=1;
// 			while(pid>0){
// 				pid=wait(0);
// 				if(pid>0) printf("pid=%d, pid_reaped=%d\n", getpid(),pid);
// 			}
// 		}
// 	}
// }