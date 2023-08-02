---

# ChatGPT Script for Termux

This is a simple shell script that allows you to have interactive conversations with OpenAI's GPT-3.5 Turbo model, also known as ChatGPT, using the Termux terminal on your Android device. The script will prompt you for your OpenAI API key and enable you to chat with ChatGPT until you reach the request limit of 75 or type an empty message.

## Requirements

To use this script, you need to have the following installed on your Android device:

1. [Termux](https://termux.com/): A terminal emulator for Android.
2. [jq](https://stedolan.github.io/jq/): A lightweight and flexible command-line JSON processor.

You can install jq in Termux using the following command:

```bash
pkg install jq
```

## How to Use

1. Clone the repository to your Android device or download the `chatgpt_script.sh` file directly.

2. Open the Termux app on your Android device.

3. Navigate to the directory where you saved the `chatgpt_script.sh` file using the `cd` command.

4. Make the script executable by running the following command:

```bash
chmod +x chatgpt_script.sh
```

5. Run the script by entering:

```bash
./chatgpt_script.sh
```

6. The script will prompt you to enter your OpenAI API key. Please provide your API key when prompted.

7. Start having interactive conversations with ChatGPT! Type your message as the user, and the script will display ChatGPT's responses.

8. To exit the script, simply press `Ctrl+C`. The script will display a goodbye message before terminating.

## Important Note

- **API Key Security**: Ensure you keep your OpenAI API key secure and do not share it with others.

## Support and Contributions

