import json
import pandas as pd


def lambda_handler(event, context):

    response = {}
    result = None

    try:
        data = json.loads(event['body'])
        df = pd.DataFrame(data['movies'])

        result = get_json_output(df)

    except Exception as e:
        response = {
            "statusCode": 500,
            "body": f"lambda handler fails\n{e}",
        }
        return response
    if result is not None:
        response["statusCode"] = 200
        response["headers"] = {}
        response["headers"]["Content-Type"] = "application/json"
        response["body"] = json.dumps(result['body'], indent=2)

        print("", response["body"])
        return response


def get_json_output(df):
    try:
        response = {}

        average_rating = calculate_average_rating(df)

        # choosing unique values
        director_counts = df['director'].value_counts()

        # return the index of the maximum value across 'director'
        most_movies_director = director_counts.idxmax()

        # dataframe of movies that have a rating above he average rating
        movies_above_average = df[df['rating'] > average_rating]
        json_movies_above_avg = movies_above_average.to_dict(orient='records')
    except:
        response = {
            "statusCode": 500,
            "body": "Failedto get the JSON output",
        }
        return response

    response["statusCode"] = 200
    response["body"] = {
        "average_rating": average_rating,
        "director_with_most_movies": most_movies_director,
        "movies_above_average_rating": json_movies_above_avg
    }

    return response


def calculate_average_rating(df):
    try:
        ratings = df['rating']
        average_rating = ratings.mean()
    except:
        response = {
            "statusCode": 500,
            "body": "Failed to calculate average rating",
        }
    return average_rating