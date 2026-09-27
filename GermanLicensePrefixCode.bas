' this program was written becuase i was curious what the City was by unknown prefix codes
' of the license plates that i saw during the ride
' i've looked up the list from a website (sorry source unknown, forgot to write it down)
' copied the data into a Google spreadsheet.
' changed all special characters to standard characters and saved it all into a tab seperated file
' Greetings Dutch-KFish 27 Spetember 2026

OPTION EXPLICIT
OPTION DEFAULT NONE
dim as string DispCtyReg$,b$,DispPrfxc$,Uinp$, Finp$
Dim As integer x,y,fn1,c, c1, l1



Uinp$="---" 
DispCtyReg$="    --------"
b$="-            "

strt2:
cls



for l1=1 to 320 step 10
? @(l1,7)"*"
? @(l1,55)"_"
? @(l1,240)"*"
next
? @(10,20)"German License Plate"
? @(10,35)"City/region prefix code"


? @(10,80)"Prefix Code:   ";DispPrfxc$

? @(10,100)"City/region:"
? @(10,115)DispCtyReg$

? @(180,240)"Dutch-KFish"

'? @(10,160)"First code of L plate "
? @(10,160)"First code of L plate"
Input " Max 3 characters ", Uinp$'Input z$
Uinp$=left$(Uinp$+"   ",3)




strt:


l1 = Len(Uinp$)
If l1>3 Then  GoTo strt

DispPrfxc$=UCASE$(Uinp$)


OPEN "tbl.tsv" FOR INPUT AS #1 

c=0

do
INPUT #1, Finp$ 
b$=left$(Finp$,3)

if b$="###" then c=2
'if b$="###" then print "No match found" :goto strt
if b$=DispPrfxc$ then c=1
loop while c=0
CLOSE #1 

DispCtyReg$= right$(Finp$,len(Finp$)-4)

if c=2 then
DispCtyReg$="No Match found!"
DispPrfxc$="ERR
end if

goto strt2



' German License Plate City/region prefix code
