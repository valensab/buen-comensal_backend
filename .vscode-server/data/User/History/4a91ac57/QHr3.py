import urllib
import urllib.request
import urllib.error
import json
# If you are using Python 3+, import urllib instead of urllib3


def recommender(id):

    data = {
    "Inputs": {
        "input1": {
            "ColumnNames": [
                "userID",
                "placeID",
                "rating"
            ],
            "Values": [
                [
                    id,
                    "0",
                    "0"
                ],
            ]
        },
        "input2": {
            "ColumnNames": [
                "userID",
                "ambience",
                "interest"
            ],
            "Values": [
                [
                    id,
                    "value",
                    "value"
                ],
            ]
        },
    },
    "GlobalParameters": {}
}

    body = str.encode(json.dumps(data))

    url = 'https://ussouthcentral.services.azureml.net/workspaces/6576c4e756324cd8a1bb78eef9aace3e/services/d0f0d2da93ce4d6098c0f8cd7b7d4b09/execute?api-version=2.0&details=true'
    # Replace this with the API key for the web service
    api_key = 'm73L6EGHpyd7PGjZzqazg2JvNBe5G4AJSZOJpoIMv8NOcRnj5TbX6+++MtE3xIwBZgivxtYu6KeaWd2CbPnICw=='
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
        print(restaurants)
        return restaurants
        # 40000
        # 3005288276
        # 3194838975

    except urllib.error.HTTPError as e:
        print("The request failed with status code: " + str(e.code))

        # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
        # print(e.info())

        print(json.loads(e.read()))

        return "The request failed with status code: " + str(e.code)


recommender(id="U1023")
