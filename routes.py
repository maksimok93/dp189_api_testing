PROTOCOL = 'http:'
DOMAIN = '//softserve2020romeo.herokuapp.com'
API = '/api'

AUTH = f'{PROTOCOL}{DOMAIN}{API}/auth'
COURSE = f'{PROTOCOL}{DOMAIN}{API}/courses'
LESSON = f'{PROTOCOL}{DOMAIN}{API}/lessons'
MENTOR = f'{PROTOCOL}{DOMAIN}{API}/mentors'
STUDENT = f'{PROTOCOL}{DOMAIN}{API}/students'
STUDENTS_GROUP = f'{PROTOCOL}{DOMAIN}{API}/student_groups'
THEME = f'{PROTOCOL}{DOMAIN}{API}/themes'


def get_course_url(course_id: str) -> str:
    return f'{COURSE}/{course_id}'


def get_lesson_url(lesson_id: str) -> str:
    return f'{LESSON}/{lesson_id}'


def get_lesson_url_by_student_id(student_id: str) -> str:
    return f'{LESSON}/students/{student_id}'


def get_mentor_url(mentor_id: str) -> str:
    return f'{MENTOR}/{mentor_id}'


def get_student_url(student_id: str) -> str:
    return f'{STUDENT}/{student_id}'


def get_students_group_url(student_group_id: str) -> str:
    return f'{STUDENTS_GROUP}/{student_group_id}'
