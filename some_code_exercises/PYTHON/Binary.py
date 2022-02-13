import time
import random
import webbrowser
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
def main():
    print("\n"*1)
    print(color.BOLD+color.CYAN+"What secret page you want to download? 1,2,3,4 or 5"+color.END)
    def start():
            a = 0
            b = float(input("----->"))
            if b == 1:
                link = "https://makeawebsitehub.com/weird-websites/"
            elif b == 2:
                link = "https://pets.webmd.com/cats/cat-vaccines"
            elif b == 3:
                link = "https://www.cdc.gov/healthypets/pets/dogs.html"
            elif b == 4:
                link = "https://comicbook.com/marvel/news/spider-man-no-way-home-trailer-cinemacon-2021-not-online-rumor/"
            elif b == 5:
                link = "https://stacker.com/stories/1587/100-best-movies-all-time"
            else:
                link = 0

            def loop(a,b,link):
                if a < 99:
                    a += 1
                    e = 99999999999999999999999999
                    r = random.randint(100000*999999*e,999999*999999*e)
                    print(color.BOLD+"{}%".format(a)+color.END, color.BOLD+color.GREEN+"{}".format(bin(r))+color.END)
                    time.sleep(b)
                    loop(a,b,link)
                elif a == 99:
                    a += 1
                    timer = 6
                    print(color.PURPLE+color.BOLD,a,"%"+color.END)
                    print(color.GREEN+color.BOLD+"TASK DONE"+color.END)
                    print("\n"*2)
                    print(color.BOLD+"LAUNCHING IN...."+color.END)
                    def time_countdown(timer,link):
                        if timer > 1:
                            timer -= 1
                            print(color.BOLD+color.YELLOW,timer,color.END)
                            time.sleep(.7)
                            time_countdown(timer,link)
                        elif timer == 1:
                            webbrowser.open(link)
                    time_countdown(timer,link)

            def b_value(a,b,link):
                if b <= 5 and b >= 1:
                    print(color.BOLD+color.PURPLE+"Downloading site, please wait..."+color.END)
                    time.sleep(2)
                    c = b/100
                    b = c
                    loop(a,b,link)
                else:
                    print(color.BOLD+color.YELLOW+"Select a valid number (1,2,3,4 or 5)"+color.END)
                    start()
            b_value(a,b,link)
    start()
main()