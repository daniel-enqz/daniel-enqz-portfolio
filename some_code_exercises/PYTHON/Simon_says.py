import tkinter as tk
from tkinter import messagebox
from tkinter import ttk
from tkinter.font import BOLD
import statistics as st
import random
import time

#Structure
window = tk.Tk()
window.title("SIMON SAYS")
window.config(bg = "white")

#Game_Deafaults
score_list = []
record_list = []
sequence = []
user_sequence = []

#MAIN PROCESS ( AQUÍ SE OBSERVA EL ALGORITMO QUE MUESTRA LA SECUENCIA A MEMORIZAR PARA EL USUARIO)
def sequence_for_user():
    sequence.append(random.randint(1, 9))
    print(sequence)
    sequence_lenght = len(sequence)
    point = 0
    for i in range(sequence_lenght):
        button_one = tk.Button(window, padx = 85, pady = 71,activebackground = "green",bd = 4,command = lambda: choice_process(1)).grid(row=1,column=0)
        button_two = tk.Button(window, padx = 85, pady = 71,activebackground = "red",bd = 4,command = lambda: choice_process(2)).grid(row=2,column=0)
        button_three = tk.Button(window, padx = 85, pady = 71,activebackground = "blue",bd = 4,command = lambda: choice_process(3)).grid(row=3,column=0)
        
        button_four = tk.Button(window, padx = 85, pady = 71,activebackground = "cyan",bd = 4,command = lambda: choice_process(4)).grid(row=1,column=1)
        button_five = tk.Button(window, padx = 85, pady = 71,activebackground = "yellow",bd = 4,command = lambda: choice_process(5)).grid(row=2,column=1)
        button_six = tk.Button(window, padx = 85, pady = 71,activebackground = "magenta",bd = 4,command = lambda: choice_process(6)).grid(row=3,column=1)

        button_seven = tk.Button(window, padx = 85, pady = 71,activebackground = "red",bd = 4,command = lambda: choice_process(7)).grid(row=1,column=2)
        button_eight = tk.Button(window, padx = 85, pady = 71,activebackground = "green",bd = 4,command = lambda: choice_process(8)).grid(row=2,column=2)
        button_nine = tk.Button(window, padx = 85, pady = 71,activebackground = "blue",bd = 4,command = lambda: choice_process(9)).grid(row=3,column=2)
        #SET_DEFAULTS
        process = sequence[point]
        if process == 1:
            button_one = tk.Button(window, padx = 85, pady = 71,bg = "green", activebackground = "green",bd = 4,command = lambda: choice_process(1)).grid(row=1,column=0)
            point += 1
        elif process == 2:
            button_two = tk.Button(window, padx = 85, pady = 71,bg = "red", activebackground = "red",bd = 4,command = lambda: choice_process(2)).grid(row=2,column=0)
            point += 1
        elif process == 3:
            button_three = tk.Button(window, padx = 85, pady = 71,bg = "blue", activebackground = "blue",bd = 4,command = lambda: choice_process(3)).grid(row=3,column=0)
            point += 1
        elif process == 4:
            button_four = tk.Button(window, padx = 85, pady = 71,bg = "cyan",activebackground = "cyan",bd = 4,command = lambda: choice_process(4)).grid(row=1,column=1)
            point += 1
        elif process == 5:
            button_five = tk.Button(window, padx = 85, pady = 71,bg = "yellow",activebackground = "yellow",bd = 4,command = lambda: choice_process(5)).grid(row=2,column=1)
            point += 1
        elif process == 6:
            button_six = tk.Button(window, padx = 85, pady = 71,bg = "magenta",activebackground = "magenta",bd = 4,command = lambda: choice_process(6)).grid(row=3,column=1)
            point += 1
        elif process == 7:
            button_seven = tk.Button(window, padx = 85, pady = 71,bg = "red",activebackground = "red",bd = 4,command = lambda: choice_process(7)).grid(row=1,column=2)
            point += 1
        elif process == 8:
            button_eight = tk.Button(window, padx = 85, pady = 71,bg = "green",activebackground = "green",bd = 4,command = lambda: choice_process(8)).grid(row=2,column=2)
            point += 1
        elif process == 9:
            button_nine = tk.Button(window, padx = 85, pady = 71,bg = "blue",activebackground = "blue",bd = 4,command = lambda: choice_process(9)).grid(row=3,column=2)
            point += 1
# FUNCTIONS
def choice_process(item):
    user_sequence.append(item)
    user_sequence_lenght = len(user_sequence)
    sequence_lenght = len(sequence)                    
    if user_sequence_lenght == sequence_lenght:
        if user_sequence == sequence:
            user_sequence.clear()
            score_accumulation()
        elif user_sequence != sequence:
            window.config(bg= "red")
            button_start.config(text = "TRY AGAIN!!!")

def start_game_process():
    window.resizable(0,0)
    window.geometry("540x550")
    window.config(bg = "white")
    button_start.config(text = "RESTART")
    score_list.clear()
    sequence.clear()
    user_sequence.clear()
    score = sum(score_list)
    Label2 = tk.Label(window, padx = 20, pady = 10,bg = "white", text = "SCORE:{}".format(score),font=BOLD).grid(row = 0, column = 1)
    sequence_for_user()

def score_accumulation():
    window.config(bg = "#00FF66")
    score_list.append(1)
    record = sum(record_list)
    score = sum(score_list)
    if score > record:
        record_list.clear()
        for i in range(score):
            record_list.append(1)
            record = sum(record_list)
            Label1 = tk.Label(window, padx = 20, pady = 10, bg = "white",text = "RECORD:{}".format(record),font=BOLD).grid(row = 0, column = 0)
    Label2 = tk.Label(window, padx = 20, pady = 10,bg = "white", text = "SCORE:{}".format(score),font=BOLD).grid(row = 0, column = 1)
    sequence_for_user()

#START BUTTON, LABELS & HIDDEN SUM BOX
Label1 = tk.Label(window, padx = 20, pady = 10, bg = "white", text = "RECORD:{}".format(0),font=BOLD).grid(row = 0, column = 0)
Label2 = tk.Label(window, padx = 20, pady = 10,bg = "white", text = "SCORE:{}".format(0),font=BOLD).grid(row = 0, column = 1)
button_start = tk.Button(window, padx = 15, pady = 5, text = "START", bd = 7,bg = "white",fg = "black", font = "bold", command = lambda: start_game_process())
button_start.grid(row = 0, column = 2)

window.mainloop()