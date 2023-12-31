import datetime
from uuid import uuid4

from fastapi import APIRouter

from models.pydantic_models import LoginCreds, SignupCreds, DeleteUser, ResetPassword, UserDetails
from utils.api_utils import hash_password, create_jwt, authenticate
from utils.database import users_db, pymongo_exceptions

router = APIRouter()
tmp_tokens = []


@router.post("/login")
async def login_user(credentials: LoginCreds):
    user = users_db.find_one({"email": credentials.email, "pass": hash_password(credentials.password)})
    if user:
        jwt_token = create_jwt({"user_id": str(user["_id"])})
        return {'status': 'ok', "data": {"token": jwt_token}, 'message': 'success'}
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
                             "pass": hash_password(credentials.password)})
    except pymongo_exceptions:
        return {"status": "error", "message": "Error creating user in database"}
    return {'status': 'ok', 'message': 'success'}


@router.get("/reset-password/exist")
async def user_exist(email: str):
    tmp = users_db.find_one({"email": email})
    if tmp:
        tmp_tokens.append(str(uuid4()))
        return {'status': 'ok', 'message': 'success', "data": {"exist": True, "tmp_token": tmp_tokens[-1]}}
    return {'status': 'ok', 'message': 'success', "data": {"exist": False}}


@router.put("/reset-password")
async def reset_password(credentials: ResetPassword):
    if credentials.tmp_token not in tmp_tokens:
        return {"status": "error", "message": "Unauthenticated request"}
    tmp_tokens.remove(credentials.tmp_token)
    if credentials.password != credentials.confirm_password:
        return {"status": "error", "message": "Confirm password incorrect"}
    tmp = users_db.update_one({"email": credentials.email}, {"$set": {"pass": hash_password(credentials.password)}})
    if not tmp.modified_count > 0:
        return {"status": "error", "message": "User record not found"}
    return {'status': 'ok', 'message': 'success'}


@router.delete("/remove")
@authenticate
async def remove_user(user: DeleteUser):
    tmp = users_db.find_one({"email": user.email})

    if not tmp:
        return {"status": "error", "message": "User does not exist"}
    else:
        users_db.delete_one({"email": user.email})
    return {'status': 'ok', 'message': 'success'}


@router.get("/details")
@authenticate
async def user_details(data: UserDetails):
    tmp = users_db.find_one({"email": data.email})
    if tmp:
        data = {"name": tmp["name"], "email": tmp["email"], "created_date": tmp["created_date"]}
        return {'status': 'ok', 'message': 'success', "data": data}
    return {'status': 'error', 'message': 'user not found'}
