#!/bin/bash
mkdir /home/ubuntu/telegram_bot

cp -R /home/ubuntu/bot/. /home/ubuntu/telegram_bot/

echo "FROM python" >> /home/ubuntu/telegram_bot/Dockerfile
echo "WORKDIR /home/ubuntu/bot" >> /home/ubuntu/telegram_bot/Dockerfile
echo "COPY . /home/ubuntu/bot" >> /home/ubuntu/telegram_bot/Dockerfile
echo "RUN pip install openai" >> /home/ubuntu/telegram_bot/Dockerfile
echo "RUN pip install pyTelegramBotAPI" >> /home/ubuntu/telegram_bot/Dockerfile
echo "RUN pip install python-dotenv" >> /home/ubuntu/telegram_bot/Dockerfile
echo "CMD python3 /home/ubuntu/bot/main.py" >> /home/ubuntu/telegram_bot/Dockerfile
echo "EXPOSE 8080" >> /home/ubuntu/telegram_bot/Dockerfile

cd /home/ubuntu/telegram_bot/

docker build -t telegram_bot_gpt .
docker run --restart=always -d telegram_bot_gpt
docker ps -a 
