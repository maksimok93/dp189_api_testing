import json
import requests
import csv
from routes import AUTH


def get_token(credentials) -> str:
    """Method which returns token of user authorization.
    :return: str
    """
    authorization = requests.post(url=AUTH, json=credentials)
    return authorization.headers['Authorization']


def get_response(request_type: str, url: str, credentials: dict, json_file_name=None):
    """Generic method for handling various types of requests that require a token.

    :param request_type: string
    :param url: string
    :param credentials: dictionary
    :param json_file_name: string
    """
    authorization_header = {'Authorization': f'{get_token(credentials)}'}

    request_type = request_type.lower()

    if request_type == 'get':
        response = requests.get(url=url,
                                headers=authorization_header)
    if request_type == 'post':
        response = requests.post(url=url,
                                 json=get_test_data_json(f'/requestData/{json_file_name}'),
                                 headers=authorization_header)
    if request_type == 'put':
        response = requests.put(url=url,
                                json=get_test_data_json(f'/requestData/{json_file_name}'),
                                headers=authorization_header)
    if request_type == 'delete':
        response = requests.delete(url=url,
                                   headers=authorization_header)

    return response


def get_test_data(file_name: str) -> list:
    """Converts file with test data to tuples list to use it in parameterized tests.
    :param file_name: string
    :return: test_data_list consists of tuples, where each tuple is one file row.
    """
    with open(f'../testsData/{file_name}', 'r') as file:
        reader = csv.reader(file, quoting=csv.QUOTE_ALL, skipinitialspace=True, delimiter='\t')
        test_data_list = []
        for row in reader:
            test_data_list.append(tuple(row[0].strip('][').split(';')))
        return test_data_list


def get_test_data_json(file_path: str) -> object:
    """Deserialize file containing a JSON document to object.
    :param file_path: string
    :return: object
    """
    with open(f'../testsData/{file_path}') as file:
        return json.load(file)
