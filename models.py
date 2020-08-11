import json
from collections import namedtuple
import requests
from tests.config import get_token, get_test_data_json

headers = {'Content-type': 'application/json', 'Accept': 'application/json'}


def response_decoder(request_dict):
    return namedtuple('AuthControllerPOSTResponse', request_dict.keys())(*request_dict.values())


def post_response_body(url, credentials):
    response = requests.post(url=url, json=credentials, headers=headers)
    result = json.loads(response.text, object_hook=response_decoder)
    return result


def auth_controller_post_response_status_code(url, credentials):
    response = requests.post(url=url,
                             json=credentials,
                             headers=headers)
    return response.status_code


def get_response(request_type: str, url: str, credentials: dict, json_data=None):
    authorization_header = {'Authorization': f'{get_token(credentials)}'}

    request_type = request_type.lower()

    if request_type == 'get':
        response = requests.get(url=url,
                                headers=authorization_header)
    if request_type == 'post':
        response = requests.post(url=url,
                                 json=get_test_data_json(f'/requestData/{json_data}'),
                                 headers=authorization_header)
    if request_type == 'put':
        response = requests.put(url=url,
                                json=get_test_data_json(f'/requestData/{json_data}'),
                                headers=authorization_header)
    if request_type == 'delete':
        response = requests.delete(url=url,
                                   headers=authorization_header)

    return response
