#!/bin/bash
mkdir /home/test1/telegram_bot

cp -R /home/test1/bot/. /home/test1/telegram_bot/

echo "FROM python" >> /home/test1/telegram_bot/Dockerfile
echo "WORKDIR /home/ubuntu/bot" >> /home/test1/telegram_bot/Dockerfile
echo "COPY . /home/ubuntu/bot" >> /home/test1/telegram_bot/Dockerfile
echo "RUN pip install openai" >> /home/test1/telegram_bot/Dockerfile
echo "RUN pip install pyTelegramBotAPI" >> /home/test1/telegram_bot/Dockerfile
echo "RUN pip install python-dotenv" >> /home/test1/telegram_bot/Dockerfile
echo "CMD python3 /home/ubuntu/bot/main.py" >> /home/test1/telegram_bot/Dockerfile
echo "EXPOSE 8080" >> /home/test1/telegram_bot/Dockerfile

cd /home/test1/telegram_bot/

docker build -t telegram_bot_gpt .
docker run --restart=always -d telegram_bot_gpt
docker ps -a 
