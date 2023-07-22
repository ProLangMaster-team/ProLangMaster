import json
import time
import types
from functools import wraps

import jwt
from hashlib import sha1

from config import JWT_SECRET, JWT_ALGORITHM


def hash_password(password: str) -> str:
    return sha1(password.encode()).hexdigest()


def create_jwt(data: dict) -> str:
    data["exp"] = time.time() + 24 * 60 * 60
    return jwt.encode(data, JWT_SECRET, JWT_ALGORITHM)


def verify_jwt(token: str):
    try:
        tmp = jwt.decode(token, JWT_SECRET, [JWT_ALGORITHM])
        return True
    except jwt.DecodeError:
        return False


def authenticate(func):
    @wraps(func)
    # kwargs should have all info in `data` key
    async def wrapper(*args, **kwargs):
        if type(kwargs["data"]) is dict:
            flag = verify_jwt(kwargs["data"]["token"])
        else:
            flag = verify_jwt(kwargs["data"].token)
        if not flag:
            return {"status": "error", "message": "unauthenticated user"}
        to_return = func(*args, **kwargs)
        if isinstance(to_return, types.CoroutineType):
            to_return = await to_return
        return to_return

    return wrapper
