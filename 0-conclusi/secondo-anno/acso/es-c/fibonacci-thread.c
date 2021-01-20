#include <stdio.h>
#include <pthread.h>

void *thread_function(void *n)
{
	long iter = (long) n;
	long num1 = 0l;
	long num2 = 1l;
	long temp;

	switch(iter) {
	case 0l: return (void*) 0l;
	case 1l: return (void*) 1l;
	default:
		for (long i = 0; i < iter - 1; i++) {
			temp = num1 + num2;
			num1 = num2;
			num2 = temp;
		}
	}

	return (void*) num2;

}

long calcola_fibonacci(long n)
{
	pthread_t t1, t2;
	void *ret1, *ret2;

	switch(n) {
	case 0l: return 0l;
	case 1l: return 1l;
	default:
		pthread_create(&t1, NULL, thread_function, (void*) n - 1);
		pthread_create(&t2, NULL, thread_function, (void*) n - 2);
		pthread_join(t1, &ret1);
		pthread_join(t2, &ret2);
		return (long) ret1 + (long) ret2;
	}
}


int main(void)
{
	int n;
	printf("Inserire numero di cui calcolare la serie di Fibonacci: ");
	scanf("%d", &n);
	printf("%ld\n", calcola_fibonacci(n));
}
