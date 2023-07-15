from fastapi import APIRouter

from models.pydantic_models import CourseDetails
from utils.database import users_db, courses_db, pymongo_exceptions

router = APIRouter()


@router.get("/list")
async def list_courses():
    if courses_db.count_documents({}) > 0:
        courses = [CourseDetails.parse_obj(obj).dict(by_alias=False) for obj in courses_db.find({})]
        return {'status': 'ok', 'message': 'success', "data": courses}
    return {'status': 'error', 'message': 'No courses available for user'}
