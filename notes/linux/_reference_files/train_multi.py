from multiprocessing import Pool
from time import sleep

def f(x):
    sleep(1000) # simulate some computation
    return x*x

if __name__ == '__main__':
    with Pool(8) as p:
        print(p.map(f, range(8)))
