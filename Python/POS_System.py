import sys
import csv
import random
from datetime import date

User_Name = 'username'
Password = 'password'
Login_Count = 0

global cart, sale_return_register
cart = {}
sale_return_register = []

class Item:
    def __init__(self, UPC, Description, Item_Max_Qty, Order_Threshold, Replenishment_order_qty, Item_on_hand,Unit_price, Order_placed):
        self.UPC = UPC
        self.Description = Description
        self.Item_Max_Qty = Item_Max_Qty
        self.Order_Threshold = Order_Threshold
        self.Replenishment_order_qty = Replenishment_order_qty
        self.Item_on_hand = Item_on_hand
        self.Unit_Price = Unit_price
        self.Order_placed = Order_placed
class Store:
    items = {}
    def __init__(self, filename):
        self.filename = filename

        fp = open(self.filename)
        fp.readline()
        for txt in fp:
            split_txt = txt.split(",")
            item = Item(split_txt[0], split_txt[1], split_txt[2], split_txt[3], split_txt[4], split_txt[5],
                        split_txt[6], 0)
            self.items[split_txt[0]] = item
class SaleItem:
    def __init__(self, receipt, UPC, Description, Qty, Unit_Price, TotalPrice, ReturnQty, Date):
        self.receipt = receipt
        self.UPC = UPC
        self.Description = Description
        self.Qty = Qty
        self.Unit_Price = Unit_Price
        self.TotalPrice = TotalPrice
        self.ReturnQty = ReturnQty
        self.Date = Date

class Sale_Details:
    sales = []

    def __init__(self, receipt, UPC, Description, Qty, Unit_Price, TotalPrice, ReturnQty, Date, Trans_type):
        saleItem = SaleItem(receipt, UPC, Description, Qty, Unit_Price, TotalPrice, ReturnQty, Date)
        self.sales.append(saleItem)

def Replenish_Order(upc):
    print("Order Replenishment.")
    if float(mystore.items[upc].Item_on_hand) <= float(mystore.items[upc].Order_Threshold):
        file_name = "Order_" + str(random.randint(1, 10000)) + "_" + str(upc) + "_" + str(date.today()) + ".csv"
        order = 'UPC,Qunatity,Date\n'
        order = order + str(upc) + ',' + str(mystore.items[upc].Item_Max_Qty) + ',' + str(date.today())
        f = open(file_name, 'w')
        writer = csv.writer(f)
        writer.writerow([order])
        f.close()

def Inventory_Update(upc, qty, transaction):
    if transaction == "sale":
        mystore.items[upc].Item_on_hand = float(mystore.items[upc].Item_on_hand) - float(qty)
    if transaction == "return":
        mystore.items[upc].Item_on_hand = float(mystore.items[upc].Item_on_hand) + float(qty)

def Return_Items():
    print("Return Item/s.")
    receipt_num = input("\n\nPlease enter the receipt number: ")
    #  validate if receipt is valid
    receipt_check = False
    for i in Sale_Details.sales:
        if receipt_num == str(i.receipt):
            receipt_check = True

    if receipt_check == False:
        print("receipt doesn't exist.")
    else:
        Return_options = input("\n\n1. Return Single Item, 2. Return All Items: ")
        while True:
            if Return_options == "1":  # call single item return
                Return_UPC_No = input("\n\nPlease enter UPC to be returned: ")
                for r in Sale_Details.sales:
                    print(r.receipt, " ", r.UPC)
                    if receipt_num == str(r.receipt) and Return_UPC_No == str(r.UPC):
                        print("You entered: ", r.Description)
                        Return_Quantity = input("\n\nPlease enter quantity: ")
                        if (int(Return_Quantity) > int(r.Qty) - int(r.ReturnQty)):
                            print("Item quantity can't be more than sold quantity.")
                        else:
                            print("Returned Amount: ", float(Return_Quantity) * float(r.Unit_Price))
                            r.ReturnQty = r.ReturnQty + int(Return_Quantity)
                            Inventory_Update(Return_UPC_No, Return_Quantity, "return")

            if Return_options == "2":
                Return_confirmation = input("\n\n Are you sure you want to return all items? y = yes, n = No = " )
                if Return_confirmation == "y" or "Y":
                    for r in Sale_Details.sales:
                        if receipt_num == str(r.receipt):
                            print("You entered: ", r.Description)
                            total_qty = int(r.Qty) - int(r.ReturnQty)

                            print("Returned Amount: ", float(total_qty) * float(r.Unit_Price))
                            r.ReturnQty = r.Qty
                            Inventory_Update(r.UPC, total_qty, "return")

            Load_Invertory()

def complete_sale():
    total = 0.0
    Receipt_no = random.randint(1, 1000000000)
    print("\n\nYour receipt number is: ", Receipt_no)
    print("\n---------------------------------------------------------------------------------------\n")
    print("Product Description".ljust(30, " "), "Item Quantity".ljust(15, " "), "Price".ljust(10, " "),"Total".ljust(10, " "),"\n---------------------------------------------------------------------------------------\n")
    for upc, qty in cart.items():
        print(mystore.items[upc].Description.strip().ljust(30, " "), qty.ljust(15, " "),
              mystore.items[upc].Unit_Price.ljust(10, " "),
              "{:.2f}".format((float(mystore.items[upc].Unit_Price) * float(qty))))
        total = total + float(mystore.items[upc].Unit_Price) * float(qty)
        Inventory_Update(upc, qty, "sale")
        obj = Sale_Details(Receipt_no, upc, mystore.items[upc].Description.strip(), qty,
                          mystore.items[upc].Unit_Price, float(mystore.items[upc].Unit_Price) * float(qty), 0,
                          '12/14/2021', "sale")
        Replenish_Order(upc)

    cart.clear()

    print("\n---------------------------------------------------------------------------------------\nYour total amount is: ",round(total, 2), "\n---------------------------------------------------------------------------------------\n")
    Load_Invertory()

