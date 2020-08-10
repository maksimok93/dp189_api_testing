import pytest
from routes import *
from tests.config import get_test_data, get_test_data_json
from models import get_response
from tests.base_test import BaseTest


class TestMentorController(BaseTest):
    """Tests for Mentor Controller for testing users with different access rights."""

    @pytest.mark.parametrize('email,password,expected_status_code,expected_body',
                             get_test_data('test_mentor_controller.csv'))
    def test_all_mentors_GET(self,
                             email: str,
                             password: str,
                             expected_status_code: str,
                             expected_body: str) -> None:
        """Parameterized test that checks response to GET request to get all mentors
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :param expected_body: string (JSON file name with test data)
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('get', MENTOR, credentials)
        assert response.status_code == int(expected_status_code)

        if response.status_code == 200:
            response = get_response('get', MENTOR, credentials)
            assert response.json() == get_test_data_json(f'expectedJson/{expected_body}')

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_mentor_controller_put.csv'))
    def test_update_mentor_PUT(self, email, password, expected_status_code) -> None:
        """Parameterized test that checks response to PUT request to update mentor
        details for a specific course for users with different access types.
        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('put', get_mentor_url('32'), credentials, "test_mentor_controller_put.json")
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,mentor_id,expected_status_code',
                             get_test_data('test_course_controller_delete.csv'))
    def test_mentor_delete(self, email: str, password: str, mentor_id: str, expected_status_code: str) -> None:
        credentials = {"email": email, "password": password}
        response = get_response('delete', get_course_url(f'{mentor_id}'), credentials)
        assert response.status_code == int(expected_status_code)
