'Declaring the various variables used
DIM y AS STRING
DIM n AS INTEGER
DIM i AS INTEGER
DIM nmsg AS INTEGER
DIM msg AS STRING
DIM pno AS STRING
DIM cport AS STRING
DIM a AS STRING
 
'Draw the user interface
PRINT TAB(20); ""
print
PRINT TAB(10); "======================== SmS v1.0 =========================="
print 
print tab(20); "- an alizishaan khatri creation"
PRINT
print
print
'Read COM port number from user
INPUT "  Enter com port no: ", y
PRINT
'Accept target phone number from user
INPUT "  Enter target phone no: ", pno
PRINT
'Read number of messages
INPUT "  Enter no of msgs: ", nmsg
PRINT
'Read message from user 
INPUT "  Enter message: ", msg

'build AT command string
a = "AT+CMGS=" + chr(34) + pno + chr(34)

'build COM port access string
cport = "com" + y + ":9600,n,8,1,cs0,cd0,ds0,rs"

'open com port
open com cport as #1
IF ERR <> 0 THEN
    PRINT "Error opening COM PORT"
    SLEEP
    END
END IF

'Set text mode
PRINT #1, "AT+CMGF=1"
'wait for changes to take place
SLEEP 1000

'Loop to send multiple messages
FOR i = 1 TO nmsg
   PRINT #1, a
   PRINT #1, msg
   'Print carriage return character
   PRINT #1, chr(26)
   SLEEP 4200
NEXT i

i = 0
FOR i = 1 TO 5
PRINT ""
NEXT i

PRINT TAB(25); "<<<< Text bombardment successful >>>>"

'Wait for user input to exit 
DO
LOOP WHILE INKEY$ = ""
CLOSE #1

