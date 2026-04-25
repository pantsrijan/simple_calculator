FROM python:3.12-alpine

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

WORKDIR /app

COPY . .

RUN uv venv .venv && \
    . .venv/bin/activate && \
    uv sync --all-groups

RUN . .venv/bin/activate && pytest

CMD [".venv/bin/python", "src/calculator/calculator.py"]
