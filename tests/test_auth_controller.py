import pytest
import requests
from tests.config import get_test_data
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
