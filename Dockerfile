# ─────────────────────────────────────────
# Dockerfile para el bot de BINANCE (Easypanel)
# ─────────────────────────────────────────
FROM python:3.11-slim

WORKDIR /app

# Instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código del bot de Binance
COPY binanceNotifier.py .

# Directorio para la base de datos (montar como volumen en Easypanel)
RUN mkdir -p /data

# Variables de entorno (sobreescríbelas en Easypanel → Environment)
ENV ENV=production
ENV DB_PATH=/data/signals.db
ENV BOT_TOKEN=PON_AQUI_TU_TOKEN_NUEVO
ENV BOT_CHAT_ID=PON_AQUI_TU_CHAT_ID_NUEVO
ENV ANTHROPIC_API_KEY=PON_AQUI_TU_API_KEY

# rebuild-20260605

CMD ["python", "-u", "binanceNotifier.py"]
