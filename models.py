import json
from collections import namedtuple

import jsonpath
import requests
from requests.auth import HTTPBasicAuth
from routes import AUTH

headers = {'Content-type':'application/json', 'Accept':'application/json'}


def responseDecoder(requestDict):
    return namedtuple('AuthControllerPOSTResponse', requestDict.keys())(*requestDict.values())


def auth_cotroller_post_response_body(credentials):
    # credentials = {"email": "kuprienko.v@nmu.one", "password": "OvByYxjN"}
    response = requests.post(AUTH, json=credentials, headers=headers)
    result = json.loads(response.text, object_hook=responseDecoder)
    return result


def auth_controller_post_response_status_code():
    credentials = {"email": "kuprienko.v@nmu.one", "password": "OvByYxjN"}
    response = requests.post(AUTH, json=credentials, headers=headers)
    # response_json = json.loads(response.text)
    return response.status_code


if __name__ == '__main__':
    print(auth_controller_post_response_status_code())
    auth_cotroller_response_body = auth_cotroller_post_response_body()
    print(type(auth_cotroller_response_body))
    print(auth_cotroller_response_body.role)
