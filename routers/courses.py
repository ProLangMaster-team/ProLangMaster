import bson
from fastapi import APIRouter

from models.pydantic_models import CourseDetails, JWTToken, AuthCourseID, EnrollCourse
from utils.api_utils import authenticate
from utils.database import users_db, courses_db

router = APIRouter()


@router.get("/list")
@authenticate
async def list_courses(data: JWTToken):
    if courses_db.count_documents({}) > 0:
        courses = [CourseDetails.parse_obj(obj).dict(by_alias=False) for obj in courses_db.find({})]
        return {'status': 'ok', 'message': 'success', "data": courses}
    return {'status': 'error', 'message': 'No courses available for user'}


@router.post("/flashcards")
@authenticate
async def get_flashcards(data: AuthCourseID):
    tmp = courses_db.find_one({"_id": bson.ObjectId(data.course_id)})
    if tmp:
        return {'status': 'ok', 'message': 'success', "data": tmp["quiz"]}
    return {'status': 'error', 'message': 'Course does not exist'}


@router.put("/enroll")
@authenticate
async def enroll_course(data: EnrollCourse):
    count = courses_db.count_documents({"_id": bson.ObjectId(data.course_id)})
    if count == 0:
        return {'status': 'error', 'message': 'Course does not exist'}

    users_db.update_one({"email": data.email}, {"$push": {"enrolled_courses": {"course_id": data.course_id,
                                                                               "fluency": data.fluency,
                                                                               "frequency": data.frequency}}})
    return {'status': 'ok', 'message': 'success'}
