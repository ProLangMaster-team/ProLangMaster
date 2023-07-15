from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi
from pymongo import errors as pymongo_exceptions

from config import MONGODB_USERNAME, MONGODB_PASS

uri = f"mongodb+srv://{MONGODB_USERNAME}:{MONGODB_PASS}@cluster0.zfxk7t3.mongodb.net/?retryWrites=true&w=majority"

# Create a new client and connect to the server
client = MongoClient(uri, server_api=ServerApi('1'), tls=True)

# Send a ping to confirm a successful connection
client.admin.command('ping')
print("Pinged your deployment. You successfully connected to MongoDB!")

users_db = client["ProLangMaster"]["users"]
courses_db = client["ProLangMaster"]["courses"]
