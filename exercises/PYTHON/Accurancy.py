import random
import time

class color:
    BOLD = '\033[1m-'
    END = '\033[0m'
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    BLANCO = '\033[98m' 

def accurancy():
    received = float(input(color.BOLD+color.CYAN+"Draw a number (0-100) for the program to find it ------>"+color.END))
    start = time.time()
    tries = 0
    c = random.randint(0,100)
    print(color.BOLD+color.BLUE,c,color.END)
    tries += 1
    while c != received:
        c = random.randint(0,100)
        print(color.BOLD+color.BLUE,c,color.END)
        tries += 1
    if c == received:
        end = time.time()
        time_elapsed = (end-start)
        print(color.BOLD+color.GREEN+"Finished✅:"+color.END)
        print(color.BOLD+color.GREEN+"Tries:{}".format(tries)+color.END)
        print(color.BOLD+color.GREEN+"Time Elapsed:{}".format(time_elapsed)+color.END)
        print(color.BOLD+color.YELLOW+"\nDeploying in....."+color.END)
        time.sleep(3.5)
        timer = 5
        def time_countdown(timer):
            if timer > 1:
                timer -= 1
                print(color.BOLD+color.YELLOW,timer,color.END)
                time.sleep(.7)
                time_countdown(timer)
            elif timer == 1:
                print("\n"*1)
                from List_items import run
        time_countdown(timer)

accurancy()
