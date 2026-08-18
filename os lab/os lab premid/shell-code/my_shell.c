#include  <stdio.h>
#include  <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include<signal.h>

#define MAX_INPUT_SIZE 1024
#define MAX_TOKEN_SIZE 64
#define MAX_NUM_TOKENS 64

/* Splits the string by space and returns the array of tokens
*
*/
char **tokenize(char *line)
{
  char **tokens = (char **)malloc(MAX_NUM_TOKENS * sizeof(char *));
  char *token = (char *)malloc(MAX_TOKEN_SIZE * sizeof(char));
  int i, tokenIndex = 0, tokenNo = 0;

  for(i =0; i < strlen(line); i++){

    char readChar = line[i];

    if (readChar == ' ' || readChar == '\n' || readChar == '\t'){
      token[tokenIndex] = '\0';
      if (tokenIndex != 0){
	tokens[tokenNo] = (char*)malloc(MAX_TOKEN_SIZE*sizeof(char));
	strcpy(tokens[tokenNo++], token);
	tokenIndex = 0; 
      }
    } else {
      token[tokenIndex++] = readChar;
    }
  }
 
  free(token);
  tokens[tokenNo] = NULL ;
  return tokens;
}

void free_mem(char ** tokens){
	for(int i=0;tokens[i]!=NULL;i++){
		free(tokens[i]);
	}
	free(tokens);
}

int bg_num = 0;
pid_t bg_pgid = -1;
pid_t fg_pgid = -1;

void sigint_handler(int sig){
	if(fg_pgid == -1 )  return;
	kill(-fg_pgid, SIGTERM);
}

int main(int argc, char* argv[]) {
	signal(SIGINT, sigint_handler);

	char  line[MAX_INPUT_SIZE];            
	char  **tokens;              
	int i;


	while(1) {

		/* BEGIN: TAKING INPUT */
		bzero(line, sizeof(line));
		printf("$ ");
		scanf("%[^\n]", line);
		getchar();

		// printf("Command entered: %s (remove this debug output later)\n", line);
		/* END: TAKING INPUT */

		line[strlen(line)] = '\n'; //terminate with new line
		tokens = tokenize(line);
   
       //do whatever you want with the commands, here we just print them

		if(tokens[0]==NULL) continue;
		
		if(strcmp(tokens[0],"exit")==0){
			if(bg_pgid!=-1) kill(-bg_pgid, SIGTERM);
			if(fg_pgid!=-1) kill(-fg_pgid, SIGTERM);
			kill(-getpid(), SIGTERM);
			free_mem(tokens);
			exit(0);
		}

		while(waitpid(-1,NULL, WNOHANG)>0){
			printf("Shell: bg process terminated\n");
			bg_num--;
		}
		if(bg_num==0) bg_pgid=-1;


		int bg = 0;
		int i=0;
		while(tokens[i]!=NULL){
			if(strcmp(tokens[i],"&")==0){
				if(tokens[i+1]==NULL){
					bg=1;
					tokens[i]=NULL;
				}
				else bg=2;
				break;
			}
			i++;
		}
		if(bg==1) bg_num++;


		if(strcmp(tokens[0],"cd")==0){
			if(chdir(tokens[1])==-1){
				fprintf(stderr, "cd failed\n");
			}
		}

		else{
			if(bg==2){
			
			

			}
			else{
			pid_t pid = fork();
			if(pid==0){

				if(bg==1){
					if(bg_num==1) setpgid(0, 0);
					else setpgid(0, bg_pgid);
				}
				else{
					setpgid(0,0);
				}
				if(execvp(tokens[0], tokens)==-1){
					fprintf(stderr, "exec failed\n");
					free_mem(tokens);
					exit(1);
				}
			}

			else{
				if(bg==0){
					// printf("hey, i have fg child with pid: %d, fgpgid: %d\n", pid, fg_pgid);
					if(fg_pgid!=pid) fg_pgid = pid;
					waitpid(pid);
				}
				else{
					if(bg_pgid==-1) bg_pgid = pid;
				}
			}
			}

		}

		// for(i=0;tokens[i]!=NULL;i++){
			// printf("found token %s (remove this debug output later)\n", tokens[i]);
		// }
       
		// Freeing the allocated memory
		free_mem(tokens);
	}
	return 0;
}
