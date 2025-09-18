from pymongo import MongoClient
from robot.api.deco import keyword
import bcrypt

client = MongoClient('mongodb+srv://QA:xperience@cluster0.cr2lwko.mongodb.net/markdb?retryWrites=true&w=majority&appName=Cluster0')

db = client['markdb']

@keyword('Clean user from database')
def clean_user(email):
   users = db['users']
   tasks = db['tasks']
   
   
   u = users.find_one({'email': email})
   if (u):
       tasks.delete_many({'user': u['_id']})
       users.delete_many({'email': email})

@keyword('Remove user from database')
def remove_user(email):
   users = db['users']
   users.delete_many({'email': email})
   print(f"Removed user with email: {email}")

@keyword('Insert user into database')
def insert_user(user):

   hash_pass = bcrypt.hashpw(user['password'].encode('utf-8'), bcrypt.gensalt(8))
   doc = {
      'name': user['name'],
      'email': user['email'],
      'password': hash_pass 
   }
   users = db['users']
   users.insert_one(doc)
   print(user)