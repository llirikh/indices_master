FROM fruits/service-base

ADD src /$app

CMD ["python", "-m", "uvicorn", "enterprise.app:app", "--host", "0.0.0.0", "--port", "8000"]
