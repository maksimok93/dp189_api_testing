import pytest
import requests

from models import auth_cotroller_post_response_body, responseDecoder, auth_controller_post_response_status_code
from tests.config import get_test_data, get_test_data_json
from routes import AUTH
from tests.config import BaseConfig


class TestAuthController(BaseConfig):
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
        token = self.get_token(credentials)
        admin_logout = requests.delete(url=AUTH, headers={'Authorization': f'{token}'})
        assert admin_logout.status_code == 200

    def test_auth_controller_post_response_body(self) -> None:
        status_code = auth_controller_post_response_status_code()
        expected_status_code = 200
        assert status_code == expected_status_code

        credentials = {"email": "kuprienko.v@nmu.one", "password": "OvByYxjN"}
        user = auth_cotroller_post_response_body(credentials)
        expected_user = responseDecoder(get_test_data_json('response_test.json'))
        assert user == expected_user