from datetime import datetime

from pydantic.main import BaseModel
from pydantic import StrictStr, EmailStr, Field
from bson.objectid import ObjectId as BsonObjectId


class PydanticObjectId(BsonObjectId):
    @classmethod
    def __get_validators__(cls):
        yield cls.validate

    @classmethod
    def validate(cls, v):
        if not isinstance(v, BsonObjectId):
            raise TypeError('ObjectId required')
        return str(v)


class Email(BaseModel):
    email: EmailStr


class LoginCreds(Email):
    password: StrictStr


class SignupCreds(LoginCreds):
    full_name: StrictStr
    confirm_password: StrictStr


class CourseDetails(BaseModel):
    course_name: StrictStr
    course_description: StrictStr
    created_date: datetime
    course_id: PydanticObjectId = Field(alias="_id")
