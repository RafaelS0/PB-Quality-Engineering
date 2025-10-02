from pymongo import MongoClient
from robot.api.deco import keyword

client = MongoClient('mongodb://localhost:27017/')

db = client['cinema-app']

#Aprimorado com IA
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

@keyword('Clean user from database')
def remove_user(email):
   users = db['users']
   users.delete_many({'email': email})
   print(f"Removed user with email: {email}")

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

@keyword('Remove Theater From Database')
def remove_theater_by_name(name):
    theaters = db['theaters']
    theaters.delete_many({'name': name})

#IA
@keyword('Get Theater by Name')
def get_theater_by_name(name):
    theaters = db['theaters']
    theater = theaters.find_one({'name': name})
    if theater and '_id' in theater:
        theater['_id'] = str(theater['_id'])
    return theater

@keyword('Get Session by Name')
def get_session_by_name(name):
    sessions = db['sessions']
    return sessions.find_one({'name': name})

@keyword('Remove Session From Database')
def remove_session_by_date(date):
    sessions = db['sessions']
    sessions.delete_many({'date': date})