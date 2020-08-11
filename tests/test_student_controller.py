import pytest
from routes import STUDENT, get_student_url
from tests.config import get_test_data, get_test_data_json, get_response
from tests.base_test import BaseTest


class TestStudentController(BaseTest):
    """Tests for Lesson Student for testing users with different access rights."""

    @pytest.mark.parametrize('email,password,expected_status_code,expected_body',
                             get_test_data('test_student_controller_get.csv'))
    def test_get_all_students(self, email: str, password: str, expected_status_code: str, expected_body: str) -> None:
        """Parameterized test that checks response to GET request to get all students
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :param expected_body: string (JSON file name with test data)
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('get', STUDENT, credentials)
        assert response.status_code == int(expected_status_code)

        if response.status_code == 200:
            assert response.json() == get_test_data_json(f'expectedJson/{expected_body}')

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_student_controller_post.csv'))
    def test_create_student(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to Put request to create student.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('post', STUDENT, credentials, 'test_student_controller_post.json')
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_student_controller_get_by_id.csv'))
    def test_get_student_by_id(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to GET request to get student by id
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('get', get_student_url('8'), credentials)
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_student_controller_put.csv'))
    def test_update_student(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to PUT request to update student's group by id
            for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('put', get_student_url('8'), credentials, "test_student_controller_put.json")
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_student_controller_delete.csv'))
    def test_delete_student(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to GET request to delete student by id
            for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('delete', get_student_url('57'), credentials)
        assert response.status_code == int(expected_status_code)
