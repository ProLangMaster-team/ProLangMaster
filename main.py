from fastapi import FastAPI
from pydantic import BaseModel

class login_credentials(BaseModel):
    user_name: str
    password: str


class SignupCredentials(BaseModel):
    name: str
    email: str
    password: str
    confirm_password: str


app = FastAPI()

@app.post("/login/")
async def login_user(credentials: login_credentials):
    user_data = {'user_name': credentials.user_name, 'password': credentials.password}
    print(user_data)  # Print the user data

    if credentials.user_name == 'admin@prolangmaster.com' and credentials.password == 'string':
        return {'user_name': 'admin@prolangmaster.com', 'password': 'string'}           #starus okay
    return credentials.dict()

@app.post("/signup/")
async def signup_user(credentials: SignupCredentials):
    user_data = {
        'name': credentials.name,
        'email': credentials.email,
        'password': credentials.password,
        'confirm_password': credentials.confirm_password
    }
    print(user_data)  # Print the user data
    return user_data


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
