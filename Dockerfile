
FROM python:3.10-slim

WORKDIR /app

COPY scripts/join_data.py /app/join_data.py
COPY input /app/input

RUN pip install pandas

CMD ["python", "join_data.py"]
