import openai
import telebot
import os
from dotenv import load_dotenv
load_dotenv()

openai.api_key = os.getenv("API_GPT")
bot = telebot.TeleBot(os.getenv("API_BOT"))


@bot.message_handler(func=lambda _: True)
def handle_message(message):
    response = openai.Completion.create(
     model="text-davinci-003",
     prompt=message.text,
     temperature=0.5,
     max_tokens=2000,
     top_p=1.0,
     frequency_penalty=0.5,
     presence_penalty=0.0,
         )
    bot.send_message(chat_id=message.from_user.id, text=response['choices'][0]['text'])

bot.polling()

