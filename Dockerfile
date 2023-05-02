FROM python
WORKDIR /home/ubuntu/bot
COPY . /home/ubuntu/bot
RUN pip install openai
RUN pip install pyTelegramBotAPI
RUN pip install python-dotenv
CMD python3 /home/ubuntu/bot/main.py
EXPOSE 8080
