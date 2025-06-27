# Étape 1 : Image de base légère avec Python
FROM python:3.10-slim

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier le fichier requirements.txt et installer les dépendances
COPY requirements.txt .

# Installer les dépendances système nécessaires (FAISS ou autres)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Étape 4 : Copier tout le reste du projet
COPY . .

# Étape 5 : Exposer le port utilisé par FastAPI (7860 sur Hugging Face)
EXPOSE 7860

# Étape 6 : Lancer le serveur FastAPI avec uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]
