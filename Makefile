PYTHON=python

check-api:
	@echo "🔍 Vérification de la clé OpenRouter..."
	@$(PYTHON) scripts/check_api.py
