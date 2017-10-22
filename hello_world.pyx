import time
import timeit
import math
import numpy as np
import matplotlib.pyplot as plt

#cython hello_world.pyx --embed && gcc -Os -I /usr/include/python2.7 -o test hello_world.c -lpython2.7 && ./test

def is_prime(x):
    for i in range(2,int(round(math.sqrt(x)))):
        if x%i==0:
            return False
    return True;

cdef is_prime2(int x):
    cdef int i;
    for i in range(2,round(math.sqrt(x))):
        if x%i==0:
            return False
    return True;

def prime(x=1000):
    for i in range(x):
        is_prime(i)
    return 0

cdef prime2(int x):
    cdef int i
    for i in range(x):
        is_prime2(i)
    return 0

def fibonacci(x=10):
    u_n=0
    u_n_plus_1=1
    for i in range(x):
        f=u_n+u_n_plus_1
        u_n=u_n_plus_1
        u_n_plus_1=f

cdef fibonacci2(int x):
    cdef int u_n=0
    cdef int u_n_plus_1=1
    cdef int i
    cdef int f;
    for i in range(x):
        f=u_n+u_n_plus_1
        u_n=u_n_plus_1
        u_n_plus_1=f
    # print f

step=100


whole_time=0
for i in range(0,step):
    start=time.time()
    fibonacci(100000)
    end=time.time()
    whole_time+=end-start
a=whole_time

whole_time=0
for i in range(0,step):
    start=time.time()
    fibonacci2(100000)
    end=time.time()
    whole_time+=end-start
b=whole_time
print a,b



plt.bar([1,2],[a,b],log=True)
plt.ylabel('Time (s)')
plt.xticks([1,2], ('Python','Cython'))
plt.title('Compute Fibonacci suite betwenn 0 and 1e5 (100 times)')
# plt.show()
plt.savefig('Fibonacci')

plt.clf()


whole_time=0
for i in range(0,step):
    start=time.time()
    prime(100000)
    end=time.time()
    whole_time+=end-start
a=whole_time

whole_time=0
for i in range(0,step):
    start=time.time()
    prime2(100000)
    end=time.time()
    whole_time+=end-start
b=whole_time
print a,b



plt.bar([1,2],[a,b],log=True)
plt.ylabel('Time (s)')
plt.xticks([1,2], ('Python','Cython'))
plt.title('Compute all prime numbers betwenn 0 and 1e5 (100 times)')
# plt.show()
plt.savefig("Prime_numbers")

plt.clf()
