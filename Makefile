PROJECT = "Node.js project"


all: install test server

lint: ;@echo "Syntax checks at ${PROJECT}....."; \
        test:lint

test: ;@echo "Testing ${PROJECT}....."; \
        npm run test

server: ;@echo "Starting ${PROJECT}....."; \
        npm start

install: ;@echo "Installing ${PROJECT}....."; \
        npm install


.PHONY: test server install lint
