import random
import time

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
updated_score = 0
tries = 0
hits= 0 

def guess_number(updated_score, tries, hits):
   
#Generador de número y recibimiento de valor
    def main_game(lives,score,updated_score,bonus,tries,hits):
        a = random.randint(1,2)
        print(color.BOLD+"\nGuess the number, 1 or 2?????"+color.END)
        value_given = float(input(color.BOLD+color.PURPLE+"----->"+color.END))
        tries += 1

#Proceso de casos específicos
        if lives == 0:
            print(color.BOLD+color.BLUE+"GAME ENDED, YOU HAVE 0 LIFES LEFT"+color.END)
            print(color.BOLD+color.BLUE+"SCORE = {}".format(score)+color.END)
            print(color.BOLD+color.BLUE+"If you want to play again, type 1"+color.END)
            play_again = float(input(color.BOLD+color.PURPLE+"----->"+color.END))
            if play_again == 1:
                if updated_score <= score:
                    updated_score = score
                    start(updated_score,tries, hits)
                elif updated_score > score:
                    start(updated_score,tries, hits)
            else:
                exit()

        elif score == 4:
            timer = 4
            print(color.BOLD+color.GREEN+"FANTASTIC YOU REACHED 5 POINTS"+color.END)
            time.sleep(1)
            print(color.BOLD+color.GREEN+"YOU UNLOCKED A SECRET FILE :)"+color.END)
            time.sleep(1)
            print(color.BOLD+color.CYAN+"1 = Continue playing"+color.END)
            time.sleep(1)
            print(color.BOLD+color.CYAN+"2 = OPEN FILE"+color.END)
            decision = float(input(color.BOLD+color.CYAN+"----->"+color.END))
            if decision == 2:
                print(color.YELLOW+"Launching in..."+color.END)
                def time_countdown(timer):
                        if timer > 1:
                            timer -= 1
                            print(color.BOLD+color.YELLOW,timer,color.END)
                            time.sleep(.7)
                            time_countdown(timer)
                        elif timer == 1:
                            print("\n"*1)
                            from Accurancy import accurancy
                time_countdown(timer)
            else:
                score += 1
                main_game(lives,score,updated_score,bonus,tries,hits)

        elif score == 6:
            score += 1
            print(color.BOLD+color.GREEN+"Excellent, you have {} points".format(score)+color.END)
            print(color.BOLD+color.CYAN+"\nBonus Question!!! + 3 points"+color.END)
            bonus = 2
            main_game(lives,score,updated_score,bonus,tries,hits)

#Caso correcto - incorrecto
        else:
            if value_given == a:
                score += 1 + bonus
                if bonus > 0:
                    bonus = 0
                print(color.BOLD+color.GREEN+"Excellent, you have {} points".format(score)+color.END)
                hits += 1
                main_game(lives,score,updated_score,bonus,tries,hits)

            elif value_given != a:
                print(color.YELLOW+"wrong answer boy, it was {}, you have {} lives left".format(a,lives)+color.END)
                lives -= 1
                main_game(lives,score,updated_score,bonus,tries,hits)

#Set de valores iniciales
    def start(updated_score,tries, hits):
        lives = 2
        score = 0
        bonus = 0
        print("\n"*2)
        print(color.BOLD+color.PURPLE+"WELCOME, GUESS THE NUMBER, 1 OR 2, YOU HAVE 3 LIVES"+color.END)
        print(color.BOLD+color.PURPLE+"IF YOU REACH 5 POINTS, YOU'LL BE ABLE TO DOWNLOAD A SPECIAL FILE"+color.END)
        print(color.BOLD+color.PURPLE+"Your BEST score is {}".format(updated_score)+color.END)
        if tries > 0:
            print(color.BOLD+color.PURPLE+"You have an accurancy of {}%".format((hits/tries)*100)+color.END)
        main_game(lives,score,updated_score,bonus,tries,hits)
    start(updated_score,tries,hits)

guess_number(updated_score, tries, hits)