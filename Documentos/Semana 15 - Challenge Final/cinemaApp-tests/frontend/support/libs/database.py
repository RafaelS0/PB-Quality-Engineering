from pymongo import MongoClient
from bson import ObjectId
from robot.api.deco import keyword

client = MongoClient('mongodb://localhost:27017/')

db = client['cinema-app']

###USER TABLE###

@keyword('Insert user into database')
def insert_user(user_data):
    users = db['users']
    
    existing_user = users.find_one({'email': user_data['email']})
    if existing_user:
        print(f"User with email {user_data['email']} already exists")
    else:
        users.insert_one(user_data)
        print(f"User with email {user_data['email']} inserted successfully")

@keyword('Clean user from database')
def remove_user(email):
   users = db['users']
   users.delete_many({'email': email})
   print(f"Removed user with email: {email}")

###TICKET TABLE###

@keyword('Insert ticket into database')
def insert_ticket(ticket_data):
    tickets = db['tickets']
    tickets.insert_one(ticket_data)

#IA
@keyword('Get Theater by Name')
def get_theater_by_name(name):
    theaters = db['theaters']
    theater = theaters.find_one({'name': name})
    if theater and '_id' in theater:
        theater['_id'] = str(theater['_id'])
    return theater

###MOVIE TABLE###

@keyword('Insert movie into database')
def insert_movie(movie_data):
    movies = db['movies']
    movies.insert_one(movie_data)

@keyword('Get movie by title')
def get_movie_by_title(title):
    movies = db['movies']
    movie = movies.find_one({'title': title})
    if movie and '_id' in movie:
        movie['_id'] = str(movie['_id'])
    return movie

#IA
@keyword('Clean Movie from Database')
def clean_movie(title):
    movies = db['movies']
    print(f"Searching for movie with title: {title}")
    
    movie = movies.find_one({'title': title})
    print(f"Movie found: {movie}")
    
    if movie:
        result = movies.delete_many({'title': title})
        print(f"Movies with title '{title}' deleted. Count: {result.deleted_count}")
    else:
        print(f"No movie found with title: {title}")
       
        all_movies = list(movies.find({}, {'title': 1}))
        print(f"Existing movies: {all_movies}")


###THEATER TABLE###

@keyword('Insert theater into database')
def insert_theater(theater_data):
    theaters = db['theaters']
    theaters.insert_one(theater_data)

@keyword('Remove Theater From Database')
def remove_theater_by_name(name):
    theaters = db['theaters']
    theaters.delete_many({'name': name})


###SESSION TABLE###
#IA
@keyword('Get Session From Database')
def get_session_by_date(datetime):
    sessions = db['sessions']
    print(f"Searching for session with datetime: {datetime}")
    
    session = sessions.find_one({'datetime': datetime})
    print(f"Session found: {session}")
    
    if session and '_id' in session:
        session['_id'] = str(session['_id'])
        print(f"Session ID: {session['_id']}")
    else:
        print(f"No session found with datetime: {datetime}")
        all_sessions = list(sessions.find({}, {'datetime': 1}))
        print(f"Existing sessions: {all_sessions}")
    
    return session

@keyword('Get Session by Theater')
def get_session_by_theater(theater_id):
    sessions = db['sessions']
    print(f"Searching for session with theater_id: {theater_id}")
    
    session = sessions.find_one({'theater': ObjectId(theater_id)})
    print(f"Session found: {session}")
    
    if session and '_id' in session:
        session['_id'] = str(session['_id'])
        print(f"Session ID: {session['_id']}")
    else:
        print(f"No session found with theater_id: {theater_id}")
        all_sessions = list(sessions.find({}, {'theater': 1}))
        print(f"Existing sessions: {all_sessions}")
    
    return session

@keyword('Remove Session From Database')
def remove_session_by_date(datetime):
    sessions = db['sessions']
    print(f"Searching for sessions to delete with datetime: {datetime}")
    
    # Primeiro vamos ver se existe
    sessions_to_delete = list(sessions.find({'datetime': datetime}))
    print(f"Sessions found to delete: {len(sessions_to_delete)}")
    
    if sessions_to_delete:
        for session in sessions_to_delete:
            print(f"Session to delete: {session}")
    else:
        print(f"No sessions found with datetime: {datetime}")
        all_sessions = list(sessions.find({}, {'datetime': 1}))
        print(f"Existing sessions: {all_sessions}")
    
    # Agora deletar
    result = sessions.delete_many({'datetime': datetime})
    print(f"Sessions deleted. Count: {result.deleted_count}")

#IA
@keyword('Remove Session By Theater And Date')
def remove_session_by_theater_and_date(theater_id, datetime):
    sessions = db['sessions']
    print(f"Searching for sessions to delete with theater_id: {theater_id} and datetime: {datetime}")
    
    # Buscar sessões específicas
    query = {'theater': ObjectId(theater_id), 'datetime': datetime}
    sessions_to_delete = list(sessions.find(query))
    print(f"Sessions found to delete: {len(sessions_to_delete)}")
    
    if sessions_to_delete:
        for session in sessions_to_delete:
            print(f"Session to delete: {session}")
    else:
        print(f"No sessions found with theater_id: {theater_id} and datetime: {datetime}")
        all_sessions = list(sessions.find({}, {'theater': 1, 'datetime': 1}))
        print(f"Existing sessions: {all_sessions}")
    
    # Deletar apenas as sessões específicas
    result = sessions.delete_many(query)
    print(f"Sessions deleted. Count: {result.deleted_count}")


###RESERVATIONS TABLE###
@keyword('Get Reservation by Session')
def get_reservation_by_session(session_id):
    reservations = db['reservations']
    print(f"Searching for reservation with session_id: {session_id}")
    reservation = reservations.find_one({'session': ObjectId(session_id)})
    print(f"Reservation found: {reservation}")
    
    if reservation and '_id' in reservation:
        reservation['_id'] = str(reservation['_id'])
        print(f"Reservation ID: {reservation['_id']}")
    else:
        print(f"No reservation found with session_id: {session_id}")
        all_reservations = list(reservations.find({}, {'session': 1}))
        print(f"Existing reservations: {all_reservations}")
    
    return reservation

@keyword('Remove Reservation by Session')
def remove_reservation_by_session(session_id):
    reservations = db['reservations']
    reservations.delete_many({'session': ObjectId(session_id)})

@keyword('Remove Reservation by User')
def remove_reservation_by_user(user_id):
    reservations = db['reservations']
    reservations.delete_many({'user': ObjectId(user_id)})