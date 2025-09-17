from pymongo import MongoClient
from robot.api.deco import keyword

client = MongoClient('mongodb+srv://QA:xperience@cluster0.cr2lwko.mongodb.net/markdb?retryWrites=true&w=majority&appName=Cluster0')

db = client['markdb']

@keyword('Remove user from database')
def remove_user(email):
   users = db['users']
   users.delete_many({'email': email})
   print(f"Removed user with email: {email}")

@keyword('Insert user into database')
def insert_user(user):
#   doc = {
  #    'name': name,
 #     'email': email,
  #    'password': password
  # }
   users = db['users']
   users.insert_one(user)
   print(user)