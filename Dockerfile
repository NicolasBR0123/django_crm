# Usar uma imagem base oficial do Python
FROM python:3.9-slim

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os arquivos de requerimentos
COPY requirements.txt .

# Instalar as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o código da aplicação para o diretório de trabalho
COPY . .

# Expor a porta que o Django vai usar
EXPOSE 8000

# Definir a variável de ambiente para o Django
ENV DJANGO_SETTINGS_MODULE=djcrm.settings

# Comando para rodar as migrações e iniciar o servidor
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]

