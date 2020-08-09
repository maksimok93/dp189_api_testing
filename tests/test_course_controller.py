import pytest
from routes import *
from tests.config import get_test_data, get_test_data_json
from models import get_response


class TestCourseController:
    @pytest.mark.parametrize('email,password,expected_status_code,expected_body',
                             get_test_data('test_course_controller.csv'))
    def test_get_all_courses_admin(self, email, password, expected_status_code, expected_body):
        credentials = {"email": email, "password": password}
        response = get_response('get', COURSE, credentials)
        assert response.status_code == int(expected_status_code)

        if response.status_code == 200:
            response = get_response('get', COURSE, credentials)
            assert response.json() == get_test_data_json(f'expectedJson/{expected_body}')

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_course_controller_put.csv'))
    def test_change_course_PUT(self, email, password, expected_status_code):
        credentials = {"email": email, "password": password}
        response = get_response('put', get_course_url('31'), credentials, "test_course_controller_put.json")
        assert response.status_code == int(expected_status_code)
