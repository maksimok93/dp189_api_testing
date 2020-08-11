import pytest
from routes import *
from tests.base_test import BaseTest
from tests.config import get_test_data, get_test_data_json, get_response


class TestLessonController(BaseTest):
    """Tests for Lesson Controller for testing users with different access rights."""

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_lesson_controller_get.csv'))
    def test_all_lessons_get(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to GET request to get all lessons
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('get', LESSON, credentials)
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_lesson_controller_get.csv'))
    def test_lesson_by_student_id_get(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to GET request to get all lessons
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('get', LESSON, credentials)
        assert response.status_code == int(expected_status_code)

        if response.status_code == 200:
            response = get_response('get', get_lesson_url_by_student_id('11'), credentials)
            assert response.json() == get_test_data_json(f'expectedJson/response_get_lesson_by_student_id.json')

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_lesson_controller_post.csv'))
    def test_create_lesson_post(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to POST request to create some lesson
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('post', LESSON, credentials, "test_lesson_controller_post.json")
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,expected_status_code',
                             get_test_data('test_lesson_controller_put.csv'))
    def test_update_lesson_put(self, email: str, password: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to PUT request to change some lesson data
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('put', get_lesson_url('30'), credentials, "test_lesson_controller_put.json")
        assert response.status_code == int(expected_status_code)

    @pytest.mark.parametrize('email,password,lesson_id,expected_status_code',
                             get_test_data('test_lesson_controller_delete.csv'))
    def test_lesson_delete(self, email: str, password: str, lesson_id: str, expected_status_code: str) -> None:
        """Parameterized test that checks response to DELETE request to delete some lesson data
        for users with different access types.

        :param user email: string
        :param user password: string
        :param expected_status_code: string
        :return: None
        """
        credentials = {"email": email, "password": password}
        response = get_response('delete', get_lesson_url(f'{lesson_id}'), credentials)
        assert response.status_code == int(expected_status_code)