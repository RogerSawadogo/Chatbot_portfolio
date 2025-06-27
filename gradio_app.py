import gradio as gr
import requests

def chat_with_roger(message, history):
    response = requests.post("http://localhost:8000/chat", json={"message": message, "history": history})
    return response.json()["response"]

gr.ChatInterface(
    fn=chat_with_roger,
    title="Roger le bot",
    theme="default",
    submit_btn="Envoyer",
).launch()
