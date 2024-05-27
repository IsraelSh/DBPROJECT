
[General]
Version=1

[Preferences]
Username=
Password=2048
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=MOVIE
Count=400

[Record]
Name=FILM_CODE
Type=NUMBER
Size=
Data=Sequence(1, 1, 400)
Master=

[Record]
Name=NAMES
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=DURATION
Type=NUMBER
Size=
Data=Random(60, 180)
Master=

[Record]
Name=CATEGORIE
Type=VARCHAR2
Size=20
Data=List('Action','Comedy','Drama','Horror','Science Fiction','Fantasy','Romance','Thriller','Animation','Documentary')
Master=

[Record]
Name=ROOM_NUMBER
Type=NUMBER
Size=
Data=Random(1, 20)
Master=

[Record]
Name=PROJECTOR_CODE
Type=NUMBER
Size=
Data=Sequence(1, 1, 400)
Master=

