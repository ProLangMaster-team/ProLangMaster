import uvicorn
from fastapi import FastAPI

from routers import users, courses

app = FastAPI()
app.include_router(users.router, prefix="/user")
app.include_router(courses.router, prefix="/courses")


@app.get("/")
async def root():
    return {"message": "Ping Pong..."}


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)
