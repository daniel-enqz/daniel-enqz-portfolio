import random

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
    

#LISTS
users_list = []
list = []
score = []
accurancy_list=[]
funny_names_list = ['Doggy','Curry','OptimusPrime','Sabino','47','Prodigy','PeterPan','Skrillex','Acapulco','Ratboy']

#Esta función, permite el ingreso de el número de jugadores que habrá en la partida, también avisa al jugador que jugar solo será aburrido
def number_of_players():
    print(color.BOLD+color.YELLOW+"\nNumber of players?")
    users_to_play = int(input("------->"+color.END))
    if users_to_play == 1:
        print(color.BOLD+color.PURPLE+"\nAre you sure you want to play alone? 2 or more will be more enojoyable...")
        print("Continue alone, type: C")
        print("Add friends, type: A")
        add_friends = input(("------>"+color.END))
        if add_friends == "C":
            from Guess_the_number import guess_number
        elif add_friends == "A":
            users_to_play = int(input(color.BOLD+color.YELLOW+"\nHow many friends do you want to add then?------->"+color.END))
            users_to_play += 1
            players_login(users_to_play)
    else:
        players_login(users_to_play)

#Esta función, permite el ingreso de el nombre de cada jugador, también da un valor 0 de puntaje para cada jugador. Los nombres son guardados en la lista users_list
#Da la posibilidad de añadir nombres graciosos a los jugadores.
def players_login(users_to_play):
    print("\n")
    player = 0
    for i in range (users_to_play):
        player += 1
        assign_user = str(input(color.BOLD+color.CYAN+"Player{} Nickname---->".format(player)+color.END))
        users_list.append(assign_user)
        score.append(0)
        accurancy_list.append(0)
    print(color.BOLD+color.CYAN+"\nAre you ready players? Type 'r' to add funny names to each player, or just enter to continue")
    funny_names = input("------>"+color.END)
    player = 0
    if funny_names == 'r':
        for i in range(users_to_play):
            users_list[player] += random.choice(funny_names_list)
            player += 1
        main_game(users_to_play)
    else:
        main_game(users_to_play)

#Esta función, crea el proceso del juego con el usuario, da resultados ganadores y puede generar un score final
def main_game(users_to_play):
    print(color.BLANCO+color.BOLD+"\nGreat, each player will need to give a value, the one that's closest to the random generated value (0-100) WINS!!!"+color.END)
    point = 0
    a = random.randint(1,100)

    #Esta parte de la función añade el valor que da cada usuario, busca que cada valor agregado a la lista sea positivo,
    for i in range(users_to_play):
        player_value = int(input(color.BOLD+color.PURPLE+"\n{}\nYour Turn!!!---->".format(users_list[point])+color.END))
        if player_value < a:
            value_to_append = (a - player_value)
        elif player_value > a:
            value_to_append = (player_value - a)
        elif player_value == a:
            value_to_append = 0
        list.append(value_to_append)
        point += 1
    
    #Esta parte de la función main_game, ubica cual es el índice de la lista (list) con el valor más bajo, reconoce ese valor como ganador, menciona cual había
    #sido el valor random generado y añade un punto al índice o jugador ganador. También muestra la presición del jugador en la reonda con base en el valor generado.
    min_value = min(list)
    index = list.index(min_value)
    accurancy = (100-min_value)
    point = (input(color.BOLD+color.GREEN+"\nPress enter to see the winner!!!"))
    print("\nGREAT!!! the value generated was"+color.END,color.BOLD + color.BLANCO+"{}".format(a)+color.END)
    print(color.BOLD+color.GREEN+"Congratulations!!!"+color.END, color.BOLD+color.BLANCO+"{}".format(users_list[index])+color.END, 
        color.BOLD+color.GREEN+"you won this round"+color.END)
    print(color.BOLD+color.GREEN+"Your accurancy was from"+color.END, color.BOLD+color.BLANCO+"{}%".format(accurancy)+color.END)
    score[index] += 1
    accurancy_list[index] += accurancy

    #Esta parte de la función, pregunta al usuario si desea jugar de nuevo, si esto es así, primero limpia los valores dados previamnete por los usuarios de la lista
    #(list) y llama nuevamente la función main_game, para inicar el juego. En casoi de que decida ver los resultados finales, muestra los puntos acumulados de cada jugador
    #y muestra su presición acumulada en todas las rondas.
    play_again = input(color.RED+color.BOLD+"\nType ENTER to run another round or 'r' to show FINAL RESULTS!!!! "+color.END)
    point = 0
    if play_again == "r":
        print("\n")
        for i in range(users_to_play):
            if score[point] == 0:
                 accurancy_value = accurancy_list[point]
            elif score[point] > 0:
                accurancy_value = accurancy_list[point]/score[point]
            formatted_string = "{:.2f}".format(accurancy_value)
            float_value = float(formatted_string)
            print(color.BOLD+color.BLUE+"{} Points:".format(users_list[point])+color.END,color.BOLD+color.BLANCO+"{}".format(score[point])+color.END, 
            color.BOLD+color.CYAN+" Your accurancy was from"+color.END,color.BOLD+color.BLANCO+"{}%".format(float_value)+color.END)
            point += 1
    else:
        list.clear()
        main_game(users_to_play)

number_of_players()