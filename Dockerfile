FROM python:3.9-slim
RUN apt-get update
WORKDIR /app
COPY . /app/
RUN pip install --no-cache-dir -r requirements.txt
ENV FLASK_APP=app.py
ENV REDIS_HOST=redis
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
