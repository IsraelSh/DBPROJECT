
[General]
Version=1

[Preferences]
Username=
Password=2930
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=FOOD
Count=400

[Record]
Name=FOOD
Type=VARCHAR2
Size=20
Data=List('burger', 'chips', 'hot-dog', 'popcorn', 'pizza', 'sushi', 'pasta', 'ice-cream')
Master=

[Record]
Name=DRINKS
Type=VARCHAR2
Size=20
Data=List('Coca', 'Sprite', 'Water', 'Fanta', 'Beer', 'Spring', 'Soda', 'Schewpes')
Master=

[Record]
Name=RECEIPT
Type=NUMBER
Size=
Data=Sequence(1, 1, 400)
Master=

[Record]
Name=IDENTIFYING_NUMBER
Type=NUMBER
Size=
Data=Sequence(1, 1, 400)
Master=

