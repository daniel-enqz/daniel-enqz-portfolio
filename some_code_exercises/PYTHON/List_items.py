import time
import random
import numpy

class color:
    BOLD = '\033[1m'
    END = '\033[0m'
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    BLANCO = '\033[98m'
def run():
    list_color = [color.BOLD,color.END,color.RED,color.GREEN,color.YELLOW,color.BLUE,color.PURPLE,color.CYAN,color.BLANCO]  
    infinite_loop = str(input(color.BOLD+color.BLUE+"Do you want an infinite loop y or n?----->"+color.END))
    z = int(input(color.BOLD+color.BLUE+"How large you want the lists to be? (1-100)---->"+color.END))
    list=[]
    def loop():
        for i in range(z):
            list.append(random.randint(1,100))
            time.sleep(.01)
            print(color.BOLD+random.choice(list_color)+"LIST:{}".format(list))
        for i in range(z):
            list.pop()
            time.sleep(.01)
            if len(list) != 0:
                print(color.BOLD+random.choice(list_color)+"LIST:{}".format(list))
    while infinite_loop =="y":
        loop()
    else:
        from Binary import main
run()