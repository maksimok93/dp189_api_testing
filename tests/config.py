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


def get_test_data_json(file_name: str):
    with open(f'../expectedJson/{file_name}') as file:
        return json.load(file)
