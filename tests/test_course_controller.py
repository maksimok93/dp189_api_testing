import pytest
from routes import *
from tests.base_test import BaseTest
from tests.config import get_test_data, get_test_data_json
from models import get_response


class TestCourseController(BaseTest):
    @pytest.mark.parametrize('email,password,expected_status_code,expected_body',
                             get_test_data('test_course_controller.csv'))
    def test_all_courses_get(self, email: str, password: str, expected_status_code: str, expected_body: str) -> None:
        """Parameterized test that checks response to GET request to get all courses
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :param expected_body: string (JSON file name with test data)
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('get', COURSE, credentials)
        assert response.status_code == int(expected_status_code)

        if response.status_code == 200:
            response = get_response('get', COURSE, credentials)
            assert response.json() == get_test_data_json(f'expectedJson/{expected_body}')

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_course_controller_put.csv'))
    def test_change_course_put(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to PUT request to change some course data
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('put', get_course_url('31'), credentials, "test_course_controller_put.json")
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,course_id, expected_status_code',
                             get_test_data('test_course_controller_delete.csv'))
    def test_course_delete(self, email: str, password: str, course_id: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to DELETE request to delete some course data
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('delete', get_course_url(f'{course_id}'), credentials)
        assert response.status_code == int(expected_status_code)
