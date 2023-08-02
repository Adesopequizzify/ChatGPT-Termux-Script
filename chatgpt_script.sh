#!/data/data/com.termux/files/usr/bin/bash

API_URL="https://api.openai.com/v1/chat/completions"
requestCount=0

trap "exitScript" SIGINT

function exitScript() {
    echo -e "\nExiting the ChatGPT script. Goodbye!"
    exit 0
}

read -p "Please enter your OpenAI API key: " API_KEY

while true; do
    read -p "You: " userTypedMessage

    if [[ -z "$userTypedMessage" ]]; then
        echo "Message cannot be empty. Please type your message again."
        continue
    fi

    # Increment the request count
    ((requestCount++))

    if [[ $requestCount -eq 75 ]]; then
        echo "You've reached the number of requests today."
        echo "Please support us by sharing with your friends: https://ai.quizzify.com.ng"
        break
    fi

    message="{\"role\": \"user\", \"content\": \"$userTypedMessage\"}"

    # Formatting the payload for the API request
    data="{\"model\": \"gpt-3.5-turbo\", \"messages\": [$message]}"

    # Sending the request to ChatGPT
    response=$(curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $API_KEY" -d "$data" $API_URL)

    # Extracting the bot's response from the API response
    botResponse=$(echo $response | jq -r '.choices[0].message.content')

    # Format and print the bot's response
    formattedBotResponse=$(echo "$botResponse" | sed 's/\*/×/g; s/\//÷/g')
    formattedBotResponse=$(echo "$formattedBotResponse" | sed 's/\(\+\s*\-\s*|\-\s*\+\s*|\+\s*\+\s*|\-\s*\-\s*\)/±/g')
    formattedBotResponse=$(echo "$formattedBotResponse" | sed 's/\^2/<sup>2<\/sup>/g; s/\^3/<sup>3<\/sup>/g')
    formattedBotResponse=$(echo "$formattedBotResponse" | sed 's/sqrt(\([^)]+\))/√\1/g; s/\(\d\+\)\^\(\d\+\)/\1<sup>\2<\/sup>/g')
    echo "ChatGPT: $formattedBotResponse"
done
