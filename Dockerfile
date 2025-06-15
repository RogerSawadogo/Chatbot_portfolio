# Étape 1 : Image de base légère avec Python
FROM python:3.10-slim

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier le fichier requirements.txt et installer les dépendances
COPY requirements.txt .

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Étape 4 : Copier tout le reste du projet
COPY . .


# Étape 6 : Exposer le port utilisé par Gradio
EXPOSE 7860


ENV GRADIO_SERVER_NAME="0.0.0.0"


# Étape 7 : Lancer le script d'entrée
#CMD ["./entrypoint.sh"]
CMD ["python", "gradio_app.py"]

