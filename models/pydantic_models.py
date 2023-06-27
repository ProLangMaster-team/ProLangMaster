from pydantic.main import BaseModel


class LoginCreds(BaseModel):
    user_name: str
    password: str


class SignupCreds(BaseModel):
    name: str
    email: str
    password: str
    confirm_password: str