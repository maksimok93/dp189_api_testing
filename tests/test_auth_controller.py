"""Login tests module."""

import requests


class TestLogin:
    """Methods for testing users with different access rights."""

    def setup(self) -> None:
        """Setup for the tests.

        :return: None
        """
        self.auth_url = 'https://softserve2020romeo.herokuapp.com/api/auth'

    def test_admin_login(self) -> None:
        """Testing administrator login.

        :return: None
        """
        admin_credentials_json = {"email": "adminsoft2020@gmail.com", "password": "qwerty"}
        admin_login = requests.post(url=self.auth_url, json=admin_credentials_json)

        assert admin_login.status_code == 200

    def test_mentor_login(self) -> None:
        """Testing mentor login.

        :return: None
        """
        mentor_credentials_json = {"email": "martyn@nmu.one", "password": "XSRLvaIt"}
        mentor_login = requests.post(url=self.auth_url, json=mentor_credentials_json)

        assert mentor_login.status_code == 200

    def test_student_login(self) -> None:
        """Testing student login.

        :return: None
        """
        student_credentials_json = {"email": "kuprienko.v@nmu.one", "password": "OvByYxjN"}
        student_login = requests.post(url=self.auth_url, json=student_credentials_json)

        assert student_login.status_code == 200

    def test_login_invalid_data(self) -> None:
        """Testing login without access rights.

        :return: None
        """
        invalid_credentials_json = {"email": "invalid", "password": "invalid"}
        invalid_login = requests.post(url=self.auth_url, json=invalid_credentials_json)

        assert invalid_login.status_code == 403
