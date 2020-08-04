import requests
import csv


class BaseConfig:
    def get_token(self, credentials) -> str:
        """Method which returns token of user authorization.
        :return: str
        """
        authorization = requests.post(url=self.auth_url, json=credentials)
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
