
[General]
Version=1

[Preferences]
Username=
Password=2886
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=SEAT
Count=400

[Record]
Name=SEAT_NUMBER
Type=NUMBER
Size=
Data=Sequence(1,1, 400)
Master=

[Record]
Name=ROW_NUMBER
Type=NUMBER
Size=
Data=Sequence(1, 1, 400)
Master=

[Record]
Name=ROOM_NUMBER
Type=NUMBER
Size=
Data=Random(1, 10)
Master=

