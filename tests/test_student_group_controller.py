import pytest
from routes import *
from tests.config import get_test_data, get_test_data_json
from models import get_response
from tests.base_test import BaseTest


class TestStudentGroupController(BaseTest):
    """Tests for Student Group Controller for testing users with different access rights."""

    @pytest.mark.parametrize('email,password,expected_status_code,expected_body',
                             get_test_data('test_student_group_controller_by_id.csv'))
    def test_find_student_group_by_id_get(self,
                                          email: str,
                                          password: str,
                                          expected_status_code: str,
                                          expected_body: str) -> None:
        """Parameterized test that checks response to GET request to get student group by id
        for users with different access types.
        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :param expected_body: string (JSON file name with test data)
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('get', get_students_group_url('43'), credentials)
        assert response.status_code == int(expected_status_code)

        if response.status_code == 200:
            response = get_response('get', get_students_group_url('43'), credentials)
            assert response.json() == get_test_data_json(f'expectedJson/{expected_body}')

    @pytest.mark.parametrize('email,password,expected_status_code,expected_body',
                             get_test_data('test_student_group_controller.csv'))
    def test_find_student_group_get(self,
                                    email: str,
                                    password: str,
                                    expected_status_code: str,
                                    expected_body: str) -> None:
        """Parameterized test that checks response to GET request to get student group
        for users with different access types.
        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :param expected_body: string (JSON file name with test data)
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('get', STUDENTS_GROUP, credentials)
        assert response.status_code == int(expected_status_code)

        if response.status_code == 200:
            response = get_response('get', STUDENTS_GROUP, credentials)
            assert response.json() == get_test_data_json(f'expectedJson/{expected_body}')

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_student_group_controller_post.csv'))
    def test_create_student_group_post(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to Post request to create student group
        for users with different access types.
        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('post', STUDENTS_GROUP, credentials, "test_student_group_controller_post.json")
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,student_group_id,expected_status_code',
                                 get_test_data('test_student_groups_controller_delete.csv'))
    def test_student_group_delete(self, email: str, password: str, student_group_id: str, expected_status_code: str) -> None:
        credentials = {"email": email, "password": password}
        response = get_response('delete', get_students_group_url(f'{student_group_id}'), credentials)
        assert response.status_code == int(expected_status_code)