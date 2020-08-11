import pytest
import requests
from tests.base_test import BaseTest
from tests.config import get_test_data, get_test_data_json, get_response
from routes import AUTH


class TestAuthController(BaseTest):
    """Methods for testing users with different access rights."""

    @pytest.mark.parametrize('email,password,expected_status_code,expected_response',
                             get_test_data('test_auth_controller.csv'))
    def test_login_post(self, email: str, password: str,
                        expected_status_code: str, expected_response: str) -> None:
        """Parameterized test that checks login for users with different access types.

        :param email: string
        :param password: string
        :param expected_status_code: string
        :param expected_response: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = requests.post(url=AUTH, json=credentials)

        assert response.status_code == int(expected_status_code)
        assert response.json() == get_test_data_json(f'expectedJson/{expected_response}')

    @pytest.mark.parametrize('email,password', get_test_data('test_auth-controller_login.csv'))
    def test_logout_delete(self, email: str, password: str) -> None:
        """Parameterized test that checks logout for users with different access types


        :param email: string
        :param password: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        admin_logout = get_response('delete', AUTH, credentials)
        assert admin_logout.status_code == 200
