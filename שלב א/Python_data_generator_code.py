
from datetime import datetime, timedelta
import random

# Function to generate random date
def random_date(start, end):
    return start + timedelta(
        seconds=random.randint(0, int((end - start).total_seconds())),
    )

# Generate and insert 400 rows of data
start_date = datetime.strptime('2023-01-01', '%Y-%m-%d')
end_date = datetime.strptime('2023-12-31', '%Y-%m-%d')
movies = ['MovieA', 'MovieB', 'MovieC', 'MovieD', 'MovieE']

for i in range(1, 401):
    projector_code = i
    dates = random_date(start_date, end_date).strftime('%Y-%m-%d')
    times = random.randint(1, 4)  # Assume times are in hours
    room_number = random.randint(1, 20)
    movie_name = random.choice(movies)

    print(f"insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name) values ({projector_code}, to_date('{dates}', 'yyyy-mm-dd'), {times}, {room_number}, '{movie_name}');")
