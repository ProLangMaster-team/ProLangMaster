import json
import time

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

