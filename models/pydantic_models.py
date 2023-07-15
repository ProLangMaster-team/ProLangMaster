from pydantic import StrictStr, EmailStr
from pydantic.main import BaseModel


class Email(BaseModel):
    email: EmailStr


class LoginCreds(Email):
    password: StrictStr


class SignupCreds(LoginCreds):
    full_name: StrictStr
    confirm_password: StrictStr
