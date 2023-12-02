import subprocess as sp
import pymysql
import pymysql.cursors


def option2():
    
    lang = input("enter the language of tour guide: ")
    query= "select * from Tour_Guide where Tour_Guide.Guide_ID in(select Guide_ID from Languages_Spoken as A where A.Languages_Spoken= '%s')" % (lang) 


def option3():
    query="select Destination_name as destination,Place_Name as place from Customizable_Places"


def option4():
    query="select Hotel_Name,Hotel_Rating from Customizable_Hotel"

def option5():
    dest = input("enter the destination for package: ")
    query="SELECT * FROM  Tour_Packages WHERE Destination = %s ORDER BY Price ASC LIMIT 1" % (dest)


def option6():
    given_month = input("enter the month : ")
    given_year = input("enter the year : ")

    query="select sum(Amount_due) from Bookings2 where Year= given_year and Month= given_month"



def option7():
    print("Option 7")

def option8():   
    print("Optino 8")

def option9():
    query="select Rating,Comments, Day, Month,Year, Package_ID from(Reviews_and_Feedback2 as A join Reviews_and_Feedback1 as B on A.Review_ID=B.Review_ID ) "
def option10():
    query="select First_Name,Second_Name,count(*) as total_customers_assisted from(Travel_Agents as A left join Tourists as B on A.Agent_ID=B.Agent_ID ) group by A.Agent_ID"




def option1():
    """
    This is a sample function implemented for the refrence.
    This example is related to the Employee Database.
    In addition to taking input, you are required to handle domain errors as well
    For example: the SSN should be only 9 characters long
    Sex should be only M or F
    If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
    HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new employee's details: ")
        name = (input("Name (Fname Minit Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Minit"] = name[1]
        row["Lname"] = name[2]
        row["Ssn"] = input("SSN: ")
        row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
        row["Address"] = input("Address: ")
        row["Sex"] = input("Sex: ")
        row["Salary"] = float(input("Salary: "))
        row["Dno"] = int(input("Dno: "))

        query = "INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Dno) VALUES('%s', '%c', '%s', '%s', '%s', '%s', '%c', %f, %d)" % (
            row["Fname"], row["Minit"], row["Lname"], row["Ssn"], row["Bdate"], row["Address"], row["Sex"], row["Salary"], row["Dno"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    try:
        dest = input("enter the destination for package: ")
        query= "select * from Tour_Packages where  Destination == '%s'" % (dest) 
        ## or "select * from (Tour_Packages join Places on Tour_Packages.Package_ID = Places.Package_ID) where  Destination == '%s' " % (dest) 
        
    except: 
        print("Nothing if try fails it comes to except")

    return

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        option1()
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    if(ch == 5):
        option5()
    elif(ch == 6):
        option6()
    elif(ch == 7):
        option7()
    elif(ch == 8):
        option8()
    if(ch == 9):
        option9()
    elif(ch == 10):
        option10()
    elif(ch == 11):
        option11()
    elif(ch == 12):
        option12()
    if(ch == 13):
        option13()
    elif(ch == 14):
        option14()
    elif(ch == 15):
        option15()
    elif(ch == 16):
        option16()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="gopi",
                              password="abcde54321#",
                              db='TRAVEL_AGENCY',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # selection
        
                print("1. available packages for a destination")  
                print("2. tour guide speaking a language")  

                # projection

                print("3. Available destination and their places") 
                print("4. Hotel name and Rating") 

                #aggregate

                print("5. minimum priced package for a destination") 
                print("6. total payment due for a month of year") 

                # search



                #analysis

                print("9. reviews and feedback on packages") 
                print("10. total customers assisted by travel agents") 

                # insert

                print("11. add a new tour guide") 
                print("12. add a new hotel")

                # update

                print("13. update rating of tour guide") 
                print("14. update day and night price of hotel") 

                # delete

                print("15. remove a travel agent") 
                print("16. remove a hotel")  


                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 5:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")