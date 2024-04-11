FROM python:3.9-slim as builder
WORKDIR /app
COPY . /app/
RUN pip install --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest
WORKDIR /app
COPY --from=builder /app/ /app/
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
ENV REDIS_HOST=redis
ENV FLASK_APP=/app/app.py
ENV PYTHONPATH=/usr/local/lib/python3.9/site-packages
EXPOSE 5000
ENTRYPOINT ["python","-m","flask", "run", "--host=0.0.0.0"]
