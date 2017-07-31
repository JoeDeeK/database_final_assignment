# database_final_assignment
Database final assignment with PL/SQL, working with triggers and procedures.


The files in this directory provide a the items on the DBAS32100 final assignment.
The directory contains 10 scripts, 1 of which are procedures, 1 for triggers, 1 menu text file, 1 menu shell script
and 6 sql files which call the procedures.
Procedures, and triggers scripts must be executed before in order to create objects in user's schema.
To execute the program the user must be in the same directory where the scripts reside, or provide the appropriate 
path to the main shell script called menu:
tcsh menu
......................
If the user selects 'a' they can create customer. The menu script calls a.sql to add a customer. a.sql uses 
enter_new_customer procedure by passing in all of the required input for the customer table as IN parameters. 
Here is an example of program execution:

Enter Customer Name: Jody Kirton
Enter Street: 123 Lake Shore Blvd West
Enter City: Etobicoke
Enter Province: ON
Enter Postal: M8V1G1
Enter Home Phone Number: 4161112222
Enter Business Phone Number: 4162223333

New Customer has been added to the customer table

Press any key to continue .....
.......................
If the user selects 'b' they can inquire a customer. The menu script calls b.sql to inquire a customer. b.sql 
uses display_customer procedure by passing in a customer name required as IN parameter. OUT parameters include 
a customer ROWTYPE. 
Here is an example of program execution:

Enter a Customer Name: Jody Kirton

----------- Customer Information -----------
Name: Jody Kirton 
Address: 123 Lake Shore Blvd West
		 Etobicoke 		ON
		 M8V1G1
Phone:  4161112222  4162223333

Press any key to continue .....
.......................
If the user selects 'c' they can create a new invendory. The menu script calls c.sql to create a new inventory. 
c.sql uses enter_new_car procedure by passing in all of the required input for the car table as IN parameters.
Here is an example of program execution:

Enter Car Serial Number: A12D23E5
Enter Customer Name: Jody Kirton
Enter Car Make: ACURA
Enter Car Model: RSX
Enter Car Year: 2016
Enter Car Color: Red
Enter Car Trim: Black
Enter Car Engine Type: V8
Enter Purchase Invoice Number: I00017
Enter Purchase Date: 12-MAY-12
Who was the vehicle purchased from? Enter seller: ACURA
Enter Purchase Cost: 60000
Enter Freight Cost: 1000
Enter Total Cost of vehicle: 61000
Enter vehicle list price: 59000

New Vehicle successfully added into Inventory

Press any key to continue .....
.......................
If the user selects 'd' they can inquire a inventory. The menu script calls d.sql to inquire a inventory. d.sql
uses display_vehicle procedure by passing in the car serial number as IN parameters. OUT parameters include a vehicle 
ROWTYPE and options SYS_REFCURSOR.
Here is an example of program execution:

Enter Car Serial Number: A12D23E5

		--Vehicle Inventory Record--

Serial Number |   Make    |  Model   | Year | Exterior Color |  Trim
A12D23E5        ACURA        RSX       2016   RED              Black

	Optional Equipment and Accessories - Factory

Code   |  Description            | List Price
DR2		   Radio Full Sound			      240.43
DT3      Steel Rims                 540.34

Press any key to continue .....
.......................
If the user selects 'e' they can create a new sales invoice. The menu script calls e.sql to create a new sales 
invoice. e.sql uses enter_new_sale procedure by passing in all the required input for the saleinv table as IN 
parameters. 
Here is an example of program execution:

Enter Customer Name: Jody Kirton
Enter Salesman Name: Adam Adams
Enter Sales Date: 12-MAY-13
Enter Car Serial Number: A12D23E5
Enter Total Price: 61000
Enter discount: 1000
Enter Net: 3500.00 
Enter Tax: 1342.23 
Enter License Fee: 200
Enter Commission: 1000 
Enter Trade Serial: A13231DD
Enter Trade in Allowance: 2000
Enter Y for yes, or N for no. Does the vehicle have fire insurance? Y
Enter Y for yes, or N for no. Does the vehicle have collision insurance? N
Enter Y for yes, or N for no. Does the vehicle have liability insurance? Y
Enter Y for yes, or N for no. Does the vehicle have property insurance? Y

New Sales Record successfully added to Sales Invoice

Press any key to continue .....
.......................
If the user selects 'f' they can inquire a sales invoice. The menu script calls f.sql to inquire a sales invoice. f.sql
uses display_saleinv procedure by passing in a sale invoice number as a IN parameter, and returning a saleinv ROWTYPE,
customer ROWTYPE, two car ROWTYPEs, an options SYS_REFCURSOR, and a car.serial TYPE as OUT parameters.
Here is an example of program execution:

Enter Sales Invoice Number: I00015

------ SPECIALITY IMPORTS - SALES INVOICE ------

InvoiceNo I00015            Date: 12-MAY-16
SOLD TO: Name: Jody Kirton
Address: 123 Lake Shore Blvd West
City: Etobicoke
State: ON       Postal Code: M8V1G1
Telephone: 4161112222
Salesman: Adam Adams

Serial Number |   Make   |   Model   | Year |  Color 
ABABABAB        ACURA        RSX       2016     Red

------ Insurance Coverage Includes ------

Fire and Theft [Y]       Liability [N]
Collision      [Y]  PropertyDamage [Y]

------ OPTIONS ------
D2E   Radio        34.09
D2S   Wheel Cover  25.00

------ TRADE-IN ------
SerialNo. |  Make  |  Model  |  Year  |  Allowance' 
AB121212    ACURA    RSX        2012     2000.00
Total Price: 3000.00
Trade-In Allowance: 1000.00
Discount: 100.00
Net: 100.00
Taxes: 145.32

Press any key to continue .....
.......................
If the user selects x they will exit the program
.......................
