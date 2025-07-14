# Usa una imagen base de Python
FROM python:3.11-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto
COPY . /app

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# Instala dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto (Railway lo define con la var $PORT)
ENV PORT=7860

# Comando para iniciar la app
CMD ["python", "launch.py", "--api", "--listen", "--port", "7860"]
