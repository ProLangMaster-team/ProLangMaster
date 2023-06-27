from fastapi import APIRouter

from models.pydantic_models import LoginCreds, SignupCreds

router = APIRouter()


@router.get("/login")
async def login_user(credentials: LoginCreds):
    if credentials.user_name == 'admin@prolangmaster.com' and credentials.password == 'string':
        return {'status': 'ok', 'message': 'success'}
    return {'status': 'error', 'message': 'Invalid login details'}


@router.post("/sign-up")
async def signup_user(credentials: SignupCreds):
    user_data = {
        'name': credentials.name,
        'email': credentials.email,
        'password': credentials.password,
        'confirm_password': credentials.confirm_password
    }
    return user_data
