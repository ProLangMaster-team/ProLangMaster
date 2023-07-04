import datetime
from hashlib import sha1

from fastapi import APIRouter

from models.pydantic_models import LoginCreds, SignupCreds
from utils.database import users_db

router = APIRouter()


@router.get("/login")
async def login_user(credentials: LoginCreds):
    if credentials.user_name == 'admin@prolangmaster.com' and credentials.password == 'string':
        return {'status': 'ok', 'message': 'success'}
    return {'status': 'error', 'message': 'Invalid login details'}


@router.post("/sign-up")
async def signup_user(credentials: SignupCreds):

    if credentials.password != credentials.confirm_password:
        return {"status": "error", "message": "Confirm password incorrect"}

    try:
        users_db.insert_one({"name": credentials.name, "email": credentials.email,
                             "created_date": datetime.datetime.utcnow(),
                             "pass": sha1(credentials.password.encode()).hexdigest()})
    except Exception:
        return {"status": "error", "message": "Error creating user in database"}
    return {'status': 'ok', 'message': 'success'}
