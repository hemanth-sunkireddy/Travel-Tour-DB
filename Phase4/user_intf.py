import subprocess as sp
import pymysql
import pymysql.cursors

def execute_query(query):
    try:
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print(">>>>>>>>>>>>>", e)
    return

def option2():
    lang = input("enter the language of tour guide: ")
    query= "select * from Tour_Guide where Tour_Guide.Guide_ID in(select Guide_ID from Languages_Spoken as A where A.Languages_Spoken= '%s')" % (lang) 
    execute_query(query)
    return

def option3():
    query="select Destination_name as destination,Place_Name as place from Customizable_Places"
    execute_query(query)
    return

def option4():
    query="select Hotel_Name,Hotel_Rating from Customizable_Hotel"
    execute_query(query)
    return

def option5():
    dest = input("enter the destination for package: ")
    query="SELECT * FROM  Tour_Packages WHERE Destination = %s ORDER BY Price ASC LIMIT 1" % (dest)
    execute_query(query)
    return

def option6():
    given_month = input("enter the month : ")
    given_year = input("enter the year : ")

    query="select sum(Amount_due) from Bookings2 where Year= given_year and Month= given_month"
    execute_query(query)
    return

def option7():
    print("Option 7")
    return

def option8():   
    print("Option 8")
    return

def option9():
    query="select Rating,Comments, Day, Month,Year, Package_ID from(Reviews_and_Feedback2 as A join Reviews_and_Feedback1 as B on A.Review_ID=B.Review_ID ) "
    execute_query(query)
    return

def option10():
    query="select First_Name,Second_Name,count(*) as total_customers_assisted from(Travel_Agents as A left join Tourists as B on A.Agent_ID=B.Agent_ID ) group by A.Agent_ID"
    execute_query(query)
    return

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

    dest = input("enter the destination for package: ")
    query= "select * from Tour_Packages where  Destination == '%s'" % (dest) 
    #     ## or "select * from (Tour_Packages join Places on Tour_Packages.Package_ID = Places.Package_ID) where  Destination == '%s' " % (dest) 
    execute_query(query)

    return

# Add a new tour guide
def option11():
    fname=input("Enter first name of tour guide: ")
    sname=input("Enter second name: ")
    identity_type=input("Enter identity type: ")
    identity_number=input("Enter identity number: ")
    gender=input("Enter gender (M/F): ")
    contact_number=int(input("Enter 10-digit contact number: "))
    serving_destination=input("Enyrt serving destination: ")
    availability=int(input("Is the guide avaialbale (0/1): "))
    query=f"insert into Tour_Guide(First_Name,Second_Name,Identity_Type,Identity_Number,Gender,Contact_Number,Serving_Destination,Availability_Status) values({fname},{sname},{identity_type},{identity_number},{gender},{contact_number},{serving_destination},{availability})"
    execute_query(query)
    return

# Add a new customizable hotel
def option12():
    hname=input("Enter hotel name: ")
    hrating=int(input("Enter the rating of hotel: "))
    day_price=int(input("Enter one day price: "))
    night_price=int(input("Enter one night price: "))
    query=f"insert into Customizable_Hotel(Hotel_Name,Hotel_Rating,Day_Price,Night_Price) values({hname},{hrating},{day_price},{night_price})"
    execute_query(query)
    return
    
# Update rating of a tour guide
def option13():
    guide_id=int(input("Enter guide id: "))
    rating=int(input("Enter rating for the guide: "))
    query=f"update Tour_Guide set Rating={rating} where Guide_ID={guide_id}"
    execute_query(query)
    return
    
# Update price of customizable hotel
def option14():
    hotel_id=int(input("Enter hotel id: "))
    day_price=int(input("Enter updated day price: "))
    night_price=int(input("Enter updated night price: "))
    query=f"update Customizable_Hotel set Day_Price={day_price}, Night_Price={night_price} where Hotel_ID={hotel_id}"
    execute_query(query)
    return
    
# Remove an agent from Travel_Agents table
def option15():
    agent_id=int(input("Enter travel agent id: "))
    query=f"delete from Travel_Agents where Agent_ID={agent_id}"
    execute_query(query)
    return
    
# Remove a hotel from Customizable_Hotel table
def option16():
    hotel_id=int(input("Enter hotel id: "))
    query=f"delete from Customizable_Hotel where Hotel_ID={hotel_id}"
    execute_query(query)
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
    
    # # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="gopi",
                              password="abcde54321#",
                              db='phase4',
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
        
                print("1. Available packages for a destination")  
                print("2. View tour guides based on the language selection")  

                # projection

                print("3. Available destination and their places") 
                print("4. Hotel name and Rating") 

                #aggregate

                print("5. Minimum priced package for a destination") 
                print("6. Total payment due for a month of year") 

                # search
                print("7. View all the tour guides having their ids starting with some number")
                print("8. View all the tourists having their ids starting with some number")

                #analysis

                print("9. Reviews and feedback on packages") 
                print("10. Total customers assisted by travel agents") 

                # insert

                print("11. Add a new tour guide") 
                print("12. Add a new hotel")

                # update

                print("13. Update rating of tour guide") 
                print("14. Update day and night price of hotel") 

                # delete

                print("15. Remove a travel agent") 
                print("16. Remove a hotel")  


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
