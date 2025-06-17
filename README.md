---
title: RogerBot 🤖
emoji: 🤖
colorFrom: indigo
colorTo: blue
sdk: gradio
app_file: gradio_app.py
pinned: false
---

## 🤖 RogerBot

Bienvenue dans **RogerBot**, un assistant alimenté par un moteur RAG (Retrieval-Augmented Generation) avec LLaMA-3 ou un autre LLM via OpenRouter.

Pose-lui des questions, il ira chercher dans ses documents pour te répondre avec précision.

### 🚀 Fonctionnalités

- 🔍 Recherche contextuelle dans tes données (`data.txt`)
- 💬 Interface Gradio simple
- 🧠 Réponses générées par LLM via OpenRouter
- 🔐 Intégration avec clé API (OpenRouter)

### 📁 Fichiers clés

- `app.py` – Point d’entrée Gradio
- `app/rag.py` – Logique d’indexation et de recherche
- `app/generator.py` – Génération des réponses via LLM
- `data/data.txt` – Corpus de connaissances
- `.env` – Contient ta clé API (non inclus dans le dépôt public)

### 🛠️ Déploiement sur Hugging Face

Ce Space est automatiquement déployé depuis GitHub via CI/CD.
Le modèle est gratuit via OpenRouter (Meta LLaMA 3-8B Instruct).

---

Check out the configuration reference at 👉 https://huggingface.co/docs/hub/spaces-config-reference
