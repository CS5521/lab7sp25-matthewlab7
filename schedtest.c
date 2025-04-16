#include "types.h"
#include "user.h"
#include "stat.h"

void loop_forever() {
    while (1);
}

int main(int argc, char *argv[])
{
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
    int num_tickets = argc -2;
    int i;
    for (i = 0; i < num_tickets; i++)
    {
        tickets[i] = atoi(argv[i + 2]);
        if (tickets[i] < 10)
        {
            printf(2, "tickets must be greater than or equal to 10\n");
            exit();
        }
    
    
        int pid = fork();
        if (pid == 0)
        {
            settickets(tickets[i]);
            loop_forever();
        }
        else if (pid > 0)
        {
            tickets[i] = pid;
        }
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

    for (i = 0; i < num_tickets; i++)
    {
        kill(tickets[i]);
    }
    for (i = 0; i < num_tickets; i++)
    {
        wait();
    }

    exit();
    
}
