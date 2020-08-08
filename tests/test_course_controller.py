import json
from collections import namedtuple
from json import JSONEncoder
import pytest
import requests
from tests.config import get_test_data
from routes import COURSE
from tests.config import get_token
from tests.config import get_test_data, get_test_data_json

from models import get_response_status_code, get_response_body
from models import post_response_body, responseDecoder, auth_controller_post_response_status_code


class TestCourseController:

    @pytest.mark.parametrize('email,password,expected_status_code,expected_body',
                             get_test_data('test_course_controller.csv'))
    def test_get_all_courses_admin(self, email, password, expected_status_code, expected_body):
        credentials = {"email": email, "password": password}
        status_code = get_response_status_code(COURSE, credentials)
        assert status_code == int(expected_status_code)

        if status_code == 200:
            get_body = get_response_body(COURSE, credentials)
            assert get_body == get_test_data_json(expected_body)
