FROM python:3.11-slim

WORKDIR /app

# Установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Скачиваем NLTK данные в кэш директорию
RUN nltk.download('punkt', download_dir='/root/nltk_data')
RUN sleep 2
RUN nltk.download('punkt_tab', download_dir='/root/nltk_data')
RUN sleep 2

# Копирование файлов
COPY . /app

# Expose порт 8081
EXPOSE 8081

# Установка переменных окружения для кэширования
ENV NLTK_DATA=/root/nltk_data
ENV HF_HOME=/root/.cache/huggingface
ENV TORCH_HOME=/root/.cache/torch
