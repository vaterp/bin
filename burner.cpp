#include <time.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main( int argc, char *argv[] )
{
	printf ("ARGC:%d\n",argc);
	int sleep_timer = 10;
	if (argc == 2)
	   sleep_timer = atoi(argv[1]);

	printf ("Sleeping for %d usec\n",sleep_timer);

	float x=100.12;

	while (true)
	{
		usleep(sleep_timer);
		for (int i=0;i<0x0FFF;i++)
		{
			x++;
			x=x*x;
			x=x/3.0;
			x++;
		}
	}
}
