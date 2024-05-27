
[General]
Version=1

[Preferences]
Username=
Password=2450
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=TICKET
Count=400

[Record]
Name=IDENTIFYING_NUMBER
Type=NUMBER
Size=
Data=Sequence(1,1,400)
Master=

[Record]
Name=HOURS
Type=NUMBER
Size=
Data=Random(1,86400)
Master=

[Record]
Name=SEAT
Type=NUMBER
Size=
Data=Sequence(1,1,400)
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=
Data=Components.Price
Master=

[Record]
Name=FILME_NUMBER
Type=NUMBER
Size=
Data=Random(100,1000)
Master=

[Record]
Name=FILM_CODE
Type=NUMBER
Size=
Data=Sequence(1,1,400)
Master=

