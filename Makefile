PYTHON=python

check-api:
	@echo "🔍 Vérification de la clé OpenRouter..."
	@$(PYTHON) scripts/check_api.py

deploy:
	@echo "🚀 Déploiement vers Hugging Face Space..."
	@rm -rf hf_space
	@git clone https://huggingface.co/spaces/Rimro/RogersBot hf_space
	@rsync -av --exclude='.git' --exclude='.github' --exclude='tests' ./ hf_space/
	@cd hf_space && \
	git config user.name "GitHub Actions" && \
	git config user.email "actions@github.com" && \
	git add . && \
	(git commit -m "Auto-deploy from GitHub Actions" || echo "No changes to commit") && \
	git push origin main
