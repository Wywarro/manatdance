PROJECT_NAME ?= Manatdance

.PHONY: vue flask electron hello

hello:
	echo hello

vue:
	cd ./manatdance.client && npm run serve

flask:
	cd ./manatdance.client/manatdance.api && python main.py

electron:
	cd ./manatdance.client && npm run electron:serve
