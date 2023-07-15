import datetime
from hashlib import sha1

from fastapi import APIRouter

from models.pydantic_models import LoginCreds, SignupCreds, Email
from utils.api_utils import hash_password
from utils.database import users_db, pymongo_exceptions

router = APIRouter()


@router.post("/login")
async def login_user(credentials: LoginCreds):
    if credentials.email == 'admin@plm.com' and credentials.password == 'admin':
        return {'status': 'ok', 'message': 'success'}

    user = users_db.find_one({"email": credentials.email, "pass": hash_password(credentials.password)})
    if user:
        return {'status': 'ok', 'message': 'success'}
    return {'status': 'error', 'message': 'Invalid login details'}


@router.post("/sign-up")
async def signup_user(credentials: SignupCreds):
    if credentials.password != credentials.confirm_password:
        return {"status": "error", "message": "Confirm password incorrect"}

    try:
        if users_db.find_one({"email": credentials.email}):
            return {"status": "error", "message": "user exists"}
        users_db.insert_one({"name": credentials.full_name, "email": credentials.email,
                             "created_date": datetime.datetime.utcnow(),
                             "pass": sha1(credentials.password.encode()).hexdigest()})
    except pymongo_exceptions:
        return {"status": "error", "message": "Error creating user in database"}
    return {'status': 'ok', 'message': 'success'}


@router.delete("/remove")
async def remove_user(user: Email):
    tmp = users_db.find_one({"email": user.email})

    if not tmp:
        return {"status": "error", "message": "User does not exist"}
    else:
        users_db.delete_one({"email": user.email})
    return {'status': 'ok', 'message': 'success'}
