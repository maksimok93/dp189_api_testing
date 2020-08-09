import json
from collections import namedtuple
import requests
from requests.auth import HTTPBasicAuth
from routes import AUTH, COURSE
from tests.config import get_token

headers = {'Content-type': 'application/json', 'Accept': 'application/json'}


def responseDecoder(requestDict):
    return namedtuple('AuthControllerPOSTResponse', requestDict.keys())(*requestDict.values())



def post_response_body(url, credentials):
    response = requests.post(url=url, json=credentials, headers=headers)
    result = json.loads(response.text, object_hook=responseDecoder)
    return result


def auth_controller_post_response_status_code(url, credentials):
    response = requests.post(url=url, json=credentials, headers=headers)
    return response.status_code


def get_response_status_code(url, credentials):
    token = get_token(credentials)
    response = requests.get(url=url, headers={'Authorization': f'{token}'})
    return response.status_code


def get_response_body(url, credentials):
    token = get_token(credentials)
    courses = requests.get(url=url, json=credentials, headers={'Authorization': f'{token}'})
    return courses.json()


def get_response(request_type: str, url, credentials, json_data=None):
    authorization_header = {'Authorization':f'{get_token(credentials)}'}

    if json_data:
        contents = open(f'../testsData/requestData/{json_data}', 'rb')

    if request_type == 'GET':
        response = requests.get(url=url, headers=authorization_header)
    if request_type == 'POST':
        response = requests.post(url=url, data=json.load(contents), headers=authorization_header)
    if request_type == 'PUT':
        response = requests.put(url=url, json=json.load(contents), headers=authorization_header)
    if request_type == 'DELETE':
        response = requests.delete(url=url, headers=authorization_header)

    return response


if __name__ == '__main__':
    credentials = {"email": "adminsoft2020@gmail.com", "password": "qwerty"}

    print(get_response_body(COURSE, credentials))
    auth_cotroller_response_body = post_response_body(AUTH, credentials)
    print(type(auth_cotroller_response_body))
    print(auth_cotroller_response_body.id)
