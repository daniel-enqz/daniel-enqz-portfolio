def BUSINESS_PROGRAMMING_FINAL_PROJECT_LEGO_PERDORMANCE():
        #IMPORTS_____________________________________________________________________
        import pandas as pd
        from mpl_toolkits.mplot3d import Axes3D
        import matplotlib.pyplot as p
        import numpy as np
        import statistics as st

        #CLASSES_____________________________________________________________________
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
        #STYLES______________________________________________________________________
        table = pd.read_excel("abc.xlsx")
        stylyy = p.style.use('ggplot')
        country = table["PLACE"]
        sales2019 = table ["SALESB"]
        sales2020 = table ["SALESN"]
        franchise = table ["FRANCHISE"]
        sety = table ["SET"]
        price = table ["PRICE"]
        salesS = table ["SALESS"]
        year = table["YEAR"]
        employees = table ["EMPLOYEES"]
        correct = "kolita"
        #FUNCTIONS__________________________________________________________________
        def data():
            def stats():
                    #--------CODE
                    #--------2019 (SALES PER COUNTRY)
                    LATobtain2019 = table.groupby("AREA").get_group("LAT")
                    LAT2019 = LATobtain2019["SALESB"]
                    AvSales2019 = LAT2019.mean()
                    MaxCountry_Sales2019 = np.max(sales2019)
                    MinCountry_Sales2019 = np.min(sales2019)
                    MeanGlobCountries2019 = st.mean(sales2019)
                    StdGlobCountries2019 = st.stdev(sales2019)
                    #--------2020 (SALES PER COUNTRY)
                    LATobtain2020 = table.groupby("AREA").get_group("LAT")
                    LAT2020 = LATobtain2020["SALESN"]
                    AvSales2020 = LAT2020.mean()
                    MaxCountry_Sales2020 = np.max(sales2020)
                    MinCountry_Sales2020 = np.min(sales2020)
                    MeanGlobCountries2020 = st.mean(sales2020)
                    StdGlobCountries2020 = st.stdev(sales2020)
                    #--------2019 (SET PRICES AND SALES)
                    Max_F_Price = np.max(price)
                    MaxQuantitySales = np.max(salesS)
                    MinQuantitySales = np.min(salesS)
                    StdevPrices = st.stdev(price)
                    AvSales_F = st.mean(salesS)
                    #-------EMPLOYEES
                    MaxEmployees = np.max(employees)
                    MinEmployees = np.min(employees)
                    MeanEmployes = st.mean(employees)

                    #--------DISPLAY
                    #--------INTRODUCTION
                    print(color.BOLD+color.GREEN+"Hey, here you will find some stats abourt Lego's performance during 2019 and 2020, check them out"+color.END)
                    ent1 = input(color.BOLD+color.GREEN+"Please, click enter to coninue"+color.END)

                    #--------2019 (SALES PER COUNTRY DISPLAYED)
                    ent2 = input(color.BOLD+color.CYAN+"In this first section you will appreciate data about the Sales of the company in different countries in 2019"+color.END)
                    print(color.BOLD+"First of all, let's analyze the average sales in Latinoamerica"+color.END)
                    ent3 = input(f"--Lego had {AvSales2019} average sales in Latinoamerica during 2019")
                    ent4 = input(color.BOLD+"Now, let's see data of their sales all around the globe, covering 34 countries"+color.END)
                    print("--Lego had a max sales number of",MaxCountry_Sales2019)
                    print("--Lego had a min sales number of",MinCountry_Sales2019)
                    print("--Also, talking about the Global Sales Average, the company achieved an amazing number of",MeanGlobCountries2019,"per country")
                    ent4 = input(f"--Finally, the standad deviation of their sales Worldwide was {StdGlobCountries2019}")

                    #--------2020 (SALES PER COUNTRY DISPLAYED)
                    ent5 = input(color.BOLD+color.CYAN+"In this second section you will appreciate data about the Sales of the company in different countries in 2020"+color.END)
                    print(color.BOLD+"First of all, let's analyze the average sales in Latinoamerica"+color.END)
                    ent6 = input(f"--Lego had {AvSales2020} average sales in Latinoamerica during 2019")
                    ent7 = input(color.BOLD+"Now, let's see data of their sales all around the globe, covering 34 countries"+color.END)
                    print("--Lego had a max sales number of",MaxCountry_Sales2020)
                    print("--Lego had a min sales number of",MinCountry_Sales2020)
                    print("--Also, talking about the Global Sales Average, the company achieved an amazing number of",MeanGlobCountries2020,"per country")
                    ent8 = input(f"--Finally, the standad deviation of their sales Worldwide during 2020 was {StdGlobCountries2020}")

                    #--------2020 (SET PRICES AND SALES DISPLAYED)
                    ent9 = input(color.BOLD+color.CYAN+"Excellent, now click enter to display information about the performance of Lego franchises from June 2019 to July 2020"+color.END)
                    print("--The max price lego had from a product was", Max_F_Price)
                    print("--The company had an amazing number of sales of", MaxQuantitySales)
                    print("--Lego had an standard deviation in their 2020 prices", StdevPrices)
                    print("--The average of Lego sales in 12 months of operation was", AvSales_F)
                    ent10 = input(f"--The lower sales number was of {MinQuantitySales}")

                    #-------Employees
                    ent11 = input(color.BOLD+color.CYAN+"Now let's display some data about the employees from January 2018 to October 2020"+color.END)
                    print("--The HIGHEST number of employees on a working month in Lego was", MaxEmployees)
                    print("--The MINIMUM number of employees on a working month in Lego was", MinEmployees)
                    ent12 = input(f"--THE AVERAGE number of employees in lego since January 2018 tu the present day is {MeanEmployes}")

                    #--------CONCLUSION
                    print(color.BOLD+color.GREEN+"Excellent"+color.END, color.BOLD+"That was the first part of Lego's data"+color.END)
                    print("Are you willing to continue?")
                    continue_1 = input(color.BOLD+color.RED+"YES or NO ----->"+color.END)
                    if continue_1 == "YES":
                        graphs()
                        print(table)
                    elif continue_1 != "YES":
                        print(color.BOLD+color.GREEN+"Thank you, you can check data again by typing the correct password"+color.END)
                        Log_in()
            def graphs():
                def first_graph():
                    #FRANCHISES SALES GRAPH ONE
                    p.subplot(221)
                    p.xlabel("lego Franchises")
                    p.ylabel("Sales 2020")
                    p.title("What franchise is having more sales during this year?")
                    barlist=p.bar(franchise,salesS)
                    barlist[0].set_color("#18cdec")
                    barlist[1].set_color("#03ab96")
                    barlist[2].set_color("#008ba3")
                    barlist[3].set_color("#1894ec")
                    barlist[4].set_color("#1861ec")
                    barlist[5].set_color("#18cdec")
                    barlist[6].set_color("#03ab96")
                    barlist[7].set_color("#008ba3")
                    barlist[8].set_color("#1894ec")
                    barlist[9].set_color("#1861ec")
                    barlist[10].set_color("#18cdec")
                    barlist[11].set_color("#03ab96")
                    barlist[12].set_color("#008ba3")
                    barlist[13].set_color("#1894ec")
                    barlist[14].set_color("#1861ec")
                    barlist[15].set_color("#18cdec")
                    barlist[16].set_color("#03ab96")
                    barlist[17].set_color("#008ba3")
                    barlist[18].set_color("#1894ec")
                    barlist[19].set_color("#1861ec")
                    barlist[20].set_color("#18cdec")
                    barlist[21].set_color("#03ab96")
                    barlist[22].set_color("#008ba3")
                    barlist[23].set_color("#1894ec")
                    barlist[24].set_color("#1861ec")
                    barlist[25].set_color("#18cdec")
                    barlist[26].set_color("#03ab96")
                    barlist[27].set_color("#008ba3")
                    barlist[28].set_color("#1894ec")
                    barlist[29].set_color("#1861ec")
                    barlist[30].set_color("#18cdec")
                    barlist[31].set_color("#03ab96")
                    barlist[32].set_color("#008ba3")
                    barlist[33].set_color("#1894ec")
                    p.xticks(rotation = 85)

                #CONTRY SALES GRAPH ONE
                    p.subplot(222)
                    p.xlabel("Country")
                    p.ylabel("Sales 2020")
                    p.title("What country is having more lego sales during this year?")
                    barlist2=p.bar(country,sales2020)
                    barlist2[0].set_color("#18cdec")
                    barlist2[1].set_color("#03ab96")
                    barlist2[2].set_color("#008ba3")
                    barlist2[3].set_color("#1894ec")
                    barlist2[4].set_color("#1861ec")
                    barlist2[5].set_color("#18cdec")
                    barlist2[6].set_color("#03ab96")
                    barlist2[7].set_color("#008ba3")
                    barlist2[8].set_color("#1894ec")
                    barlist2[9].set_color("#1861ec")
                    barlist2[10].set_color("#18cdec")
                    barlist2[11].set_color("#03ab96")
                    barlist2[12].set_color("#008ba3")
                    barlist2[13].set_color("#1894ec")
                    barlist2[14].set_color("#1861ec")
                    barlist2[15].set_color("#18cdec")
                    barlist2[16].set_color("#03ab96")
                    barlist2[17].set_color("#008ba3")
                    barlist2[18].set_color("#1894ec")
                    barlist2[19].set_color("#1861ec")
                    barlist2[20].set_color("#18cdec")
                    barlist2[21].set_color("#03ab96")
                    barlist2[22].set_color("#008ba3")
                    barlist2[23].set_color("#1894ec")
                    barlist2[24].set_color("#1861ec")
                    barlist2[25].set_color("#18cdec")
                    barlist2[26].set_color("#03ab96")
                    barlist2[27].set_color("#008ba3")
                    barlist2[28].set_color("#1894ec")
                    barlist2[29].set_color("#1861ec")
                    barlist2[30].set_color("#18cdec")
                    barlist2[31].set_color("#03ab96")
                    barlist2[32].set_color("#008ba3")
                    barlist2[33].set_color("#1894ec")
                    p.xticks(rotation = 75)

                #EMPLOYEES GRAPH ONE
                    p.subplot(414)
                    p.xlabel("Y")
                    p.ylabel("Employees")
                    p.title("What year Lego had more employees?")
                    p.plot(year,employees,"cp-")
                    p.xticks(rotation = 45)
                    p.show()
                    second_graph()

                def second_graph():
                #SALES COMPARISON 2019 - 2020
                    ent20 = input(color.BOLD+color.YELLOW+"Excellent! Press enter to display a pie chart, to appreciate the number of sales of 2019 vs 2020"+color.END)
                    all_sum2019 = sum(sales2019)
                    all_sum2020 = sum(sales2020)
                    sum2019_2020 = all_sum2019 + all_sum2020
                    percentage_2019 = (all_sum2019*100)/sum2019_2020
                    percentage_2020 = (all_sum2020*100)/sum2019_2020
                    labels = [2019,2020]
                    sizes = [percentage_2019,percentage_2020]
                    explode = (0, 0.1)
                    fig1, ax1 = p.subplots()
                    ax1.pie(sizes, explode=explode, labels=labels, autopct='%1.1f%%',
                    shadow=True, startangle=90)
                    ax1.axis('equal')
                    p.title("LEGO TOTAL SALES 2019 vs 2020")
                    p.show()
                #CHANGING DATA
                    ent43 = input(color.BOLD+color.BLUE+"GREAT! Press enter to see a new feature"+color.END)
                    def changing():
                        print(color.BOLD+"Data has been intresting so far"+color.END)
                        ent13 = input(color.BOLD+"Would you like to change some data to see what would happen with the pie graph you just saw?"+color.END)
                        print(color.CYAN+"First of all, what data would you like to change?\n1) 2019 Total Sales\n2) 2020 Total Sales"+color.END)
                        select_change = input(color.BOLD+color.CYAN+"---->"+color.END)
                        if select_change == "1":
                            print(color.BOLD+"Excellent, let's change some values for 2019 total Sales"+color.END)
                            brandNEW_sum2019 = int(input("What value would you like to give?---->"))
                            all_sum2019 = brandNEW_sum2019
                            all_sum2020 = sum(sales2020)
                            sum2019_2020 = all_sum2019 + all_sum2020
                            percentage_2019 = (all_sum2019*100)/sum2019_2020
                            percentage_2020 = (all_sum2020*100)/sum2019_2020
                            labels = [2019,2020]
                            sizes = [percentage_2019,percentage_2020]
                            explode = (0, 0.1)
                            fig1, ax1 = p.subplots()
                            ax1.pie(sizes, explode=explode, labels=labels, autopct='%1.1f%%',
                            shadow=True, startangle=90)
                            ax1.axis('equal')
                            p.title("LEGO TOTAL SALES 2019 vs 2020 (2019 Updated)")
                            p.show()
                            final()
                        elif select_change == "2":
                            print(color.BOLD+"Excellent, let's change some values for 2020 total Sales"+color.END)
                            brandNEW_sum2020 = int(input("What value would you like to give?---->"))
                            all_sum2019 = sum(sales2019)
                            all_sum2020 = brandNEW_sum2020
                            sum2019_2020 = all_sum2019 + all_sum2020
                            percentage_2019 = (all_sum2019*100)/sum2019_2020
                            percentage_2020 = (all_sum2020*100)/sum2019_2020
                            labels = [2019,2020]
                            sizes = [percentage_2019,percentage_2020]
                            explode = (0, 0.1)
                            fig1, ax1 = p.subplots()
                            ax1.pie(sizes, explode=explode, labels=labels, autopct='%1.1f%%',
                            shadow=True, startangle=90)
                            ax1.axis('equal')
                            p.title("LEGO TOTAL SALES 2019 vs 2020 (2020 Updated)")
                            p.show()
                            final()
                        else:
                            print(color.RED+"Please, type an existing number"+color.END)
                            changing()
                    def final():
                        print(color.BOLD+"Now, what do you want to do?\n1) Restart the program and see data again\n2) Update another variable for the pie chart\n3) Log Out"+color.END)
                        last = input(color.CYAN+"---->"+color.END)
                        if last == "1":
                           stats()
                        elif last == "2":
                           changing()
                        elif last == "3":
                           Log_in()
                        else:
                            print(color.RED+"Please, type an existing number"+color.END)
                            final()
                    changing()
                first_graph()
            stats()
        def Log_in():
            def password():
                    print(color.BOLD+"Please enter the correct password in order to show the data."+color.END)
                    password = input(color.BOLD+"----->"+color.END)
                    tries = 3
                    left = 4
                    while tries != 0:
                        if password == correct:
                            tries = 0
                            data()
                            print(table)
                        elif password != correct:
                            left = left -1
                            tries = tries - 1
                            print(color.YELLOW+color.BOLD+"You have",left,"chances left, please try again"+color.END)
                            password = input(color.BOLD+"----->"+color.END)
                            if tries == 0:
                                no_chances()
            def no_chances():
                    def password2(correct2):
                            print(color.BOLD+"Please enter the correct password in order to show the data."+color.END)
                            password = input(color.BOLD+"----->"+color.END)
                            tries = 3
                            left = 4
                            while tries != 0:
                                if password == correct2:
                                    tries = 0
                                    data()
                                    print(table)
                                elif password != correct2:
                                    left = left -1
                                    tries = tries - 1
                                    print(color.YELLOW+color.BOLD+"You have",left,"chances left, please try again"+color.END)
                                    password = input(color.BOLD+"----->"+color.END)
                                    if tries == 0:
                                        no_chances()
                    def questions():
                        print(color.RED+"you have no chances left, sorry bro :("+color.END)
                        print("If you want to try recovering your password type YES")
                        recover = input(color.YELLOW+"----->"+color.END)
                        if recover == "YES":
                            print(color.BLUE+"Please choose the security question you want to answer\n1)\n2)\n3)"+color.END)
                            question = input(color.YELLOW+"---->"+color.END)
                            if question == "1":
                                print("What's Paola surname?")
                                Ps = input(color.YELLOW+"----->"+color.END)
                                if Ps == "Bazán":
                                    correct2 = input(color.YELLOW+"Please reset your password"+color.END)
                                    tries = 3
                                    password2(correct2)
                                else:
                                    print("Your answer was incorrect, sorry the data will be protected")
                            elif question == "2":
                                print("What's Camila hair color?")
                                Ch = input(color.YELLOW+"----->"+color.END)
                                if Ch == "Yellow":
                                    correct2 = input(color.YELLOW+"Please reset your password"+color.END)
                                    tries = 3
                                    password2(correct2)
                                else:
                                    print("Your answer was incorrect, sorry the data will be protected")
                            elif question == "3":
                                print("What's Daniel favourite play?")
                                Dm = input(color.YELLOW+"----->"+color.END)
                                if Dm == "Hamilton":
                                    correct2 = input(color.YELLOW+"Please reset your password"+color.END)
                                    tries = 3
                                    password2(correct2)
                                else:
                                    print("Your answer was incorrect, sorry the data will be protected")
                            else:
                                print("The number you typed is incorrect, try again")
                                question = input(color.YELLOW+"---->"+color.END)
                        else:
                            print("Ok, the program will be closed and data will be protected")
                    questions()
            password()
        #DISPLAYED_____________________________________________________________________
        print(color.GREEN+color.BOLD+"Welcome to Analisis.com"+color.END)
        Log_in()
BUSINESS_PROGRAMMING_FINAL_PROJECT_LEGO_PERDORMANCE()
