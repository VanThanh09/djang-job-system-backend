# Stage 1: Builder
FROM python:3.11-slim AS builder

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# Cài torch CPU-only trước (nhỏ ~250MB thay vì ~4GB bản CUDA)
# Sau đó cài phần còn lại, pip sẽ dùng torch đã có sẵn
RUN pip install --upgrade pip && \
    pip install --prefix=/install --no-cache-dir \
        torch==2.8.0 \
        --index-url https://download.pytorch.org/whl/cpu && \
    pip install --prefix=/install --no-cache-dir \
        -r requirements.txt \
        --extra-index-url https://download.pytorch.org/whl/cpu

# Stage 2: Runtime
FROM python:3.11-slim AS runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=job.settings

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    default-libmysqlclient-dev \
    libgomp1 \
    curl \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /install /usr/local
COPY . .

RUN mkdir -p /app/static

COPY entrypoint.sh /entrypoint.sh
RUN dos2unix /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]