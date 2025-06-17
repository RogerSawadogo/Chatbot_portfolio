from openai import OpenAI
from dotenv import load_dotenv
import os

load_dotenv()

api_key = os.getenv("API_KEY_LLAMA")

if not api_key:
    raise ValueError("❌ API_KEY_LLAMA missing in .env")

client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=api_key,
)

try:
    completion = client.chat.completions.create(
        extra_headers={
            "HTTP-Referer": "https://example.com",
            "X-Title": "RogerBot",
        },
        extra_body={},
        model="meta-llama/llama-3.3-8b-instruct:free",
        messages=[
            {"role": "user", "content": "Ping test"}
        ]
    )

    print("✅ Réponse API :", completion.choices[0].message.content)

except Exception as e:
    print("❌ Échec de la vérification de l'API :", str(e))
    exit(1)
