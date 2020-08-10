import pytest
from routes import *
from tests.base_test import BaseTest
from tests.config import get_test_data
from models import get_response


class TestMentorController(BaseTest):
    """Tests for Mentor Controller for testing users with different access rights."""

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_mentor_controller_post.csv'))
    def test_create_mentor_post(self, email: str, password: str, expected_status_code: str) -> None:
        credentials = {"email": email, "password": password}
        response = get_response('post', MENTOR, credentials, "test_mentor_controller_post.json")
        assert response.status_code == int(expected_status_code)

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
