import urllib
import urllib.request
import urllib.error
import json
import numpy as np

# If you are using Python 3+, import urllib instead of urllib3


def recommender(id, age, environment, interest, vegetarian):

    print(id)
    print(vegetariano(vegetarian))
    data = {
        "Inputs": {
            "input2": {
                "ColumnNames": [
                    "userID",
                    "age",
                    "environment",
                    "interest",
                    "vegetarian"
                ],
                "Values": [
                    [
                        id,
                        edad(age),
                        environment,
                        interest,
                        vegetariano(vegetarian)
                    ]
                ]
            },
            "input1": {
                "ColumnNames": [
                    "userID",
                    "restaurantID",
                    "rating"
                ],
                "Values": [
                    [
                        id,
                        "0",
                        "0"
                    ]
                ]
            }
        },
        "GlobalParameters": {}
    }

    body = str.encode(json.dumps(data))

    url = 'https://ussouthcentral.services.azureml.net/workspaces/6576c4e756324cd8a1bb78eef9aace3e/services/a0c4309f402348e6a254c4f8e9e9e39d/execute?api-version=2.0&details=false'
    # Replace this with the API key for the web service
    api_key = 'J0+GfABlB73JRlUbx1Irqe49socQjMAL3JZr8uarhLjze4i5r3ybc8N/fGikTEhcuS54VWV1nUJZ+AMClzBYdA=='
    headers = {'Content-Type': 'application/json',
               'Authorization': ('Bearer ' + api_key)}

    req = urllib.request.Request(url, body, headers)

    try:
        response = urllib.request.urlopen(req)

        # If you are using Python 3+, replace urllib3 with urllib.request in the above code:
        # req = urllib.request.Request(url, body, headers)
        # response = urllib.request.urlopen(req)

        # result = response.read()
        jsondecoded = json.load(response)
        decoded = jsondecoded['Results'].get(
            'output1').get('value').get('Values')
        restaurants = decoded[0]
        print(list(np.array(restaurants).astype(int)))
        return list(np.array(restaurants).astype(int))

    except urllib.error.HTTPError as e:
        print("The request failed with status code: " + str(e.code))

        # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
        # print(e.info())

        print(json.loads(e.read()))

        return "The request failed with status code: " + str(e.code)


def edad(age):
    if age == 0:
        return "0"
    else:
        return str(age)

def vegetariano(vegetarian):
    if vegetarian is True:
        return "1"
    else:
        return "0"