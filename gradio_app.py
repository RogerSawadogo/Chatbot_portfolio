import os
from dotenv import load_dotenv
import gradio as gr

from app.rag import create_index, load_index_and_docs
from app.generator import generate_response_deepseek

# === Charger les variables d'environnement ===
load_dotenv()
API_KEY = os.getenv("API_KEY")

# === Créer l'index FAISS si nécessaire ===
if not (os.path.exists('index.faiss') and os.path.exists('docs.pkl')):
    create_index('data/data.txt')

# === Charger le modèle d'embedding, l'index et les documents ===
embedding_model, index, docs = load_index_and_docs()

# === Fonction appelée par l'interface Gradio ===
def chat_with_roger(message, history):
    answer, _ = generate_response_deepseek(message, embedding_model, index, docs, API_KEY)
    # Retourne uniquement la réponse pour l'affichage
    return answer

# === Lancer l'interface Gradio ===
if __name__ == "__main__":
    gr.ChatInterface(
        fn=chat_with_roger,
        title="RogerBot 🤖 (powered by Roger)",
        description="Pose ta question à Roger !",
        theme=gr.themes.Soft(primary_hue="indigo"),
        examples=["Qui est Roger ?", "Quelles sont ses compétences ?"]
    ).launch()
