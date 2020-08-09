import pytest
from routes import *
from tests.config import get_test_data, get_test_data_json
from models import get_response


class TestMentorController:

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_mentor_controller_put.csv'))
    def test_update_mentor_PUT(self, email, password, expected_status_code):
        credentials = {"email": email, "password": password}
        response = get_response('put', get_mentor_url(''), credentials, "test_course_controller_put.json")
        assert response.status_code == int(expected_status_code)
