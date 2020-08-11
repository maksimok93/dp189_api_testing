import pytest
import requests

from models import post_response_body, response_decoder, auth_controller_post_response_status_code
from tests.config import get_test_data, get_test_data_json
from routes import AUTH
from tests.config import get_token


class TestAuthController:
    """Methods for testing users with different access rights."""

    @pytest.mark.parametrize('email,password', get_test_data('test_auth-controller_login.csv'))
    def test_login(self, email: str, password: str) -> None:
        """Testing administrator login.


        :param email:str
        :param password:str
        :return: None
        """
        credentials = {"email": email, "password": password}
        admin_login = requests.post(url=AUTH, json=credentials)

        assert admin_login.status_code == 200

    @pytest.mark.parametrize('email,password', get_test_data('test_auth-controller_login.csv'))
    def test_logout(self, email: str, password: str) -> None:
        """Testing administrator logout.


        :param email:str
        :param password:str
        :return: None
        """
        credentials = {"email": email, "password": password}
        token = get_token(credentials)
        admin_logout = requests.delete(url=AUTH, headers={'Authorization': f'{token}'})
        assert admin_logout.status_code == 200

    @pytest.mark.parametrize('email,password,expected_status_code,expected_response',
                             get_test_data('test_auth_controller.csv'))
    def test_auth_controller_user(self, email: str, password: str,
                                  expected_status_code: str, expected_response: str) -> None:
        credentials = {"email": email, "password": password}
        status_code = auth_controller_post_response_status_code(AUTH, credentials)
        assert status_code == int(expected_status_code)

        user = post_response_body(AUTH, credentials)
        expected_user = response_decoder(get_test_data_json(f'expectedJson/{expected_response}'))
        assert user == expected_user
