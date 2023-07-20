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


class JWTToken(BaseModel):
    token: StrictStr


class Email(BaseModel):
    email: EmailStr


class DeleteUser(JWTToken, Email):
    pass


class LoginCreds(Email):
    password: StrictStr


class ResetPassword(LoginCreds):
    confirm_password: StrictStr
    tmp_token: StrictStr


class SignupCreds(LoginCreds):
    full_name: StrictStr
    confirm_password: StrictStr


class CourseDetails(BaseModel):
    course_name: StrictStr
    course_description: StrictStr
    created_date: datetime
    course_id: PydanticObjectId = Field(alias="_id")


class CourseFlashcard(BaseModel):
    course_name: StrictStr
    course_description: StrictStr
    created_date: datetime
    course_id: PydanticObjectId = Field(alias="_id")
