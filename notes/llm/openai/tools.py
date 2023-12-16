import random, os, time, requests

def unique_funcs(id, n_tools=20):
    " Generate a list of tools."
    tools = [
        {
            "type": "function",
            "function": {
                "name": f"convert_currency_{id}",
                "description": "Convert an amount from one currency to another",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "amount": {
                            "type": "number",
                            "description": "The amount of money to convert",
                        },
                        "from_currency": {
                            "type": "string",
                            "description": "The original currency code (e.g., USD, EUR)",
                        },
                        "to_currency": {
                            "type": "string",
                            "description": "The target currency code",
                        },
                    },
                    "required": ["amount", "from_currency", "to_currency"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"analyze_word_count_{id}",
                "description": "Analyze the word count of a given text",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "text": {
                            "type": "string",
                            "description": "The input text to analyze",
                        },
                    },
                    "required": ["text"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"find_local_events_{id}",
                "description": "Find local events in a specified area",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "location": {
                            "type": "string",
                            "description": "The city or area to search for events",
                        },
                        "date": {
                            "type": "string",
                            "description": "The date or date range for event search",
                        },
                    },
                    "required": ["location", "date"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"suggest_recipe_{id}",
                "description": "Suggest a recipe based on given ingredients",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "ingredients": {
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "description": "List of ingredients available",
                        },
                    },
                    "required": ["ingredients"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"generate_fitness_routine_{id}",
                "description": "Generate a fitness routine based on user preferences",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "fitness_level": {
                            "type": "string",
                            "enum": ["beginner", "intermediate", "advanced"],
                            "description": "The user's fitness level",
                        },
                        "goal": {
                            "type": "string",
                            "description": "The fitness goal (e.g., weight loss, muscle gain)",
                        },
                    },
                    "required": ["fitness_level", "goal"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"translate_text_{id}",
                "description": "Translate text from one language to another",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "text": {
                            "type": "string",
                            "description": "The text to translate",
                        },
                        "from_language": {
                            "type": "string",
                            "description": "The original language",
                        },
                        "to_language": {
                            "type": "string",
                            "description": "The target language",
                        },
                    },
                    "required": ["text", "from_language", "to_language"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"get_nutritional_info_{id}",
                "description": "Get nutritional information for a specified food item",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "food_item": {
                            "type": "string",
                            "description": "The name of the food item",
                        },
                    },
                    "required": ["food_item"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"recommend_book_{id}",
                "description": "Recommend books based on user preferences",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "genre": {
                            "type": "string",
                            "description": "The preferred book genre",
                        },
                        "author": {
                            "type": "string",
                            "description": "Preferred author (optional)",
                        },
                    },
                    "required": ["genre"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"plan_travel_itinerary_{id}",
                "description": "Plan a travel itinerary based on the destination and interests",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "destination": {
                            "type": "string",
                            "description": "The travel destination",
                        },
                        "interests": {
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "description": "List of interests or activities",
                        },
                    },
                    "required": ["destination", "interests"],
                },
            }
        },
        {
            "type": "function",
            "function": {
                "name": f"get_weather_alerts_{id}",
                "description": "Get weather alerts for a specified location",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "location": {
                            "type": "string",
                            "description": "The location to check for weather alerts",
                        },
                        "alert_type": {
                            "type": "string",
                            "enum": ["storm", "heatwave", "flood", "other"],
                            "description": "Type of weather alert",
                        },
                    },
                    "required": ["location", "alert_type"],
                },
            }
        },
     {
        "type": "function",
        "function": {
            "name": f"calculate_tax_{id}",
            "description": "Calculate the tax on a given amount",
            "parameters": {
                "type": "object",
                "properties": {
                    "amount": {
                        "type": "number",
                        "description": "The amount of money to calculate tax on",
                    },
                    "tax_rate": {
                        "type": "number",
                        "description": "The tax rate as a percentage",
                    },
                },
                "required": ["amount", "tax_rate"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"check_flight_status_{id}",
            "description": "Check the status of a flight",
            "parameters": {
                "type": "object",
                "properties": {
                    "flight_number": {
                        "type": "string",
                        "description": "The flight number to check",
                    },
                    "date": {
                        "type": "string",
                        "description": "The date of the flight",
                    },
                },
                "required": ["flight_number", "date"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"generate_password_{id}",
            "description": "Generate a secure password",
            "parameters": {
                "type": "object",
                "properties": {
                    "length": {
                        "type": "integer",
                        "description": "The desired length of the password",
                    },
                    "include_symbols": {
                        "type": "boolean",
                        "description": "Whether to include symbols in the password",
                    },
                },
                "required": ["length", "include_symbols"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"find_restaurants_{id}",
            "description": "Find restaurants in a specified area",
            "parameters": {
                "type": "object",
                "properties": {
                    "location": {
                        "type": "string",
                        "description": "The city or area to search for restaurants",
                    },
                    "cuisine": {
                        "type": "string",
                        "description": "The type of cuisine (optional)",
                    },
                },
                "required": ["location"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"get_stock_price_{id}",
            "description": "Get the current price of a stock",
            "parameters": {
                "type": "object",
                "properties": {
                    "stock_symbol": {
                        "type": "string",
                        "description": "The stock symbol (e.g., AAPL, GOOGL)",
                    },
                },
                "required": ["stock_symbol"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"calculate_loan_interest_{id}",
            "description": "Calculate the interest on a loan",
            "parameters": {
                "type": "object",
                "properties": {
                    "principal_amount": {
                        "type": "number",
                        "description": "The principal amount of the loan",
                    },
                    "interest_rate": {
                        "type": "number",
                        "description": "The annual interest rate",
                    },
                    "loan_term": {
                        "type": "integer",
                        "description": "The term of the loan in years",
                    },
                },
                "required": ["principal_amount", "interest_rate", "loan_term"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"get_movie_info_{id}",
            "description": "Get information about a specific movie",
            "parameters": {
                "type": "object",
                "properties": {
                    "movie_title": {
                        "type": "string",
                        "description": "The title of the movie",
                    },
                },
                "required": ["movie_title"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"convert_temperature_{id}",
            "description": "Convert temperature from Fahrenheit to Celsius or vice versa",
            "parameters": {
                "type": "object",
                "properties": {
                    "temperature": {
                        "type": "number",
                        "description": "The temperature to convert",
                    },
                    "unit": {
                        "type": "string",
                        "enum": ["Fahrenheit", "Celsius"],
                        "description": "The unit of the input temperature",
                    },
                },
                "required": ["temperature", "unit"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"measure_distance_{id}",
            "description": "Measure the distance between two locations",
            "parameters": {
                "type": "object",
                "properties": {
                    "location1": {
                        "type": "string",
                        "description": "The starting location",
                    },
                    "location2": {
                        "type": "string",
                        "description": "The destination location",
                    },
                },
                "required": ["location1", "location2"],
            },
        }
    },
    {
        "type": "function",
        "function": {
            "name": f"get_horoscope_{id}",
            "description": "Get the daily horoscope for a specific zodiac sign",
            "parameters": {
                "type": "object",
                "properties": {
                    "zodiac_sign": {
                        "type": "string",
                        "enum": ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"],
                        "description": "The zodiac sign to get the horoscope for",
                    },
                },
                "required": ["zodiac_sign"],
            },
        }
    }
    ]
    return tools[:n_tools]

def flatten_funcs(tools):
    """
    Convert the list of tool definitions into a compact text format.
    """
    text_list = []
    for tool in tools:
        func = tool['function']
        name = func['name']
        description = func['description']
        parameters = ", ".join([f"{param}: {details['description']}" for param, details in func['parameters']['properties'].items()])

        text = f"{name} - {description}. Parameters: {parameters}."
        text_list.append(text)

    system_msg = "Here is a list of python functions you can call:\n\n" + "\n\n".join(text_list)
    return {"role": "system", "content": system_msg}


random_messages = [
    "I'm planning a trip to Europe next month and I'm trying to budget my expenses. Can you help me convert 2000 US dollars to euros?",
    "I've always been curious about how many words I write in my daily journal. It feels like a lot, but I've never counted. Can you analyze the word count for me?",
    "I'm looking for something fun to do this weekend in New York City. What local events are happening, especially any outdoor festivals or concerts?",
    "I have chicken, rice, and bell peppers in my fridge. Could you suggest a recipe that uses these ingredients? I'm in the mood for something spicy.",
    "I'm new to working out and need a fitness routine that's suitable for beginners. My goal is to build muscle. Can you generate a plan for me?",
    "I received a letter in French, but I don't speak the language. Can you translate this text for me into English so I understand what it's about?",
    "I'm trying to eat healthier and I'm curious about the nutritional content of avocados. Can you provide me with detailed nutritional information for avocados?",
    "I love reading sci-fi novels, particularly those with space exploration themes. Can you recommend some books in this genre, maybe something similar to 'Dune'?",
    "I'm planning a vacation to Japan and would like to create an itinerary. I'm interested in historical sites and local cuisine. Can you help me plan this?",
    "There's a storm warning for my area in Miami. Can you give me detailed weather alerts for the next 24 hours? I need to know if it's safe to go outside.",
    "As a freelance writer, I need to track how much I write each day. Today I wrote about various topics. Could you analyze the word count for my work?",
    "I've got some Euros left over from my last trip. How much would it be in Canadian dollars? I need to convert 500 Euros.",
    "I want to start exercising but don't know where to start. I'm a bit overweight and want a routine that's not too intense. Can you suggest a plan?",
    "I'm hosting a dinner party and have salmon, asparagus, and potatoes. What's a good recipe that can impress my guests and use these ingredients?",
    "I've been learning Spanish and want to test my skills. Can you translate this paragraph from English to Spanish for me so I can compare my translation?",
    "What interesting events are happening in Los Angeles next week? I'm particularly interested in art exhibitions or live music shows.",
    "I'm tracking my food intake and would like to know the calories and protein content in grilled chicken breast. Can you find this information for me?",
    "For my next book club meeting, I'm looking for a mystery novel that's not too dark but still engaging. Do you have any recommendations?",
    "I'm planning a road trip across the United States and want to visit landmarks and national parks. Can you help me plan an itinerary that includes these?",
    "I heard there might be heavy rain in Chicago tomorrow. Could you check the weather alerts and let me know if there are any flood warnings?"
]

def random_msg():
    msg = random.choice(random_messages)
    return {"role": "user", "content": msg}

def pick_func(tools):
    if tools is None: 
        return None
    else:
        tool = random.choice(tools)
        return {"type": "function", "function": {"name": tool['function']['name']}}


def chat(messages, tools=None, model='gpt-3.5-turbo', max_tokens=None, temperature=None):
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + os.environ['OPENAI_API_KEY'],
    }
    json_data = {"model": model, "messages": messages}
    if tools is not None: json_data.update({"tools": tools})
    if max_tokens is not None: json_data.update({"max_tokens": max_tokens})
    if temperature is not None: json_data.update({"temperature": temperature})

    start_time = time.time()
    response = requests.post(
        "https://api.openai.com/v1/chat/completions",
        headers=headers,
        json=json_data,
    )
    end_time = time.time()
    return response, end_time - start_time

def unpack_msg(response):
    return response.json()['choices'][0]['message']['content']