'Declare the variables used
DIM y AS STRING
DIM n AS INTEGER
DIM i AS INTEGER
DIM nppl AS INTEGER
DIM msg AS STRING
DIM cport AS STRING
DIM a AS STRING
 
'Draw user interface
PRINT TAB(20); ""
print
PRINT TAB(10); "======================== SmS v1.0 =========================="
print 
print tab(20); "- a alizishaan khatri creation"
PRINT
print
print
'Read COM port number
INPUT "  Enter com port no: ", y
PRINT
'Read  number of users
INPUT "  Enter no of ppl: ", nppl
PRINT
'Read message
INPUT "  Enter message: ", msg
print
print

print "  Enter phone numbers:"


dim pno(nppl) as string

'Read all phone numbers
for i=1 to nppl
  input "  ",pno(i)
next i

'Build COM port string
cport = "com" + y + ":9600,n,8,1,cs0,cd0,ds0,rs"

open com cport as #1
IF ERR <> 0 THEN
    PRINT "  Error opening COM PORT"
    SLEEP
    END
END IF

'Set text mode
PRINT #1, "AT+CMGF=1"
SLEEP 1000

'Send message to all people
FOR i = 1 TO nppl
   a = "AT+CMGS=" + chr(34) + pno(i) + chr(34)
   PRINT #1, a
   PRINT #1, msg
   'print carriage return
   PRINT #1, chr(26)
   'delay for device to send messages
   SLEEP 4200
NEXT i

i = 0
FOR i = 1 TO 5
PRINT ""
NEXT i

PRINT TAB(25); "<<<< bulk messaging successful >>>>"

'Wait for user to trigger exit by pressing a key 
DO
LOOP WHILE INKEY$ = ""
CLOSE #1

