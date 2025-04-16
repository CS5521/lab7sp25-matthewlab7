#include "types.h"
#include "user.h"
#include "stat.h"

int main(int argc, char *argv[])
{
    // Check for valid number of arguments
    if (argc < 3 || argc > 9)
    {
        printf(2, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
        printf(2, "     loops must be greater than 0\n");
        printf(2, "     tickets must be greater than or equal to  10\n");
        printf(2, "     up to 7 tickets can be provided\n");
        exit();
    }

    int loops = atoi(argv[1]);
    if (loops <= 0)
    {
        printf(2, "loops must be greater than 0\n");
        exit();
    }
    int tickets[7];
    int forkCount = argc - 2;
    int i;
    for (i = 0; i < forkCount; ++i)
    {
        tickets[i] = atoi(argv[i + 2]);
        if (tickets[i] < 10)
        {
            printf(2, "tickets must be greater than or equal to 10\n");
            exit();
        }
    
        
        int pid = fork();

        // Each child process sets tickets to the argument and enters an infinite loop
        if (pid == 0)
        {
            settickets(tickets[i]);
            while (1);
        }
        // Parent process stores the child's PID in the tickets array
        else if (pid > 0)
            tickets[i] = pid;
        else
        {
            printf(2, "fork failed\n");
            exit();
        }
    }

    for (i = 0; i < loops; i++)
    {
        ps();
        sleep(3);
    }

    for (i = 0; i < forkCount; i++)
    {
        kill(tickets[i]);
    }

    while(wait() > 0);

    exit();
}