def New_Sale():
    Return_UPC_No_id = input("Please enter the UPC: ")
    print("You entered: ", mystore.items[Return_UPC_No_id].Description)

    Return_Quantity = input("Please enter quantity: ")
    print("The price is: ", "{:.2f}".format(float(mystore.items[Return_UPC_No_id].Unit_Price) * float(Return_Quantity)))
    cart[Return_UPC_No_id] = Return_Quantity

    while True:
        Return_options = input("\n\n1 = Sell another item, 2 = Return Item/s, 9 = Complete Sale: ")
        if Return_options == "1":
            New_Sale()
        if Return_options == "2":
            Return_Items()
        if Return_options == "9":
            complete_sale()
def backroom_operation():
    print("\n\nBackroom Operations.")
    int_num = input("\n1 = Create Orders for Replenishment, 2 = Print Inventory Report, 3 = Create Todays Item Sold Report, 9 = Back to home: ")

    while True:
        if int_num == "1":
            print("Order Replenishment.")
        if int_num == "2":
            print("\n---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nInventory Report\n---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n")
            print("UPC".ljust(15, " "), "PRODUCT".ljust(50, " "), "MAX QTY".ljust(20, " "),
                  "THRESHOLD QTY".ljust(20, " "), "RPLNSMT QTY".ljust(20, " "), "ITEM ON HAND QTY".ljust(20, " "),
                  "UNIT PRICE".ljust(10, " "), "ORDER PLACED QTY".ljust(20, " "))
            print("\n---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n")
            for i in mystore.items:
                print(mystore.items[i].UPC.ljust(15, " "), mystore.items[i].Description.strip().ljust(50, " "),
                      mystore.items[i].Item_Max_Qty.ljust(20, " "), mystore.items[i].Order_Threshold.ljust(20, " "),
                      mystore.items[i].Replenishment_order_qty.ljust(20, " "),
                      mystore.items[i].Item_on_hand.ljust(20, " "), mystore.items[i].Unit_Price.ljust(10, " "),
                      mystore.items[i].Order_placed)
            print("\n---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n")
            Load_Invertory()

        if int_num == "3":
            total_sale = 0.00
            print("\n\n-------------------------------------------------------------------------------------------------------------------------\nTodays Item Sold Report.\n-------------------------------------------------------------------------------------------------------------------------\n")
            print("receipt No".ljust(15, " "), "UPC".ljust(15, " "), "PRODUCT".ljust(30, " "), "QTY".ljust(10, " "),
                  "UNIT PRICE".ljust(10, " "), "TOTAL SALE".ljust(10, " "), "ITEM RETURNED".ljust(10, " "),
                  "DATE".ljust(10, " "))
            print("\n-------------------------------------------------------------------------------------------------------------------------\n")
            # print(sale_return_register.count())
            for i in Sale_Details.sales:
                print(str(i.receipt).ljust(15, " "), str(i.UPC).ljust(15, " "), i.Description.strip().ljust(30, " "),
                      str(i.Qty).ljust(10, " "), str(i.Unit_Price).ljust(10, " "), str(i.TotalPrice).ljust(10, " "),
                      str(i.ReturnQty).ljust(10, " "), str(i.Date).ljust(10, " "))
                total_sale = total_sale + float(i.TotalPrice)
            print("\n\n-------------------------------------------------------------------------------------------------------------------------\nTotal Todays Sale: ",total_sale,"\n-------------------------------------------------------------------------------------------------------------------------\n")
            Load_Invertory()
        if int_num == "9":
            print("POSS System.")
            Load_Invertory()

def Load_Invertory():
    global mystore
    mystore = Store("RetailStore.txt")

    int_num = input("\n\nPlease select your options \n1 = New Sale, 2 = Return Item, 3 = Backroom Operations, 9 = Exit Application: ")
    while True:
        if int_num == "1":
            print("New Sale.")
            New_Sale()
            break
        elif int_num == "2":
            Return_Items()
            break
        elif int_num == "3":
            backroom_operation()
            break
        elif int_num == "9":
            print("Signed out Successfully.")
            sys.exit()
            break
        else:
            print("Not a valid input, please enter correct input to operate.")
            Load_Invertory()
def LoginPage():
    global Login_Count

    print("\nWelcome to a Simple Point-of-Sale (POS) System \n")

    input_UId = input("Please Enter Your Username : ")
    input_Password = input("Please Enter Your Password: ")
    if input_UId == User_Name and input_Password == Password:
        Load_Invertory()

    else:
        Login_Count = Login_Count + 1
        if Login_Count >= 3:
            print(input_UId, " Your Account has been locked out. Please contact your system admin.")
        else:
            print("UserID and Password doesn't match, please try again. \n")
            LoginPage()


LoginPage()
