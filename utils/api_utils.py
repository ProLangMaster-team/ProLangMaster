from hashlib import sha1


def hash_password(password: str) -> str:
    return sha1(password.encode()).hexdigest()
