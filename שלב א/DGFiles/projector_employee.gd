
[General]
Version=1

[Preferences]
=
=
Username=
Password=2132
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=PROJECTOR_EMPLOYEE
Count=400

[Record]
Name=PROJECTOR_CODE
Type=NUMBER
Size=
Data=Sequence(1, 1, 400)
Master=

[Record]
Name=DATES
Type=DATE
Size=
Data=Random(10, 25)
Master=

[Record]
Name=TIMES
Type=NUMBER
Size=
Data=Random(1, 86400)
Master=

[Record]
Name=ROOM_NUMBEER
Type=NUMBER
Size=
Data=Random(1, 20)
Master=

[Record]
Name=MOVIE_NAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

