from routes import AUTH
import requests


class TestAuthController:
    """Methods for testing users with different access rights."""

    def setup(self) -> None:
        """Setup for the tests.
        :return: None
        """
        self.auth_url = AUTH

    def get_token(self, credentials) -> str:
        """Method which returns token of user authorization.
        :return: str
        """
        authorization = requests.post(url=self.auth_url, json=credentials)
        return authorization.headers['Authorization']


class TestAdminAuth(TestAuthController):
    admin_credentials_json = {"email": "adminsoft2020@gmail.com", "password": "qwerty"}

    def test_admin_login(self) -> None:
        """Testing administrator login.
        :return: None
        """

        admin_login = requests.post(url=self.auth_url, json=self.admin_credentials_json)

        assert admin_login.status_code == 200

    def test_admin_logout(self) -> None:
        """Testing administrator logout.
        :return: None
        """
        token = self.get_token(self.admin_credentials_json)
        admin_logout = requests.delete(url=self.auth_url, headers={'Authorization': f'{token}'})
        assert admin_logout.status_code == 200


class TestMentorAuth(TestAuthController):
    mentor_credentials_json = {"email": "martyn@nmu.one", "password": "XSRLvaIt"}

    def test_mentor_login(self) -> None:
        """Testing mentor login.
        :return: None
        """
        mentor_login = requests.post(url=self.auth_url, json=self.mentor_credentials_json)

        assert mentor_login.status_code == 200

    def test_mentor_logout(self) ->None:
        """Testing mentor logout.
        :return: None
        """
        token = self.get_token(self.mentor_credentials_json)
        mentor_logout = requests.delete(url=self.auth_url, headers={'Authorization': f'{token}'})
        assert mentor_logout.status_code == 200


class TestStudentAuth(TestAuthController):
    student_credentials_json = {"email": "kuprienko.v@nmu.one", "password": "OvByYxjN"}

    def test_student_login(self) -> None:
        """Testing student login.
        :return: None
        """
        student_login = requests.post(url=self.auth_url, json=self.student_credentials_json)

        assert student_login.status_code == 200

    def test_student_logout(self) -> None:
        """Testing student logout.
        :return: None
        """
        token = self.get_token(self.student_credentials_json)
        student_logout = requests.delete(url=self.auth_url, headers={'Authorization': f'{token}'})
        assert student_logout.status_code == 200


class TestInvalidAuth(TestAuthController):
    invalid_credentials_json = {"email": "invalid", "password": "invalid"}

    def test_login_invalid_data(self) -> None:
        """Testing login without access rights.
        :return: None
        """
        invalid_login = requests.post(url=self.auth_url, json=self.invalid_credentials_json)

        assert invalid_login.status_code == 403
